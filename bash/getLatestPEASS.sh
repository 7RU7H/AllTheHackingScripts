#!/bin/bash
# PEASS-NG - https://github.com/carlospolop/PEASS-ng

# A Script to download some the latest PEASS

curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o linpeas.sh
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat -o winPEAS.bat 
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany.exe -o winPEASany.exe
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe -o winPEASany_ofs.exe
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -o winPEASx64.exe
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64_ofs.exe -o winPEASx64_ofs.exe
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe -o winPEASx86.exe
wait
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86_ofs.exe -o winPEASx86_ofs.exe
wait
echo "Downloaded some of the PEASS-NG scripts"
exit 
