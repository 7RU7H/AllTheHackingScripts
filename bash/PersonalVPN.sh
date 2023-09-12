#!/bin/bash
# Inspired by https://averagelinuxuser.com/linux-vpn-server/


sudo apt install openvpn curl
wait
curl -O -L https://raw.githubusercontent.com/Angristan/openvpn-install/master/openvpn-install.sh
wait
chmod +x openvpn-install.sh
sudo ./openvpn-install.sh
wait
echo ""
echo ""
echo "====================================================================="
echo ""
echo "For Example:" 
echo "scp remoteuser@remote-ip-address:/home/remoteuser/*.ovpn ~/Downloads/"
echo ""
echo "Copy Configuration files to openvpn client directory:"
echo "sudo cp Downloads/*.ovpn /etc/openvpn/client/client.conf"
echo ""
echo "Test connection:"
echo "sudo openvpn /etc/openvpn/client/client.conf"
echo ""
echo "To add, revoke or remove OpenVPN server rerun ./openvpn-install.sh" 
echo ""
echo "====================================================================="
echo ""

