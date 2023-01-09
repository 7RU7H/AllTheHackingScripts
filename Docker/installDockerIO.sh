#!/bin/bash

if [[ "$EUID" = 0 ]]; then
	echo "You are required to run this script as intended user, with sudo"
	exit
fi
sudo apt update
wait
sudo apt upgrade
wait
sudo apt install -y docker.io
wait
sudo systemctl enable docker --now
wait
sudo usermod -aG docker $USER
echo ""
echo "You need to logout!"
echo ""
