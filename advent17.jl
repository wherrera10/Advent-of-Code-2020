input = """
.#.#.#..
..#....#
#####..#
#####..#
#####..#
###..#.#
#..##.##
#.#.####
"""

input2 = """
.#.
..#
###
"""

const pocket3D = zeros(Bool, 100, 100, 100)
for (i, line) in enumerate(split(input)), (j, char) in enumerate(line)
    pocket3D[50 + i, 50 + j, 50] = (char == '#')
end

function neighbor3(x, y, z)
    return filter(p -> (p[1] != x) || (p[2] != y) || (p[3] != z), collect(
        Iterators.product(x-1:x+1, y-1:y+1, z-1:z+1)))
end

activenearby3(x, y, z) = sum(v -> pocket3D[v[1], v[2], v[3]] == true, neighbor3(x, y, z))

for step in 1:6
    cubecopy = deepcopy(pocket3D)
    for i in 5:95, j in 5:95, k in 5:95
        active = activenearby3(i, j, k)
        cube = pocket3D[i, j, k]
        if cube
            if !(2 <= active <= 3)
                cubecopy[i, j, k] = false
            end
        elseif active == 3
            cubecopy[i, j, k] = true
        end
    end
    pocket3D .= cubecopy
end

println("Part 1: ", sum(pocket3D))

const pocket4D = zeros(Bool, 40, 40, 40, 40)
for (i, line) in enumerate(split(input)), (j, char) in enumerate(line)
    pocket4D[20 + i, 20 + j, 20, 20] = (char == '#')
end

function neighbor4(x, y, z, w)
    return filter(p -> (p[1] != x) || (p[2] != y) || (p[3] != z) || (p[4] != w), collect(
        Iterators.product(x-1:x+1, y-1:y+1, z-1:z+1, w-1:w+1)))
end

activenearby4(x, y, z, w) = sum(v -> pocket4D[v[1], v[2], v[3], v[4]] == true, neighbor4(x, y, z, w))

for step in 1:6
    cubecopy = deepcopy(pocket4D)
    for i in 5:35, j in 5:35, k in 5:35, l in 5:35
        active = activenearby4(i, j, k, l)
        cube = pocket4D[i, j, k, l]
        if cube
            if !(2 <= active <= 3)
                cubecopy[i, j, k, l] = false
            end
        elseif active == 3
            cubecopy[i, j, k, l] = true
        end
    end
    pocket4D .= cubecopy
end

println("Part 2: ", sum(pocket4D))
