#!/bin/bash

read -r -p "Enter an IP: " IP
read -r -p "Enter a port number: " PORT
read -r -p "Enter a service name: " SERVICE
LIST=$(ls /usr/share/nmap/scripts/ | grep "$SERVICE")
echo $LIST > scriptsReq.txt 
FILE=$(cat scriptsReq.txt)
for SCRIPT in $FILE; do
	nmap --script $SCRIPT -p $PORT $IP
	wait
done
exit
