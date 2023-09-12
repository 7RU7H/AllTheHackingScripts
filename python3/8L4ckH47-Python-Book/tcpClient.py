import socket

target_host = "" 
target_port =

#create a socket object
client = socket.socket(socke.AF_INET, socket.SOCK_STREAM)

#connect the client
client.connect((target_host,target_port))

#send some data
client.send(b"GET / HTTP/1.1\r\nHost: google.com\r\mn\r\n")

#recieve some data
response = client.recv(4096)

print(response.decode())
client.close()

