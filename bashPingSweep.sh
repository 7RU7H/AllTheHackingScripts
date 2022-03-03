#/bin/bash
#bash ping sweep
for i in {1..255}; do (ping -c 1 192.168.1.${i} | grep "bytes from" &); done

