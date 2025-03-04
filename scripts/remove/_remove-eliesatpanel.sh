#!/bin/sh
echo "> cleaning up please wait..."
sleep 3

if command -v dpkg &> /dev/null; then
apt-get -remove enigma2-plugin-extensions-eliesatpanel
else
opkg remove enigma2-plugin-extensions-eliesatpanel
fi

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/ElieSatPanel ]; then
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/ElieSatPanel > /dev/null 2>&1
fi

rm -rf /var/cache/opkg/*
rm -rf /var/lib/opkg/lists/*
rm -rf /run/opkg.lock
rm -r /var/volatile/cache/opkg >/dev/null 2>&1

find /var/lib/opkg/info -type f -name "*.eliesatpanel" -exec rm -f {} \; >/dev/null 2>&1
find /var/lib/opkg/info -type f -name "*.eliesatpanel" -exec rm -f {} \; >/dev/null 2>&1

echo "> done, your device will reboot now please wait..."
reboot