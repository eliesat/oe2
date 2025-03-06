#!/bin/sh

#date&time
date=$(date +%d-%m-%Y)
time=$(date +%H:%M:%S)
echo "> date&time: $date   $time "
sleep 2

# Check  internet connectivity
if ping -q -c 1 -W 1 google.com >/dev/null; then
echo "> internet: connected"
sleep 2
else
echo "> internet:no connection"
sleep 2
fi

#local ip
#local=$(ip address show | grep -E "inet " | grep -v "host"| awk '{print $2}')
local=$(ip route get 1.2.3.4 | awk '{print $7}')
echo "> local ip: $local "
sleep 2

#public ip
public=$(wget -qO- ifconfig.me)
echo "> public ip: $public "
sleep 2

#device
device=$(head -n 1 /etc/hostname)
echo "> device: $device "
sleep 2

#architecture armv7l aarch64 mips 7401c0 sh4
arch=$(uname -m)
echo "> architecture: $arch "
sleep 2

#check mac address
mac=$(ifconfig eth0 |grep -i hwaddr |awk '{print $5}')
echo "> mac address: $mac "
sleep 2

#check mounted storage
if [ -d /media/hdd ]; then
dir=/media/hdd
echo "> mounted storage: $dir "
sleep 2
else
if [ -d /media/usb ]; then
dir1=/media/usb
echo "> mounted storage: $dir1 "
sleep 2
fi
else
if [ -d /media/mmc ]; then
dir2=/media/mmc
echo "> mounted storage: $dir2 "
sleep 2
fi
else
echo "> mounted storage not found"
fi

#image
image=$(grep ^distro=* /usr/lib/enigma.info | sed 's/distro=//g')
echo "> image: $image "
sleep 2

#image version
imageversion=$(grep ^imgversion=* /usr/lib/enigma.info | sed 's/imgversion=//g')
imageversion=$(echo "$imageversion" | awk '{print substr($0, 2, length($0) - 2)}')
 echo "> image version: $imageversion "
sleep 2

#python
python=$(python -c"from sys import version_info; print(version_info[0])")
echo "> python: $python "
sleep 2

#python version
pythonversion=$(python -c "import platform; print(platform.python_version())")
echo "> python version: $pythonversion "
sleep 2
