#!/bin/bash

apt install gem;
apt install python3;
apt-get install python3-setuptools python3-tk python3-pip;
pip3 install --upgrade pip;
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec
apt install redis-tools;
apt install smbclient;
apt install hexedit;
# apt update; apt install metasploit-framework; -msf5 ! on attackbox
git clone https://github.com/ShawnDEvans/smbmap.git;
git clone https://github.com/rebootuser/LinEnum.git;
git clone https://github.com/sc0tfree/mentalist;
cd mentalist/; python3 setup.py install;
wait; cd -;
git clone https://github.com/digininja/CeWL;
pip3 install stegoveritas;
stegoveritas_install_deps;
cd CeWL/; gem install bundler; bundle install
wait; cd -;

