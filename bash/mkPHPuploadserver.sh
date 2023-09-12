#!/bin/bash

# Host a http server, make directory owned by www-data

mkdir /var/www/uploads -p
chown www-data: /var/www/uploads 

# Script to placed in /uploads/

echo'
<?php
$uploaddir = '/var/www/uploads/';

$uploadfile = $uploaddir . $_FILES['file']['name'];

move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)
?>' > /var/www/uploads/upload.php
