#!/bin/bash

if [ "$#" -ne 1 ]; then
		echo "Usage: $0 <ipaddress>"
			exit
fi

nmap -Pn -p 445 --script smb-vuln-ms06-025 $1 
nmap -Pn -p 445 --script smb-vuln-ms07-029 $1
nmap -Pn -p 445 --script smb-vuln-ms08-067 $1
nmap -Pn -p 445 --script smb-vuln-ms10-054 $1
nmap -Pn -p 445 --script smb-vuln-ms17-010 $1
