#!/bin/bash

# Author 7ru7h
# Just a simple wrapper around date to compare two curl response by time taken

if [ "$#" -ne 0 ]; then
        echo "Usage: $0 no arguments required as you are required to paste in full curl commands"
        exit
fi

echo "Inital full curl command is required"
echo ""
read -p 'Paste in your first full payload now: ' CURL1
echo ""
echo "Second full curl command is required..."
echo ""
read -p 'Paste in your first full payload now: ' CURL2

TIME0=$(date +"%T.%N")
echo "Sending first curl to $CURL1"
$CURL1
wait
TIME1=$(date +"%T.%N")
echo ""
sleep 3
TIME2=$(date +"%T.%N")
echo "Sending first curl to $CURL1"
$CURL2
wait
TIME3=$(date +"%T.%N")
echo ""
echo ""
echo ""
echo ""
echo "First curl started at: $TIME0"
echo "First curl ended at: $TIME1"
echo "Second curl started at: $TIME2"
echo "Second curl ended at: $TIME3"
exit
