function partone(input, limit)
    baselen = length(input)
    for i in 1:limit
        if i > baselen
            n = length(input)
            lastone = findlast(x -> x == input[n], input[1:n-1])
            if lastone == nothing
                push!(input, 0)
            else
                push!(input, n - lastone)
            end
        end
    end
    return input[limit]
end

println("Part 1: ", partone([9,6,0,10,18,2,1], 2020))

function parttwo(input, limit)
    dict, baselen, lastseen = Dict{Int, Int}(), length(input), -1
    for i in 1:limit
        if i <= baselen
            dict[lastseen] = i - 1
            lastseen = input[i]
        else
            if (lastone = get(dict, lastseen, -1)) != -1
                newlastseen = i - lastone - 1
            else
                newlastseen = 0
            end
            dict[lastseen] = i - 1
            lastseen = newlastseen
        end
    end
    return lastseen
end

println("Part 2: ", parttwo([9,6,0,10,18,2,1], 30000000))
