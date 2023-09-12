#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <target IP address>"
	exit
fi

ip_address=$1

enum4linux -a -u "" -p "" $ip_address | tee -a e4l-NoAuth.out 
wait
echo ""
echo ""
smbmap -u "" -p "" -P 445 -H $ip_address | tee -a smbmap-NoAuth-445.out
wait
echo ""
echo ""
smbmap -u "" -p "" -P 139 -H $ip_address | tee -a smbmap-NoAuth-139.out
wait
echo ""
echo ""
smbmap -u "$user" -p "" -P 139 -H $ip_address | tee -a smbmap-output-Guest-NoPass-139
wait
echo ""
echo ""
crackmapexec 
wait
crackmapexec smb -u '' -p '' | tee -a cme-smb-info
wait
echo ""
echo ""
crackmapexec smb -u '' -p '' --shares | tee -a cme-smb-noauth-shares
wait
echo ""
echo ""
LDAP369OPEN$(sudo nmap -Pn -p 369 $ip_address)
if [ "$(echo $LDAP369OPEN | grep closed)" -ne "closed" ]; then
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
	sudo nmap -n -Pn -sV -oN ldapNotBrute --script "ldap* and not brute" -p 389 $ip_address
	wait
	echo ""
	echo ""
fi
echo ""
echo "----------------------------------------------"
echo "Basic External Active Directory Recon complete"
echo "----------------------------------------------"
echo ""
