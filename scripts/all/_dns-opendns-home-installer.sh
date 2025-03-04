#!/bin/sh
if [ ! -f /etc/resolv-backup.conf ] 
then
grep "nameserver.*" /etc/resolv.conf >> //etc/resolv-backup.conf
fi
> /etc/resolv.conf

echo "nameserver 208.67.222.222" > /etc/resolv.conf; echo "nameserver 208.67.220.220" >> /etc/resolv.conf; echo "> done
> your device will restart now please wait..."; sleep 3s; killall -9 enigma2