#!/bin/bash

$username
$password
$share

sudo mount -t cifs -o 'user=$username,password=$password' //$IP/$share /mnt

cd /mnt; 
for i in $(ls); do
	smbcacls -N '//$1/$share' /$i
	wait
done;
