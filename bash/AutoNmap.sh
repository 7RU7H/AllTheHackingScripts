#!/bin/bash

# Added some of the flair from https://github.com/Emanlui/OSCP-Scripts/blob/main/nmap.sh

if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <target address> <base project location>"
		exit
fi

if [[ "$EUID" = 0 ]]; then
    echo "(1) Currently root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "(2) Correct password"
    else
        echo "(3) Incorrect password"
        exit 1
    fi
fi

# Run a port scan and output error, if require -Pn to err file
sudo nmap -p- -n --min-rate 1000 -oN nmap/allPorts $1 2>&1 > /tmp/nmap-err

output=$(cat /tmp/err)
echo $output

if [[ "$output" == *"try -Pn"* ]]; then
	nmap_pn_flag="-Pn"

else
	nmap_pn_flag="" 
fi
rm /tmp/nmap-err

open=$(cat $2/nmap/allPorts | grep "open" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')
closed=$(cat $2/nmap/allPorts | grep "closed" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')
filtered=$(cat $2/nmap/allPorts | grep "filter" | grep -v "Discovered" | awk '{print $1}' | awk -F '/' '{print $1}' | tr '\n' ',')

echo "Open ports : " ${open::-1}
echo "Closed ports : " ${closed::-1}
echo "Filtered ports : " $filtered

# New substituion variable to prevent race condition for bash to load.. nothing at all
targetports=${open::-1}

sudo nmap $nmap_pn_flag -sC -sV -oA $2/nmap/Extensive --min-rate 1000 -p $targetports $1
wait
echo
echo
echo
sudo nmap $nmap_pn_flag -script discovery -oA $2/nmap/Discovery --min-rate 1000 -p $targetports $1 
wait
echo
echo
echo
sudo nmap $nmap_pn_flag --script vuln -oA $2/nmap/Vuln --min-rate 1000 -p $targetports $1
wait
echo
echo
echo
sudo nmap $nmap_pn_flag -sU -oA $2/nmap/UDP --min-rate 1000 -p- $1
wait
echo
echo
echo
echo "Scans completed"
exit


