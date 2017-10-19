using Requests

const TARGET = "http://google.com/"

"""
    query(binstr, targ)
Do http get query for testing 
"""
function query(targ)
    req = get(targ)                     # Send HTTP request to server
    status = req.status
    print("Response code: $status\n")
    return status
end

arr = zeros(Integer, 10)
Threads.@threads for i in 1:10
#for i in 1:10
	arr[i] = query(TARGET)
end

print("Result: $arr")

