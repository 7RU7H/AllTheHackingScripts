#!/bin/bash
#bash ping sweep
#replace octets of IP variable
IP=10.10.10.
for i in {1..255}; do (ping -c 1 $IP${i} | grep "bytes from" &); done

