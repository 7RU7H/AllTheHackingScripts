#!/bin/bash

apt install gem golang-go python3;
apt-get install python3-setuptools python3-tk python3-pip;
pip3 install --upgrade pip;
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec
apt install redis-tools smbclient hexedit
apt upgrade -y
export PATH=$PATH:/usr/local/go/bin

# apt update; apt install metasploit-framework; -msf5 ! on attackbox
git clone https://github.com/ShawnDEvans/smbmap.git;
git clone https://github.com/rebootuser/LinEnum.git;
git clone https://github.com/sc0tfree/mentalist;
cd mentalist/; python3 setup.py install;
wait; cd -;
pip3 install stegoveritas;
stegoveritas_install_deps;
wait; 

go install github.com/hakluke/hakrawler@latest
echo "alias='/go/bin/hakrawler'" >> .bashrc
