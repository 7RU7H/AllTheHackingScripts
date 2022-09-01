#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <file path> <IP address>"
	exit
fi

data=$(cat $1)
for line in $data; do
	foricmp=$(echo $line | xxd -p)
	ping $ip -c 1 -p $foricmp
done
exit

