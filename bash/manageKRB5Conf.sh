#!/bin/bash
# Author: 7ru7h
if [ "$#" -ne 5 ]; then
        echo "Usage: $0 <cmd: add / remove>/ setup <realm> <kdc> <admin_server> <default_domain>"
        echo "BEWARE - This will require super user access and modify and important file - BEWARE"
        echo "run \`sudo apt-get install krb5-user\' - put: \`KALI\` as default in all capitals, no \` for adding and removing a default realm"
        echo "Also requires KALI to be the set to the default_domain, which is not added on install"
        echo ""
        echo "... /etc/krb5.conf : ..."
        echo ""
        echo "[realms]
                KALI = {
                                kdc = KALI
                                admin_server = KALI
                        }"
        echo " ... "
        echo " Should be:"
        echo ""
        echo "[realms]
                KALI = {
                                kdc = KALI
                                admin_server = KALI
                                default_domain = KALI
                        }"
        echo ""
        echo ""
        exit
fi

CMD=$1
echo "Backed up /etc/krb5.conf -> /etc/krb5.conf.bak"

function setupKRB5Conf()
{
        echo "run \`sudo apt-get install krb5-user\' - put: KALI as default in all capitals for adding and removing a  default realm"
        echo "\`sudo cp /etc/krb5.conf /etc/krb5.conf.bak\`"
        echo "add \`default_domain = KALI\` under admin_server = KALI"
}


function addToKRB5Conf ()
{
        REALM=$1
        KDC=$2
        ADM=$3
        DOM=$4
        # add realm
        sudo sed -i "s/admin_server = KALI/admin_server = $ADM/g" /etc/krb5.conf
        sudo sed -i "s/kdc = KALI/kdc = $KDC/g" /etc/krb5.conf
        sudo sed -i "s/default_domain = KALI/domain = $DOM/g" /etc/krb5.conf
        sudo sed -i "s/default_realm = KALI/default_realm = $REALM/g" /etc/krb5.conf
        cat /etc/krb5.conf
        echo "Added: $@"
        return
}

function removeFromKRB5Conf ()
{
        REALM=$1
        KDC=$2
        ADM=$3
        DOM=$4
        sudo sed -i "s/kdc = $KDC/kdc = KALI/g" /etc/krb5.conf
        sudo sed -i "s/admin_server = $ADM/admin_server = KALI/g" /etc/krb5.conf
        sudo sed -i "s/default_realm = $REALM/default_realm = KALI/g" /etc/krb5.conf
        sudo sed -i "s/default_domain = $DOM /default_realm = KALI/g" /etc/krb5.conf
        cat /etc/krb5.conf
        echo "Removed and replacing back to default KALI every field: $@"
        return
}

case "$CMD" in
        add) addToKRB5Conf $2 $3 $4 $5 ;;
        remove) removeFromKRB5Conf $2 $3 $4 $5 ;;
        setup) setupKRB5Conf ;;
        *) echo "$CMD is invalid" ;;
esac
exit