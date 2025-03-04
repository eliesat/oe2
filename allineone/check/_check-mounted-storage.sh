#!/bin/sh

#check mounted storage
if [ -d /media/hdd ]; then
dir=/media/hdd
elif [ -d /media/usb ]; then
dir=/media/usb
elif [ -d /media/mmc ]; then
dir=/media/mmc
else
echo "> mounted storage not found"
fi
echo "> mounted storage: $dir "
sleep 3s

exit 0

