#!/bin/sh

#check wget
opkg install wget
echo "> wget package installed successfully ..."
sleep 3s

#download scripts
echo "> downloading scripts please wait ..."
sleep 3s

cd /tmp
set -e
rm -rf *scripts.tar.gz* >/dev/null
wget --no-check-certificate https://gitlab.com/eliesat/scripts/-/raw/main/scripts.tar.gz
tar -xzf scripts.tar.gz -C /
rm -rf *scripts.tar.gz* >/dev/null 2>&1
echo
set +e
echo ''

#config
dir1='/media/hdd/'
dir2='/media/usb/'
dir3='/media/mmc/'

sdir1='/update-scripts/os'
sdir2='/update-scripts/egami'
sdir3='/update-scripts/os/usr/script/'

sodir1='/usr/script'
sodir2='/usr/scripts'
sodir3='/etc/cron/scripts'

sodir4='/media/hdd/Eliesat_Scripts'
sodir5='/media/usb/Eliesat_Scripts'
sodir6='/media/mmc/Eliesat_Scripts'

#create folder copy chmod scripts

#egami image
if [ -r /usr/lib/enigma2/python/EGAMI ]; then

if [ ! -d "$sodir2" ]; then
     mkdir $sodir2
echo "> scripts default path folder created successfully"
else
echo "> scripts default path folder already exists"
fi
rm -rf /$sodir2/*.sh
cp -rf $sdir2/* / >/dev/null 2>&1
chmod 755 /$sodir2/*.sh

if [ ! -d "$sodir1" ]; then
     mkdir $sodir1
echo "> scripts default path folder created successfully"
else
echo "> scripts default path folder already exists"
sleep 3s
fi
rm -rf /$sodir1/*.sh
cp -rf $sdir1/* / >/dev/null 2>&1
chmod 755 /$sodir1/*.sh

#openpli image
elif grep -qs -i "openpli" /etc/issue; then

if [ ! -d "$sodir3" ]; then
     mkdir $sodir3
echo "> scripts cron folder created successfully"
else
echo "> scripts cron folder already exists"
fi
if [ ! -d "$sodir1" ]; then
     mkdir $sodir1
echo "> scripts default path folder created successfully"
else
echo "> scripts default path folder already exists"
fi
rm -rf /$sodir3/*.sh
rm -rf /$sodir1/*.sh
cp -rf $sdir3/* /$sodir3 >/dev/null 2>&1
cp -rf $sdir1/* / >/dev/null 2>&1
chmod 755 /$sodir3/*.sh
chmod 755 /$sodir1/*.sh

else

if [ ! -d "$sodir1" ]; then
     mkdir $sodir1
echo "> scripts default path folder created successfully"
else
echo "> scripts default path folder already exists"
sleep 3s
fi
rm -rf /$sodir1/*.sh
cp -rf $sdir1/* / >/dev/null 2>&1
chmod 755 /$sodir1/*.sh

fi

if [ -d $dir1 ]; then
if [ ! -d $sodir4 ]; then
     mkdir $sodir4
fi
rm -rf /$sodir4/*.sh
cp -rf $sdir3* $sodir4 >/dev/null 2>&1
chmod 755 /$sodir4/*.sh

elif [ -d $dir2 ]; then
if [ ! -d $sodir5 ]; then
     mkdir $sodir5
fi
rm -rf /$sodir5/*.sh
cp -rf $sdir3* $sodir5 >/dev/null 2>&1
chmod 755 /$sodir5/*.sh

elif [ -d $dir3 ]; then
if [ ! -d $sodir6 ]; then
     mkdir $sodir6
fi
rm -rf /$sodir6/*.sh
cp -rf $sdir3* $sodir5 >/dev/null 2>&1
chmod 755 /$sodir6/*.sh

else
echo ""

fi

rm -rf /update-scripts >/dev/null 2>&1

echo "> scripts are installed in default path & updated successfully"
sleep 3s
echo "> Eliesat enjoy ..."
sleep 3s

exit 0
