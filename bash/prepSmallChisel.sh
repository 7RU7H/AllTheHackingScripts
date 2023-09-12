#!/bin/bash

git clone https://github.com/jpillora/chisel.git 
wait
cd chisel/

# To mimise binary size
# -s strip binary of debug info
# -w strip of dwarf infomation
go build -ldflags="-s -w"
upx brute chisel
chiselsize=$(du -hs chisel)
echo "Chisel is now ready and minimised: "
echo $chiselsize
exit
