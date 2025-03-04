#!/bin/sh

# Download and install scripts
###########################################
if [ ! -f /usr/script/Eliesat-Eliesatpanel.sh ] ; then

plugin=main
version='scripts'
url=https://github.com/eliesat/scripts/archive/main.tar.gz
package=/tmp/$plugin.tar.gz
rm -rf /tmp/$plugin.tar.gz >/dev/null 2>&1

wget -qO $package --no-check-certificate $url
tar -xzf $package -C /tmp
extract=$?
rm -rf $package >/dev/null 2>&1

if [ $extract -eq 0 ]; then
    rm -rf /tmp/scripts-main/*.sh >/dev/null 2>&1
    mkdir -p /usr/script >/dev/null 2>&1
    cp -r '/tmp/scripts-main/usr' '/' >/dev/null 2>&1
    rm -rf /tmp/scripts-main >/dev/null 2>&1

print_message "> Eliesatscripts are installed successfully and up to date ..."
sleep 3
fi
fi

print_message "> End of process ..."
sleep 3

print_message "> Please Wait enigma2 restarting. ..."
echo "-----------------------------------------------------------"
sleep 3
