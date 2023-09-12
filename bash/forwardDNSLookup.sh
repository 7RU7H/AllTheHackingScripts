#!/bin/bash
# refactored from here: https://pastebin.com/qLitw9eT

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 domainname.whatever"
	exit
fi

hostnames=( www ftp mail owa proxy router admin www2 firewall mx pop3 )

for name in $hostnames; do
  host $name.$1 | grep "has address" | cut -d" " -f1,4
done
exit
