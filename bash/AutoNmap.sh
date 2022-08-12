#!/bin/bash


if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <target address> <base project location>"
		exit
fi

sudo nmap -sC -sV -oA $2/nmap/Extensive --min-rate 1000 -p- $1
wait
sudo nmap --script discovery -oA $2/nmap/Discovery --min-rate 1000 -p- $1 
wait
sudo nmap --script vuln -oA $2/nmap/Vuln --min-rate 1000 -p- $1
wait
sudo nmap -sU -oA $2/nmap/UDP --min-rate 1000 -p- $1
wait



