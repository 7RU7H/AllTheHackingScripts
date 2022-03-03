#!/bin/bash
# Concatenates a given "user:wordlist_elem" -> base64 encodes it and outputs it to a file
USERU="Joker"
USERL="joker"
DELIM=":"
LIST=$(cat /usr/share/wordlists/rockyou.txt)
for WORD in $LIST;  do
	echo $USERU$DELIM$WORD | base64 >> list.txt
	echo $USERL$DELIM$WORD | base64 >> list.txt
done
