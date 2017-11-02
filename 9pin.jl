<pre>
If the nin-pin serial port is, as was descibed above:
1  2  3  4  5
6  7  8  9
                        9 pin
PG   Protective ground
TD   Transmitted data     3
RD   Received data        2
RTS  Request to send      7
CTS  Clear to send        8
DSR  Data set ready       6
SG   Signal ground        5
CD   Carrier detect       1
+ voltage (testing)

We can make the following code for a new serial port type (a type is a kind of struct or object in Julia).
We can re-use the existing base class BitArray type, a subtype of Julia's DenseArray:
</pre>
<code Julia>
mutable struct NinePinSerialPort
    pins::BitArray
    function NinePinSerialPort()
        this = new()
        pins = BitArray(9)
    end
end

const CD = 1
const RD = 2
const TD = 3
const SG = 5
const DSR = 6
const RTS = 7
const CTS = 8

port = NinePinSerialPort()

# Here we test the type's code.

println("Port is now at defaults, which are $port")
port[CTS] = true
println("CD pin of port, which is pin $CD, is now $(port[CD])")
println("CTS pin of port, which is pin $CTS, is now $(port[CTS])")
println("port is now: $port")
</lang>
{{output}}
<pre>
Port is now at defaults, which are Bool[false, false, false, false, false, false, false, false, false]
CD pin of port, which is pin 1, is now false
CTS pin of port, which is pin 8, is now true
port is now: Bool[false, false, false, false, false, false, false, true, false]
</pre>
