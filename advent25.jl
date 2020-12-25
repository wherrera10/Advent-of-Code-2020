const input = """
10212254
12577395
"""

const (card, door) = 10212254, 12577395

function transform(subject, loopsize)
    v = 1
    for _ in 1:loopsize
        v = rem(subject * v, 20201227)
    end
    return v
end

function findloopsize(subject, target)
    i, v = 1, 1
    while true
        (v = rem(subject * v, 20201227)) == target && break
        i += 1
    end
    return i, v
end

pubkey(loopsize) = transform(7, loopsize)

function part1()
    cloops, v1 = findloopsize(7, card)
    dloops, v2 = findloopsize(7, door)
    println("Part 1: ", cloops, " ", dloops, "  ", transform(card, dloops), " ", transform(door, cloops))
end

part1()
