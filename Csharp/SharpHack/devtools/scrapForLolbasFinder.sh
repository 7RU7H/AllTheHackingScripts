#!/bin/bash
cd /tmp;
git clone https://github.com/LOLBAS-Project/LOLBAS.git
wait
cd LOLBAS/yml
grep -r -e " Path:" | awk '{$1=$2=$3=""; print $0}' | uniq | sort > junk.txt
sed -i '/filerepository/d' junk.txt
sed -i '$d' junk.txt
sed -i '$d' junk.txt
sed -i '1,4d' junk.txt
cat junk.txt sed -r 's/\s+//g' | tr -d \' > better.txt
sed -i "s/^/'/;s/$/'/" better.txt
cat better.txt | tr -s '\n' ', ' | sed '$ s/.$//' > arrayElems
exit
