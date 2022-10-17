#!/bin/bash

# Make a user for Tunnelling, Proxying, Port Redirection to avoid RCE yourself or other hijacking and RCE you
# Inspired by THM
useradd tunneluser -m -d /home/tunneluser -s /bin/true
passwd tunneluser
