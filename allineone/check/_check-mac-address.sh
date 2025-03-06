#!/bin/sh

#check mac address
mac=$(ifconfig eth0 |grep -i hwaddr |awk '{print $5}')
echo "> mac address: $mac "
sleep 3