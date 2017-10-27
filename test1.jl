


println("How many?")
r = match(r"\D*(\d+)\D*(\d+)", readline())
print("cows $(r.captures[2]), bulls $(r.captures[1]).")

