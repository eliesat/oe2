#!/bin/sh

echo "> downloading astra config file Please Wait ..."
sleep 3

wget --show-progress -qO /etc/astra/astra.conf "https://raw.githubusercontent.com/ciefp/astra.conf/main/astra.conf"

echo "> installation of astra config file finished"
sleep 3