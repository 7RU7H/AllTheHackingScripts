#!/bin/bash

# Added some of the flair from https://github.com/Emanlui/OSCP-Scripts/blob/main/nmap.sh

if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <target address> <base project location>"
		exit
fi

# Run a port scan and output error, if require -Pn to err file
sudo -p- -n --min-rate 1000 -oN ports $1 2>&1 > /tmp/nmap-err

output=$(cat err)
echo $output

if [[ "$output" == *"try -Pn"* ]]; then
	nmap_pn_flag = "-Pn"

else
	nmap_pn_flag = "" 
fi
rm /tmp/nmap-err

open=$(cat $1/nmap/ports | grep "open" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')
closed=$(cat $1/nmap/ports | grep "closed" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')
filtered=$(cat $1/nmap/ports| grep "filter" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')

echo "Open ports : " $open
echo "Closed ports : " $closed
echo "Filtered ports : " $filtered

sudo nmap $nmap_pn_flag -sC -sV -oA $2/nmap/Extensive --min-rate 1000 -p{$open::-1} $1
wait
sudo nmap $nmap_pn_flag -script discovery -oA $2/nmap/Discovery --min-rate 1000 -p{$open::-1} $1 
wait
sudo nmap $nmap_pn_flag --script vuln -oA $2/nmap/Vuln --min-rate 1000 -p{$open::-1} $1
wait
sudo nmap $nmap_pn_flag -sU -oA $2/nmap/UDP --min-rate 1000 -p{$poen::-1} $1
wait



