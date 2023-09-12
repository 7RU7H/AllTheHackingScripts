#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <first-three-octects-of-an-ip-address>"
	echo "For example: 255.255.255"
	exit
fi

results=$(for lastoctet in $(seq 0 255); do host $ip.$lastoctet; done | grep -v "not found")
echo $results
