#!/bin/sh

#image version
imageversion=$(grep ^imgversion=* /usr/lib/enigma.info | sed 's/imgversion=//g')
imageversion=$(echo "$imageversion" | awk '{print substr($0, 2, length($0) - 2)}')
 echo "> image version: $imageversion "
sleep 3s 

exit 0

