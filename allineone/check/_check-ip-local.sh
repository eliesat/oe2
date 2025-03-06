#!/bin/sh

#local ip
local=$(ip address show | grep -E "inet " | grep -v "host"| awk '{print $2}')
echo "> local ip: $local "
sleep 3