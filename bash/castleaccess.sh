#!/bin/bash
# Ippsec castle access script from Hack the Box Hacking Battlegrounds video
sshpass -p $2 ssh -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null -o StrictHostKeysChecking=no root@$1
