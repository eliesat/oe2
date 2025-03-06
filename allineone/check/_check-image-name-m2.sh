#!/bin/sh

#image
if [ -f /etc/image-version ]; then
image=$(cat /etc/image-version | grep -iF "creator" | cut -d"=" -f2 | xargs)
elif [ -f /etc/issue ]; then
image=$(cat /etc/issue | head -n1 | awk '{print $1;}')
else
image=''
fi
[[ ! -z "$image" ]] && echo -e "> image: $image"
sleep 3