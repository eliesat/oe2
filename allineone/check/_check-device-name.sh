#!/bin/sh

#device
device=$(head -n 1 /etc/hostname)
sleep 3
echo "> device: $device "
sleep 3