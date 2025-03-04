#!/bin/sh

echo "> removing config files please wait..."
sleep 3

rm -rf /etc/tuxbox/config > /dev/null 2>&1

rm -rf /etc/tuxbox/gosatplus > /dev/null 2>&1

rm -rf /etc/tuxbox/powercam > /dev/null 2>&1

rm -rf /etc/tuxbox/ultracam > /dev/null 2>&1

rm -rf /etc/CCcam.cfg > /dev/null 2>&1

rm -rf /usr/keys/* > /dev/null 2>&1


echo "> done"
sleep 3
