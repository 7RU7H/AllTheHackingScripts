#!/bin/bash

# Inspired by Michael Allen's Red Team OPSEC video https://www.youtube.com/watch?v=AHwfV3NFlno 
echo "" | tee -a ~/.zshrc
echo "# OPSEC enviroment variables and aliases" | tee -a ~/.zshrc
echo "# env" | tee -a ~/.zshrc
echo "" | tee -a ~/.zshrc
echo "export AGENT=\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36" | tee -a ~/.zshrc
echo "" | tee -a ~/.zshrc
echo "# User-Agent Aliases" | tee -a ~/.zshrc
echo "" | tee -a ~/.zshrc
echo "alias nmap=\"nmap --script-args=\"http.useragent='$AGENT'\"" | tee -a ~/.zshrc
echo "alias curl=\"curl -A '$AGENT'\"" | tee -a ~/.zshrc
echo "alias wget=\"wget -U '$AGENT'\"" | tee -a ~/.zshrc
echo "" | tee -a ~/.zshrc
echo "# VPN Security" | tee -a ~/.zshrc
echo "alias openvpn=\"openvpn --script-security 2 --down /opt/OPSEC/vpn-down.sh --config" | tee -a ~/.zshrc
source ~/.zshrc
echo "run: "
echo "mkdir /opt/OPSEC; mv vpn-down.sh /opt/OPSEC/; chmod +x /opt/OPSEC/vpn-down.sh" 
