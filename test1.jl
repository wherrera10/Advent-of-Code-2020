

println("How many?")
x = readline()
r = match(r"\s*\w+[:]*\s*(\d+)\s*\w+[:]*\s*(\d+)", x)
print("cows $(r.captures[2]), bulls $(r.captures[1]).")
