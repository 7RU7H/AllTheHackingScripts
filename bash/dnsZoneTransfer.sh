#!/bin/bash
# Refactored from https://pastebin.com/qLitw9eT

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 domainname.whatever"
        exit
fi

# Attempt zone transfer for each of the servers

for server in $(host -t ns $1 | cut -d" " -f4); do
  host -l $1 $server | grep "has address"
done
exit
