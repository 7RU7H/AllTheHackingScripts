from struct import pack

nop = '\x90'
junk = '\xCC' # graceful break
buf =  b""
# buf += ""

offset = #
payloadSize = offset + #8
rip = #0xinstuction-pointer
nopSled = 0* nop # amount of nops
bufSize = len(buf)
nopSize = len(nopSled)
padding = 'A' * (payloadSize - bufSize - nopSize)
payload = nopSled + buf + padding + pack("<Q", rip)

print(payload)
