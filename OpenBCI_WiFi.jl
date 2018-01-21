#=
OpenBCI_WiFi.jl
@Author: William Herrera
@Version: 0.01
@Copyright William Herrera, 2018
@Created: 16 Jan 2018
@Purpose: EEG WiFi routines using OpenBCI Arduino hardware
=#

using Logging
using EDFPlus
using Requests
import Requests: get, post, get_streaming


"""
See http://docs.openbci.com/Hardware/03-Cyton_Data_Format#cyton-data-format-binary-format
The ganglion data is same as cyton when hooked to wifi board except that only the
first 4 channels have data, with others specified to be 0
"""
const SAMPLERATE = 250.0        # Hz, the default fs for ganglion
const STARTBYTE = 0xA0          # start of 33 byte data packet
const ENDBYTE = 0xC0            # end of 33 byte data packet
const INT24MINIMUM = -8388608   # digital minimum
const INT24MAXIMUM =  8388607   # digital maximum

# MCP3912 http://ww1.microchip.com/downloads/en/DeviceDoc/20005348A.pdf
const scale_fac_uVolts_per_count = 1.2 * 8388607 * 1.5 * 51.0 # MCP3912 pdf, table 7

# accelerometer conversion factor
const scale_fac_accel_G_per_count = 0.032  # 0.032 G or 32 mG per accelerometer unit

# default port number for receiving streaming data: obscure zenginkyo-1 is 5020
const DEFAULT_STREAM_PORT = 5020

# Commands for in SDK http://docs.openbci.com/software/01-Open BCI_SDK
const command_stop = "s"
const command_startText = "x"
const command_startBinary = "b"
const command_startBinary_wAux = "n"
const command_startBinary_4chan = "v"
const command_activateFilters = "F"
const command_deactivateFilters = "g"
const command_deactivate_channel = ["1", "2", "3", "4", "5", "6", "7", "8"]
const command_activate_channel = ["q", "w", "e", "r", "t", "y", "u", "i"]
const command_activate_leadoffP_channel = ["!", "@", "#", "\$", "%", "^", "&", "*"]    # shift + 1-8
const command_deactivate_leadoffP_channel = ["Q", "W", "E", "R", "T", "Y", "U", "I"]  # letters (plus shift) right below 1-8
const command_activate_leadoffN_channel = ["A", "S", "D", "F", "G", "H", "J", "K"]    # letters (plus shift) below the letters below 1-8
const command_deactivate_leadoffN_channel = ["Z", "X", "C", "V", "B", "N", "M", "<"]  # letters (plus shift) below the letters below the letters below 1-8
const command_biasAuto = "`"
const command_biasFixed = "~"
const sratecommands = Dict(25600 =>'0', 12800 =>'1', 6400 =>'2', 3200 =>'3', 1600=>'4', 800=>'5', 400=>'6', 200=>'7')


function postwrite(server, command)
    resp = post("$server/command"; json=Dict("command"=>command))
    if statuscode(resp) == 200
        info("comman was $command, response was readstring(resp)")
    else
        warn("failed to get proper response from $server after command $command")
    end
end


stop(server) = postwrite(server,command_stop)           # stop streaming "s"
softreset(server) = postwrite(server, "v")              # reset peripherals only
start(server) = postwrite(server, command_startBinary)  # 'b', binary streaming should now start
getfs(server) = postwrite(server, "~~")                 # reply is sample rate
setnonstandardfs(server, srate=200) = postwrite(server, sratecommands[srate])
getregisters(server) = postwrite(server, "?")
enablechannels(server, chan=[1,2,3,4]) = for i in chan postwrite(server, b"qwer"[i]) end
disablechannel(server, chan) = postwrite(server,chan)
startsquarewave(server) = postwrite(server, "[")
stopsquarewave(server) = postwrite(server, "]")
startimpedancetest(server) = postwrite(server, "z")
stopimpedancetest(server) = postwrite(server, "Z")
startaccelerometer(server) = postwrite(server, "n")
stopaccelerometer(server) = postwrite(server, "N")
startSDlogging(server) = postwrite(server, "J")         # up to 4 hrs unless stopped!
stopSDlogging(server) = postwrite(server, "j")          # one hour max default
attachshield(server) = postwrite(server, "{")
detachshield(server) = postwrite(server, "}")
resetshield(server) = postwrite(server,";")


mutable struct GanglionBoardSettings
    channel1active::Bool
    channel2active::Bool
    channel3active::Bool
    channel4active::Bool
    usingaccelerometer::Bool
    loggingSDcard::Bool
    Wificonnected::Bool
    sythsquarewave::Bool
    impedancetesting::Bool
    sendingdata::Bool
    srate:Int
end


function configureganglion(serveraddress, portnum, fs, useaccelerometer, latency, logSD)
    resp = post("$serveraddress/tcp"; json = Dict("ip" =>getipaddr(),
               "port"=>portnum, "output"=>"raw", "latency"=>latency))
    if statuscode(resp) == 200
        tcpinfo = Requests.json(resp)
        if tcpinfo["connected"]
            info("Wifi shield TCP server, command connection established")
        else
            throw("TCP connection failure with $serveraddress")
        end
    end
    if fs != 250 && fs in [1600, 800, 400 , 200]
        setnonstandardfs(serveraddress, fs)
    end
    if logSD
        startSDlogging(serveraddress)
    else
        stopSDlogging(serveraddress)
    end
    if useaccelerometer
        startaccelerometer(serveraddress)
    else
        stopaccelerometer(serveraddress)
    end
end


function runimpedancetest(serveraddress)
    startimpedancetest(serveraddress)
    startimpedancetest(serveraddress)
end

"""
    rawganglionboard
Implement a raw OpenBCI WiFI shield connection.
Args:
ipnum       the ip number of the sheild
portnum     the port number
shieldname  the WiFi shield name
timeout     seconds for a timeout error
maxskip     maximum packets to skip
impedance   true if impedance check to be done
fs          sampling rate, usually 250 == SAMPLERATE
latency     latency in microseconds, time between packets, default 15 msec
logging     filename for logging to PC
logSD       true if should log to SD card
"""
function rawganglionboard(ipnum; portnum=DEFAULT_STREAM_PORT, timeout=5,
                          impedancetest=false, fs=250, useaccelerometer=false,
                          maketestwave=false, latency=15000, locallogging=false,
                          logSD=false)
    if locallogging
        Logging.configure(level=INFO)
        info("--- Logging starting session ---")
    else
        Logging.configure(level=WARNING)
    end
    serveraddress = "http://$ipnum"
    resp = get("$serveraddress/board", timeout=timeout)
    if statuscode(resp) == 200
        # expect: {"board_connected": true, "board_type": "string",
        # "gains": [ null ], "num_channels": 0}
        sysinfo = Requests.json(resp)
        info("board reports $sysinfo")
        if sysinfo["num_channels"] != 4
            warn("board reports $(sysinfo["num_channels"]) channels not 4")
        end
    end
    configureganglion(serveraddress, portnum, fs, useaccelerometer, latency, logSD)
    # if impedance test, do that for 15 seconds, store in records
    if impedancetest
        runimpedancetest(serveraddress)
    end
    if maketestwave
        startsquarewave(serveraddress)
    else
        stopsquarewave(serveraddress)
    end
    # now do data collection as a task that will terminate only when we tell it later
    # stop via exception when the channel is closed
    packetchannel = Channel(1280)
    bytes = b""
    get_streaming("$serveraddress/stream/start")
    numberofgets = 1
    sequentialtimeouts = 0
    @async(
        try
            while true
                wifisocket = connect(ipnum, portnum)
                while isopen(wifisocket)
                    bytes = vcat(bytes,readline(wifisocket))
                    if length(bytes) >= 33
                        put!(packetchannel, bytes[1:33])
                        bytes = bytes[34:end]
                        timer = time()
                        sequentialtimeouts = 0
                    else
                        if time() - timer > timeout
                            sequentialtimeouts += 1
                            break
                        end
                        yield()
                        sleep(latency/1000000)
                    end
                end
                # if we got here we may need to do a restart, but try a new get also
                if sequentialtimeouts > 2
                    warn("connection timeout, restarting connection")
                    stop(serveraddress)
                    configureganglion(serveraddress, portnum, fs, useaccelerometer, latency, logSD)
                end
                numberofgets += 1
                info("Redoing get for binary stream, will now have done get $numberofgets times")
                get_streaming("$serveraddress/stream/start")
            end
        catch
            # the semaphore has been closed most likely
            info("Exiting WiFi streaming task")
        end
    )
    # return the channel where the data packets will be stacked
    packetchannel
end


function startBDFPluswritefile(signalchannels, patientID, recording, patientcode,
                               gender, birthdate, patientname, patient_additional,
                               admincode, technician, equipment, recording_additional)
    bdfh = BEDFPlus()

    bdfh.writemode = true
    bdfh.version = "$(EDFPlus.version())"
    bdfh.edf = false
    bdfh.edfplus = false
    bdfh.bdf = false
    bdfh.bdfplus = true
    bdfh.discontinuous = false
    bdfh.filestatus = EDFPlus.BDFPLUS
    bdfh.channelcount = signalchannels + 1  # add 1 for the annotation channel
    bdfh.patient = patientID
    bdfh.recording = recording
    bdfh.patientcode = patientcode
    bdfh.gender = gender
    bdfh.birthdate = birthdate
    bdfh.patientname = patientname
    bdfh.patient_additional = patient_additional
    bdfh.admincode = admincode
    bdfh.technician = technician
    bdfh.equipment = equipment
    bdfh.recording_additional = recording_additional

    bdfh.annotation_channel = bdfh.channelcount
    bdfh
end


function setplustimenow(bdfh)
    datetime = now()
    bdfh.startdate_day = Dates.day(datetime)
    bdfh.startdate_month = Dates.month(datetime)
    bdfh.startdate_year = Dates.year(datetime)
    bdfh.startdate_second = Dates.second(datetime)
    bdfh.startdate_string = uppercase(Dates.format(datetime, "dd-u-yyyy"))
    return datetime
end


function ganglion4channelsignalparam(bdfh; smp_per_record=50,
                                     labels=["1", "2", "3", "4"],
                                     transtype="active electrode", physdim="uV",
                                     physmin=INT24MINIMUM, physmax=INT24MAXIMUM,
                                     prefilter="None")
    bdfh.signalParam = Array{ChannelParam,1}(4)
    for (i,parm) in enumerate(bdfh.signalParam)
        parm.label = labels[i]
        parm.transducer = transtype
        parm.physdimension = physdim
        parm.physicalminimum = physmin
        parm.physicalmaximum = physmax
        parm.digmin =
        parm.digmax =
        parm.smp_per_record = smp_per_record
        parm.prefilter= prefilter
        parm.digmin = -8388608
        parm.digmax = 8388607
        if i == 5
            parm.annotation = true
        end
    end
    bdfh.annotationchannel = 5
    bdfh
end


"""
    makerecord
Make a single record from signals at time rectime after start of recording.
Use the fifth (annotation) channel for the BDFPlus timestamp and for any accelerometer data.
Record is of 0.2 sec, so if data rate is 250 Hz, five channels is
3 bytes per datapoint * 250 * 0.2 * 5 = 750 bytes. The wifi server, commandet driver process
uses a separate task to fill a channel with the data in raw packet form to read here.
We only write one averaged accelerometer reading per 200 msec packet
Reclen must be multiple of 15 and should be a multiple of 30 to get best results.
"""
function makerecord(rectime, packetchannel, acceldata = true, reclen=750)
    if reclen % 15 != 0
        throw("makerecord record length not multiple of 15")
    end
    siglen = div(reclen, 5)
    chan1 = zeros(UInt8, siglen)
    chan2 = zeros(UInt8, siglen)
    chan3 = zeros(UInt8, siglen)
    chan4 = zeros(UInt8, siglen)
    chan5 = zeros(UInt8, siglen)
    annotpos = 1
    xaccel = yaccel = zaccel = numaccelpackets = 0
    for sigpos in 1:3:siglen-1
        data = take!(packetchannel)
        chan1[sigpos:sigpos+2] = data[3:5]
        chan2[sigpos:sigpos+2] = data[6:8]
        chan3[sigpos:sigpos+2] = data[9:11]
        chan4[sigpos:sigpos+2] = data[12:14]
        if sigpos == 1
            timestamp = EDFPlus.trimrightzeros(string(rectime))
            chan5[1:length(timestamp)+2] .= Array{UInt8,1}(timestamp) * b"\0x14\0x14\x00"
            annotpos += (length(timestamp) + 3)
        end
        # TODO: we can set the ganglion board to send button press data instead of accel data
        # this would be logged as a button press annotation in that record
        # assumes accelerometer data is the standard non-time-stamped version
        if acceldata && data[33] == 0xC0 && findfirst(data[27:32]) > 0
            xaccel += reinterpret(Int16, data[27:28])
            yaccel += reinterpret(Int16, data[29:30])
            zaccel += reinterpret(Int16, data[31:32])
            numaccelpackets += 1
        end
    end
    if acceldata
        xax = round(32.0 * xaccel / numaccelpackets, 4)
        yax = round(32.0 * yaccel / numaccelpackets, 4)
        zax = round(32.0 * zaccel / numaccelpackets, 4)
        atime = EDFPlus.trimrightzeros(string(rectime + reclen/(SAMPLERATE*15* 2)))
        annot = atime * "\x14$xax $yax $zax (x,y,z) accelerometer data in 1/1000 G units\x14"
        chan5[annotpos:annotpos+length(annot)] .= Array{UInt8,1}(annot)
    end
    vcat(chan1,chan2,chan3,chan4,chan5)
end

nilfunc(rec) = (return length(rec))

function makeganglionbdfplus(path, server, portnum;
                             packetinspector=nilfunc, packetlen=750,
                             packetinterval=0.2, maxpackets=3000)
    bdfh = startBDFPluswritefile()
    ganglion4channelsignalparam(bdfh)
    bdfh.BDFsignals = zeros(Int32,(maxpackets,packetlen))
    packetchannel = rawganglionboard(server, portnum)
    setplustimenow(bdfh)
    pcount = 0
    packettime = 0.0
    while pcount < maxpackets
        rec = makerecord(packettime, packetchannel)
        packetinspector(rec)
        bdfh.BDFsignals[pcount,:] = rec
        packettime += packetinterval
        pcount += 1
    end
    EDFPlus.writefile!(bdfh, path)
end
