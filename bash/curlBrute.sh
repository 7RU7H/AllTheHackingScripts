#!/bin/bash
 
echo "Enter an IP address"; 
read IP;
echo "Enter a port number: ";
read PORT;
echo "Enter a wordlist filepath: ";
read WORDLIST;
LIST=$(cat $WORDLIST);
for WORD in $LIST; do
	curl http://$IP:$PORT/$WORD 
done
