import http.client
conn = http.client.HTTPConnection("api.ipify.org")
conn.request("GET", "/")
r1 = conn.getresponse()
print('{"my_ip": "%s"}' % r1.read().strip().decode('ascii'), end='')
conn.close()
