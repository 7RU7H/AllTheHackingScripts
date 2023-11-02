#!/bin/bash

# Prevent accidental IP leaking from VPN dropping
# 
# Author: BHIS - Michael Allen 
#
# Watch: https://youtu.be/AHwfV3NFlno?si=ifq3zSkE2bFvaGJA
# 
# Run with openvpn
# `openvpn --script-security 2 --down vpn-down.sh --config $VPNfile`





echo "Disabling Network Interfaces..."
systemctl stop network-manager
killall -9 dhclient
for in $(ifconfig | grep -iEo '^[a-z0-9]+:' | grep -v '^lo:$' | cut -d ':' -f 1)
do
	ifconfig $i 0.0.0.0 down
done
echo "VPN gone down completed disabling Network Interfaces"
exit
