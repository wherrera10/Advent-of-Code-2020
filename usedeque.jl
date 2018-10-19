using Random, DataStructures

const size = 4
const puzzle = string.(reshape(1:16, size, size))
puzzle[16] = " "
findtile(board, t) = findfirst(x->x == t, board)
findhole(board) = findtile(board, " ")
const psoln = Dict{Array{String, 2}, Array{String,1}}()
const pque = Deque{Array{String,2}}()

function issolvable(board)
    tpuzz = copy(board)
    inversioncount = 1
    asint(x) = (tpuzz[x] == " ") ? 0 : parse(Int64, tpuzz[x])
    for i in 1:size^2-1, j in i:size^2
        if tpuzz[i] == " " || tpuzz[j] == " "
            continue
        end
        if parse(Int, tpuzz[i]) < parse(Int, tpuzz[j])
            inversioncount += 1
        end
    end
    if size % 2 == 1
        return inversioncount % 2 == 0
    end
    pos = findhole(tpuzz)
    inversioncount += pos[2]
    return inversioncount & 1 == 0
end

function nexttohole(board)
    holepos = findhole(board)
    row = holepos[1]
    col = holepos[2]
    if row == 1
        if col == 1
            return [[row, col + 1], [row + 1, col]]
        elseif col == size
            return [[row, col - 1], [row + 1, col]]
        else
            return [[row, col - 1], [row, col + 1], [row + 1, col]]
        end
    elseif row == size
        if col == 1
            return [[row - 1, col], [row, col + 1]]
        elseif col == size
            return [[row - 1, col], [row, col - 1]]
        else
            return [[row - 1, col], [row, col - 1], [row, col + 1]]
        end
    else
        if col == 1
            return [[row - 1, col], [row, col + 1], [row + 1, col]]
        elseif col == size
            return [[row - 1, col], [row, col - 1], [row + 1, col]]
        else
            return [[row - 1, col], [row, col - 1], [row, col + 1], [row + 1, col]]
        end
    end
end

possiblemoves(board) = map(pos->board[pos[1], pos[2]], nexttohole(board))

function printboard(board)
    ppuz(x,y) = print(lpad(rpad(board[x,y], 3), 4), "|")
    print("+----+----+----+----+\n|")
    for j in 1:size, i in 1:size
        ppuz(i,j)
        if i == size
            print("\n")
            if j < size
                 print("|")
            end
        end
    end
    println("+----+----+----+----+")

end

solved(board) = (board[1:15] == string.(1:15))

function announcesolution(board)


end

function solve(board)
    puzzle .= string.(board)
    puzzle[findtile(puzzle, "0")] = " "
    printboard(puzzle)
    if issolvable(puzzle)
        println("This puzzle is solvable.")
        breadthfirst(puzzle, Array{String, 1}())
    else
        println("This puzzle is not solvable.")
    end
end

function breadthfirst(board, movelist)
    if solved(board)
        announcesolution(board)
    else
        singledepth(board, movelist)
        while length(pque) > 0
            bd = popfirst!(pque)
            singledepth(bd, psoln[bd]) # will usually add to dequeue
        end
    end
    return
end

function singledepth(board, movelist)
    pmoves = possiblemoves(board)
    for mv in pmoves
        spos = findhole(board)
        mpos = findtile(board, mv)
        newboard = copy(board)
        newboard[spos] = mv
        newboard[mpos] = " "
        if solved(newboard)
            announcesolution(newboard)
            return
        elseif haskey(psoln, newboard)
            continue
        else
            newmovelist = copy(movelist)
            push!(newmovelist, mv)
            psoln[newboard] = newmovelist
            push!(pque, newboard)
        end
    end
end

function announcesolution(board)

end

puzzleboard = [[15 14 1 6]; [9 11 4 12]; [0 10 7 3]; [13 8 5 2]]'
solve(puzzleboard)
