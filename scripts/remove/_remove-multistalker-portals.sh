#!/bin/sh

echo "> removing multistalker portals"
sleep 3s

echo "> done
> your device will restart now please wait ..."
sleep 3s

init 4
sed -i '/portal/d' /home/stalker.conf
sed -i '/portal/d' /etc/enigma2/settings

sed -i '/portals/d' /etc/enigma2/settings
sed -e s/config.plugins.MultiStalker.portals.*//g -i /etc/enigma2/settings
rm -rf /etc/enigma2/MultiStalkerPro.json > /dev/null 2>&1
init 3