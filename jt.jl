#=
function johnsontrottermove!(ints, isleft)
    len = length(ints)
    function ismobile(pos)
        if isleft[pos] && (pos > 1) && (ints[pos-1] < ints[pos])
            return true
        elseif !isleft[pos] && (pos < len) && (ints[pos+1] < ints[pos])
            return true
        end
        false
    end
    function maxmobile()
        arr = [ints[pos] for pos in 1:len if ismobile(pos)]
        if isempty(arr)
            0, 0
        else
            maxmob = maximum(arr)
            maxmob, findfirst(x -> x == maxmob, ints)
        end
    end
    function directedswap(pos)
        tmp = ints[pos]
        tmpisleft = isleft[pos]
        if isleft[pos]
            ints[pos] = ints[pos-1]; ints[pos-1] = tmp
            isleft[pos] = isleft[pos-1]; isleft[pos-1] = tmpisleft
        else
            ints[pos] = ints[pos+1]; ints[pos+1] = tmp
            isleft[pos] = isleft[pos+1]; isleft[pos+1] = tmpisleft
        end
    end
    (moveint, movepos) = maxmobile()
    if movepos > 0
        directedswap(movepos)
        for (i, val) in enumerate(ints)
            if val > moveint
                isleft[i] = !isleft[i]
            end
        end
        ints, isleft, true
    else
        ints, isleft, false
    end
end

function johnsontrotter(low, high)
    ints = collect(low:high)
    isleft = [true for i in ints]
    firstconfig = copy(ints)
    iters = 0
    while true
        iters += 1
        println("$ints $(iters & 1 == 1 ? "+1" : "-1")")
        if johnsontrottermove!(ints, isleft)[3] == false
            break
        end
    end
    println("There were $iters iterations, and this is the same as $(high-low+1) factorial, or $(factorial(high-low+1)).")
end

johnsontrotter(1,6)

=#

function johnsontrotter(low, high)
    function jtmove!(ints)
        println("ints are now $ints")
        sequences = []
        if !isempty(ints)
            endint = ints[end]
            smallerseq = ints[1:end-1]
            for (i,intseq) in enumerate(jtmove!(smallerseq))
                println("intseq now $intseq")
                if isempty(intseq)
                    push!(sequences, [endint])
                else
                    for pos in (i & 1 == 0 ? (length(intseq):-1:1) : (1:length(intseq)))
                        newseq = insert!(copy(intseq),pos,endint)
                        push!(sequences, newseq)
                    end
                end
            end
        end
        println(sequences)
        sequences
    end
    intseq = collect(low:high)
    ["""$item, $(i & 1 == 1 ? "-1" : "+1")\n""" for (i,item) in enumerate(jtmove!(intseq))]
end

println(johnsontrotter(1,4))

