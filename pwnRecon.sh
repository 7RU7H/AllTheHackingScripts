#!/bin/bash

# Update Pwntools
python3 -m pip install --upgrade pwntools

# Notes or Writeup
DOC=$($2)
FILE=$(file $1)
STRINGS=$(strings $1)


echo "\nStrings output:\`\`\`\n$STRINGS\n\`\`\`\n" >> $DOC

echo "Checksec output:\n![](checksecoutput.png)\n" >> $DOC

# if ELF
readelf -h $FILE
echo "Readelf -h output:\n![](readelfhoutput.png)\n" >> $DOC
readelf -a $FILE > rELFa.txt
readelf -x .rodata $FILE > rELFstrings.txt


echo "Run Checksec and screenshot as checksecoutput.png"
echo "Read the strings output..."

# if Elf

echo "Run cat rELFa.txt for reading the entire ELF" 

