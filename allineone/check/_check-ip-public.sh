#!/bin/sh

#public ip
public=$(wget -qO- ifconfig.me)
echo "> public ip: $public "
sleep 3s

exit 0

