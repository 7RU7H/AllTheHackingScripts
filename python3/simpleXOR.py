#!/usr/bin/python3
# offsec
from itertools import cycle

key = 'K'
message = 'text to encrypt'

cryptedMessage = ''.join(chr(ord(c)^ord(k)) for c,k in zip(message, cycle(key)))

print(cryptedMessage)
print(cryptedMessage.encode())

plaintext = ''.join(chr(ord(c)^ord(k)) for c,k in zip(cryptedMessage, cycle(key)))

print(plaintext)
