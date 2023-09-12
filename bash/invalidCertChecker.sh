#!/bin/bash
# invalid cert check
# https://gist.github.com/cgmartin/49cd0aefe836932cdc96

# https://klichx.dev/2019/11/09/f-strings-and-python-logging/

if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <https://domain.com> <integer for days expires in less than>"
			exit
fi

TARGET=$1; 
DOMAIN=$(echo $1 |  awk -F'//' '{print $2}')
RECIPIENT="hostmaster@$DOMAIN";
DAYS=$2;
echo "checking if $TARGET expires in less than $DAYS days";
expirationdate=$(date -d "$(: | openssl s_client -connect $TARGET:443 -servername $TARGET 2>/dev/null \
                              | openssl x509 -text \
                              | grep 'Not After' \
                              |awk '{print $4,$5,$7}')" '+%s'); 
in7days=$(($(date +%s) + (86400*$DAYS)));
if [ $in7days -gt $expirationdate ]; then
    echo "KO - Certificate for $TARGET expires in less than $DAYS days, on $(date -d @$expirationdate '+%Y-%m-%d')" \
    | mail -s "Certificate expiration warning for $TARGET" $RECIPIENT ;
else
    echo "OK - Certificate expires on $expirationdate";
fi;

