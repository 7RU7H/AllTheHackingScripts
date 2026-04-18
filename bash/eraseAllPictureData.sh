#!/bin/bash
# Use CHA-CHATgeronomo for the -overwrite_original and the second find command
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <jpg or png or any extension tag>"
	exit
fi
su root
wait
find . -type f -name "*.$1" -exec exiftool -overwrite_original -all= {} \; 2>/dev/null
wait
find . -type f -name "*.$1" -exec convert {} -strip {} \;
wait
exit
