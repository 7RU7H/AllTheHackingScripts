#!/bin/bash

printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list
wait
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg
wait
sudo apt update
wait
sudo apt upgrade
wait
sudo apt install -y docker-ce docker-ce-cli containerd.io
wait
