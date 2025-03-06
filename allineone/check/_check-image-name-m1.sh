#!/bin/sh

#image
image=$(grep ^distro=* /usr/lib/enigma.info | sed 's/distro=//g')
echo "> image: $image "
sleep 3

