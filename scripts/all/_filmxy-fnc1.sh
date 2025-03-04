#!/bin/sh
if [ -f /etc/apt/apt.conf ]; then
status='/var/lib/dpkg/status'
it=DreamOs
else
status='/var/lib/opkg/status'
it=OpenSource
fi
echo "> installing filmxy-fnc username & password please wait ..."
sleep 3s 
rm -rf /tmp/file.txt
cp /etc/enigma2/settings /tmp/file.txt
sed -i '/config.plugins.filmxyfnc../d' /tmp/file.txt
cat <<EOF >> /tmp/file.txt
config.plugins.filmxyfnc.password=eliesat2019
config.plugins.filmxyfnc.username=eliesat
EOF

echo "> your device will restart now please wait..."
init 4
sleep 2s
mv /tmp/file.txt /etc/enigma2/settings
if [ "$it" = "DreamOS" ]; then
sleep 2s
systemctl restart enigma2
else
sleep 2s
init 3
fi

exit 0