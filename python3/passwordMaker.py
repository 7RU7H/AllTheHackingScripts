import hashlib
#import sha512_crypt

#pip install sha512_crypt

# Random salts, ordering more hashtypes
print("Create a salted or unsalted password hash")
print("Hashes avaliable: sha1, sha256, sha512, soon sha512_crypt")
hashtype = input("Enter a hash type: ")
password = input("Enter a password: ")
salt = input("Enter a salt: ")
currHash = {
        "PASS": "",
        "SALT": "",
        }
currHash["PASS"] = password
currHash["SALT"] = salt 
delim = ":"

cleartext = delim.join(currHash)

if hashtype != "":
    if hashtype == "sha1":
        digest = hashlib.sha(cleartext.encode()).hexdigest()
    elif hashtype == "sha256":
        digest = hashlib.sha256(cleartext.encode()).hexdigest()
    elif hashtype == "sha512":
        digest = hashlib.sha512(cleartext.encode()).hexdigest()
    #elif hashtype == "sha512_crypt":
    #    digest = sha512_crypt.encrypt(cleartext)
    else:
        print(f"[-] {hashtype} Not a valid hash type")
else:
    print("[-] Empty hash type input")

print(f"Your password: {password} and salt: {salt}")
print(f"Your hash digest is: {digest}")
exit()
