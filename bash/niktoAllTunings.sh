#!/bin/bash
ARGTOTAL=1
if [ "$#" -ne $ARGTOTAL ]; then
	echo "Usage: $0 <address> if a specific port include the flag and number or colon and port number"
	exit
fi
ip=$1
tunings=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "x")
# mkdir nikto/
for i in "${tunings[@]}"; do
       nikto -h $ip -Tuning $i -o nikto/$option.txt
       wait
done
exit
