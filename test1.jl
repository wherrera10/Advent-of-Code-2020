print4(t::Tuple{Int,Int,Int,Int}) = print("$(t[1])$(t[2])$(t[3])$(t[4])")

println("How many?")
r = match(r"\D*(\d+)\D*(\d+)", readline())
print("cows $(r.captures[2]), bulls $(r.captures[1]).")

