#!/bin/bash
# Concatenates a given "user:wordlist_elem" -> base64 encodes it and outputs it to a file
USER="USER"
DELIM=":"
LIST=$(cat /usr/share/wordlists/rockyou.txt)
for WORD in $LIST;  do
	echo $USER$DELIM$WORD | base64 >> list.txt
done
