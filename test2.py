

import threading
import urllib2
import time

def send_request(url, count_str):
    start_time = time.time()
    urllib2.urlopen(url)
    print "Request " + count_str + " took " + str(time.time() - start_time) + " started at " + str(start_time)

count = 0
for url in open('urllist.txt'):
    t = threading.Thread(target=send_request, args = (url.strip(), str(count)))
    t.start()
    count+=1
