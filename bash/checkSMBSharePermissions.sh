#!/bin/bash


if [ "$#" -ne 4  ]; then
	echo "Usage: $0 <username> <password> <share name> <IP>"
	echo "This script uses cifs with sudo to mount shares to <share name to mnt>"
	exit
fi

$IP=$4
dash_delimited_ip=$(echo $IP | tr -s '.' '-')
CWD=$(pwd)
username=$1
password=$2
share=$3
mkdir $CWD/smbPrivChecker

sudo mount -t cifs -o 'user=$username,password=$password' //$IP/$share /mnt

echo "SMB-SharePerms-for-$share-with-$username

" > SMB-SharePerms-for-$share-with-$username

cd /mnt; 
for i in $(ls); do
	smbcacls -N '//$IP/$share' /$i | tee -a $CWD/smbPrivChecker/SMB-SharePerms-for-$share-with-$username 
	wait
done;
umount -f /mnt/$share
exit

