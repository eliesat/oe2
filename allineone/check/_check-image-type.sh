#!/bin/sh

if [ -f /etc/apt/apt.conf ]; then
status='/var/lib/dpkg/status'
it=DreamOs
else
it=OpenSource
fi

echo "> image type: $it"
sleep 3s

exit 0
