#!/bash/bash
# Mass enum4linux over a network range
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <filepath to either a directory containing .gnmap files or single .gnmap>"
	exit
fi

grep $1 -r 445/open | awk '{print $2}' | xargs -I@ sh -c 'for x in "@"; do enum4linux -a $x; done'

