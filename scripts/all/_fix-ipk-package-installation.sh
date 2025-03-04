#!/bin/sh

echo " removing files plz wait... "

rm -rf /var/cache/opkg/*
rm -rf /var/lib/opkg/lists/*
rm -rf /run/opkg.lock
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL
fi
rm -rf /control
rm -rf /postinst
rm -rf /preinst
rm -rf /prerm
rm -rf /postrm
rm -rf /tmp/*.ipk
rm -rf /tmp/*.tar.gz

opkg update

echo " your stb will reboot now plz wait... "

reboot

exit 0