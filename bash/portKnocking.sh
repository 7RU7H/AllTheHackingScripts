#!/bin/bash
# Set $IP and replace $X with port number to knock
for port in $X; do nmap -Pn --host_timeout 201 --max-retries 0 -p $port $IP; done;
