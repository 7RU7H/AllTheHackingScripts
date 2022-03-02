import urllib.parse

print("Hello welcome to nvm's urlEncoder script. Please enter a string you wish to encode:\n")
INPUT = input()
print(urllib.parse.quote(INPUT))
exit()
