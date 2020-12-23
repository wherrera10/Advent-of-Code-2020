input = """925176834"""
const cups = [parse(Int, c) for c in input]

# a bit slow with double linked list, could be faster with just forward links

function move(currentcup, cuplist, maxval)
    l, r = cuplist[currentcup]
    rcup1 = r
    rcup2 = cuplist[rcup1][2]
    rcup3 = cuplist[rcup2][2]
    rightend = cuplist[rcup3][2]
    cuplist[currentcup] = [l, rightend]
    removed = [rcup1, rcup2, rcup3]
    cuplist[rightend] = [currentcup, cuplist[rightend][2]]
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
    ldest, rdest = cuplist[destval]
    cuplist[destval] = [ldest, rcup1]
    cuplist[rcup1] = [destval, rcup2]
    cuplist[rcup3] = [rcup2, rdest]
    cuplist[rdest] = [rcup3, cuplist[rdest][2]]
    return cuplist[currentcup][2]
end

function part1()
    len = length(cups)
    cuplist = [[0, 0] for _ in 1:len]
    for (i, n) in enumerate(cups)
        cuplist[n] = (i == 1) ? [cups[end], cups[2]] : i == len ? [cups[len-1], cups[1]] : 
                                [cups[i - 1], cups[i + 1]]
    end
    currentpos = cups[1]
    for _ in 1:100
        currentpos = move(currentpos, cuplist, len)
    end
    print("Part 1: ")
    l, r = cuplist[1]
    for _ in 1:len-1
        print(r)
        l, r = cuplist[r]
    end
    println()
end

part1()

function part2()
    len = 1_000_000
    nextnum = maximum(cups) + 1
    a = [cups; nextnum:len]
    cuplist = [[i - 1, i + 1] for i in 1:len]
    for (i, n) in enumerate(cups)
        cuplist[n] = (i == 1) ? [len, cups[2]] : i == length(cups) ? [cups[end-1], nextnum] : 
                                [cups[i - 1], cups[i + 1]]
    end
    cuplist[end] = [len - 1, cups[1]]
    currentcup = cups[1]
    @time for _ in 1:10_000_000
        currentcup = move(currentcup, cuplist, len)
    end
    l, c1 = cuplist[1]
    l, c2 = cuplist[c1]
    println("Part 2: $c1 * $c2 = $(c1 * c2)")
end

part2()
