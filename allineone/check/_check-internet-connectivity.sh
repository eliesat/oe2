#!/bin/sh

# Check  internet connectivity
if ping -q -c 1 -W 1 google.com >/dev/null; then
echo "> internet: connected"
sleep 3s
else
echo "> internet:no connection"
sleep 3s
fi

exit 0

