#!/bin/bash

passphrase=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
echo -n $passphrase > passphrase.out 
# Because I need to learn how to suppy user prompt input during a command
echo ""
echo "Passphrase generation:"
echo "$passphrase"
echo ""
echo "Just cat passphrase.out for easy copy and paste" 
echo ""
echo ""
touch server-ext.cnf

# Dry-Run with: `-nodes` flag in creating CAm server private key 

# CA 
# Mitigation of this is filter by entropy of any field and drop
# Ideally this would be tunneled through another 'legitimate' looking protocols, bouncing in and out of the internal network to the internet
# Meering adds an extra level of jibbish to avoid human interaction on cert creation 
# /C=$country 
country=$(tr -dc 'A-Za-z' </dev/urandom | head -c 2 | xargs -n 1 | tr -d '\n' | tr -d "[:space:]")
# /ST=$state_or_province
state_or_province=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
# /L=$city
city=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
# /O=$organisation
organisation=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
# /OU=$organisational_unit
organisational_unit=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
# /CN=$domain_name
domain_name=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")
# /emailAddress=$orgemail
org_email=$(tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 24 | sha256sum | sed 's/ -//g' | tr -d '\n' | tr -d "[:space:]")

# Create CA's private key and certificate
openssl req -x509 -newkey rsa:4096 -days 365 -keyout ca-key.pem -out ca-cert.pem -subj "/C=$country/ST=$state_or_province/L=$city/O=$organisation/OU=$organisational_unit/CN=$domain_name/emailAddress=$org_email"

# Server Private Key
openssl req -newkey rsa:4096 -keyout server-key.pem -out server-req.pem -subj "/C=$country/ST=$state_or_province/L=$City/O=$organisation/OU=$organisational_unit/CN=$domain_name/emailAddress=$org_email"

# Sign the server's certificate request
# -CAcreateserial - for ID per certificate it will sign
# -days default is 30 days
# -extfile for x509 confif file 
openssl x509 -req -in server-req.pem  -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile server-ext.cnf

# Output cert  
echo ""
echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text
# Provide certification verification  help
echo ""
echo "Verify certificate:"
echo "openssl verify -CAfile ca-cert.pem server-cert.pem"
echo ""
echo "Your Passphrase is:"
echo "$passphrase"
echo "For further usage just cat passphrase.out for easy copy and paste" 
echo ""
exit

