#!/bin/bash

pyenv shell 2.7.18
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
wait
sudo python2 get-pip.py
wait
sudo pip2 install -U setuptools
wait
sudo pip2 install impacket
wait
exit

