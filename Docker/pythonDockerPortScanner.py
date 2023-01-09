#!/usr/bin/python3
import socket   
host = "" # Set to default gateway   
portList = [21,22,53,80,443,3306,8443,8080]   
for port in portList:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.connect((host,port))
            print("Port ", port, " is open")   
        except:
            print("Port ", port, " is closed")

