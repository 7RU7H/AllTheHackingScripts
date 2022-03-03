import base64
# Simple program that base64 encodes a provided username.
# Concatenates it with a ":" and password from a wordlist
USER = input("Please enter a username: ")
WORDLIST = open("test.txt", "r")
OUTPUT = ("newlist.txt", "x")

with open("newlist.txt", "a") as file:
    for password in WORDLIST:
        mash = (USER, password)
        concat = ":".join(mash)
        encodedBytes = base64.b64encode(concat.encode("utf-8"))
        b64Str = str(encodedBytes, "utf-8")
        file.write(f"{b64Str}\n")
