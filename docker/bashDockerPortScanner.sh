#!/bin/bash
# https://tryhackme.com/room/hololive
default_gateway="" # set to default gateway
ports=(21 22 53 80 443 3306 8443 8080)   
for port in ${ports[@]}; do  	
	timeout 1 
	bash -c "echo \"Port Scan Test\" > /dev/tcp/$default_gateway/$port && echo $port is open || /dev/null"    
done
