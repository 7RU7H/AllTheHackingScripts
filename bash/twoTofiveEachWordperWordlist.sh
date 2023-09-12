#!/bin/bash
FILE=
LINES=$(cat $FILE)
for LINE in $LINES
do 
	echo "$LINE" >> output.txt
	echo "$LINE$LINE" >> output.txt
	echo "$LINE$LINE$LINE" >> output.txt
	echo "$LINE$LINE$LINE$LINE" >> output.txt
	echo "$LINE$LINE$LINE$LINE$LINE" >> output.txt
done

