#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <file path> <IP address>"
	exit
fi

data=$(cat $1)
for line in $data; do
	hexconv=$(echo $line | xxd -p)
	ping $2 -c 1 -p $hexconv
done
exit

