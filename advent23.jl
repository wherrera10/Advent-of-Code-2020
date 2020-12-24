input = """925176834"""
const inputcups = [parse(Int, c) for c in input]

function move(currentcup, cuplist, maxval)
    rcup1 = cuplist[currentcup]
    rcup2 = cuplist[rcup1]
    rcup3 = cuplist[rcup2]
    rightend = cuplist[rcup3]
    cuplist[currentcup] = rightend
    removed = [rcup1, rcup2, rcup3]
    destval = currentcup - 1
    while destval in removed
        destval -= 1
    end
    if destval < 1
        destval = maxval
        while destval in removed
            destval -= 1
        end
    end
    rdest = cuplist[destval]
    cuplist[destval] = rcup1
    cuplist[rcup3] = rdest
    return cuplist[currentcup]
end

function part1()
 cups = deepcopy(inputcups)
    len = length(cups)
    cuplist = zeros(Int, len)
    for i in eachindex(cuplist)
        cuplist[cups[i]] = i == len ? cups[1] : cups[i + 1]
    end
    @show cuplist
    currentpos = cups[1]
    for _ in 1:10
        currentpos = move(currentpos, cuplist, len)
    end
    print("Part 1: ")
    r = cuplist[1]
    for _ in 1:len-1
        print(r)
        r = cuplist[r]
    end
end

part1()

function part2()
    cups = deepcopy(inputcups)
    len = 1_000_000
    cuplen = length(cups)
    cuplist = [i + 1 for i in 1:len]
    cuplist[end] = cups[1]
    for i in eachindex(cups)
        cuplist[cups[i]] = i == cuplen ? i + 1 : cups[i + 1]
    end
    currentcup = cups[1]
    for _ in 1:10_000_000
        currentcup = move(currentcup, cuplist, len)
    end
    c1 = cuplist[1]
    c2 = cuplist[c1]
    println("\nPart 2: $c1 * $c2 = $(c1 * c2)")
end

part2()
