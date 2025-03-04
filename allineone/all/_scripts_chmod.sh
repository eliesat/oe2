#!/bin/sh

if [ -d /media/hdd/Eliesat_Scripts ]; then
dir=/media/hdd/Eliesat_Scripts
chmod 755 $dir/*.sh
elif [ -d /media/usb/Eliesat_Scripts ]; then
dir=/media/usb/Eliesat_Scripts
chmod 755 $dir/*.sh
elif [ -d /media/mmc/Eliesat_Scripts ]; then
dir=/media/mmc/Eliesat_Scripts
chmod 755 $dir/*.sh
else
echo ""
fi

if [ -d /usr/script ]; then 
chmod 755 /usr/script/*.sh
fi
if [ -d /usr/scripts ]; then 
chmod 755 /usr/scripts/*.sh
fi
if [ -d /etc//cron/scripts ]; then 
chmod 755 /etc//cron/scripts/*.sh
fi

echo "> permissions allowed & your scripts are ready to use"
sleep 3
