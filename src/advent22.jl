input = """
Player 1:
14
6
21
10
1
33
7
13
25
8
17
11
28
27
50
2
35
49
19
46
3
38
23
5
43

Player 2:
18
9
12
39
48
24
32
45
47
41
40
15
22
36
30
26
42
34
20
16
4
31
37
44
29
"""

input2 = """
Player 1
9
2
6
3
1
Player 2
5
8
4
7
10
"""

function getinput()
    lines = filter(x -> length(x) > 0, strip.(split(input, "\n")))
    player2line = findfirst(line -> line[1] == 'P' && line[8] == '2', lines)
    deck1 = map(s -> parse(Int, s), lines[2:player2line-1])
    deck2 = map(s -> parse(Int, s), lines[player2line+1:end])
    return deck1, deck2
end

function scorewinner(deck)
    score = 0
    for (i, n) in enumerate(reverse(deck))
        score += i * n
    end
    return score
end

function part1()
    deck1, deck2 = getinput()
    while length(deck1) > 0 && length(deck2) > 0
        c1, c2 = popfirst!(deck1), popfirst!(deck2)
        if c1 > c2
            deck1 = vcat(deck1, [c1, c2])
        elseif c2 > c1
            deck2 = vcat(deck2, [c2, c1])
        end
    end
    score = scorewinner(isempty(deck2) ? deck1 : deck2)
    println("Part 1: ", score)
end

part1()

const pastrounds = Dict{String, Int}()

function recursivecombat!(deck1, deck2)
    while length(deck1) > 0 && length(deck2) > 0
        if haskey(pastrounds, "$deck1 $deck2")
            return 1
        else
            pastrounds["$deck1 $deck2"] = 1
        end
        c1, c2 = popfirst!(deck1), popfirst!(deck2)
        if c1 <= length(deck1) && c2 <= length(deck2)
            newdeck1, newdeck2 = deck1[1:c1], deck2[1:c2]
            if recursivecombat!(newdeck1, newdeck2)[1] == 1
                deck1 = vcat(deck1, [c1, c2])
            else
                deck2 = vcat(deck2, [c2, c1])
            end
        else
            if c1 > c2
                deck1 = vcat(deck1, [c1, c2])
            elseif c2 > c1
                deck2 = vcat(deck2, [c2, c1])
            end
        end
    end
    return (isempty(deck2) ? 1 : 2), deck1, deck2
end

function part2()
    deck1, deck2 = getinput()
    winner, d1, d2 = recursivecombat!(deck1, deck2)
    print("Part 2: ", scorewinner(winner == 1 ? d1 : d2))
end

part2()
