


println("How many?")
x = readline()
r = match(r"\D*(\d+)\D*(\d+)", x)
println(r)
print("cows $(r.captures[2]), bulls $(r.captures[1]).")

