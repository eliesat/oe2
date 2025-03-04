#!/bin/sh
if [ -f /etc/apt/apt.conf ]; then
status='/var/lib/dpkg/status'
it=DreamOs
else
status='/var/lib/opkg/status'
it=OpenSource
fi

echo "> installing filmxy-fnc username & password please wait ..."
rm -rf /tmp/filmxyfnc.txt > /dev/null 2>&1
touch /tmp/filmxyfnc.txt

sleep 3

cat <<EOF > /tmp/filmxyfnc.txt
config.plugins.filmxyfnc.password=eliesat2019
config.plugins.filmxyfnc.username=eliesat
EOF

echo "> your device will restart now please wait..."
init 4
sleep 2
sed -i '/config.plugins.filmxyfnc./d' /etc/enigma2/settings
grep "config.plugins.filmxyfnc.*" /tmp/filmxyfnc.txt >> /etc/enigma2/settings
rm -rf /tmp/filmxyfnc.txt > /dev/null 2>&1

if [ "$it" = "DreamOS" ]; then
sleep 2
systemctl restart enigma2
else
sleep 2
init 3
fi