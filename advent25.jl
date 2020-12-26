const (card, door) = 10212254, 12577395

function transform(subject, loopsize)
    v = 1
    for _ in 1:loopsize
        v = rem(subject * v, 20201227)
    end
    return v
end

function findloopsize(subject, target)
    v = 1
    for i in 1:typemax(Int32)
        (v = rem(subject * v, 20201227)) == target && return i
    end
end

function part1()
    cloops = findloopsize(7, card)
    dloops = findloopsize(7, door)
    println("Part 1: ", cloops, " ", dloops, " answer: ", transform(card, dloops), " ", transform(door, cloops))
end

part1()
