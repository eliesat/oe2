#!/bin/sh

#device
device=$(head -n 1 /etc/hostname)
sleep 3s
echo "> device: $device "
sleep 3s

#architecture armv7l aarch64 mips 7401c0 sh4
arch=$(uname -m)
echo "> architecture: $arch "
sleep 3s

#check mac address
mac=$(ifconfig eth0 |grep -i hwaddr |awk '{print $5}')
echo "> mac address: $mac "
sleep 3s

#check mounted storage
if [ -d /media/hdd ]; then
dir=/media/hdd
elif [ -d /media/usb ]; then
dir=/media/usb
elif [ -d /media/mmc ]; then
dir=/media/mmc
else
echo "> mounted storage not found"
fi
echo "> mounted storage: $dir "
sleep 3s

#image
image=$(grep ^distro=* /usr/lib/enigma.info | sed 's/distro=//g')
echo "> image: $image "
sleep 3s

#image version
imageversion=$(grep ^imgversion=* /usr/lib/enigma.info | sed 's/imgversion=//g')
imageversion=$(echo "$imageversion" | awk '{print substr($0, 2, length($0) - 2)}')
 echo "> image version: $imageversion "
sleep 3s 

#python
python=$(python -c"from sys import version_info; print(version_info[0])")
echo "> python: $python "
sleep 3s

#python version
pythonversion=$(python -c "import platform; print(platform.python_version())")
echo "> python version: $pythonversion "
sleep 3s

#date&time
date=$(date +%d-%m-%Y)
time=$(date +%H:%M:%S)
echo "> date&time: $date   $time "
sleep 3s

# Check  internet connectivity
if ping -q -c 1 -W 1 google.com >/dev/null; then
echo "> internet: connected"
sleep 3s
else
echo "> internet:no connection"
sleep 3s
fi

#local ip
#local=$(ip address show | grep -E "inet " | grep -v "host"| awk '{print $2}')
local=$(ip route get 1.2.3.4 | awk '{print $7}')
echo "> local ip: $local "
sleep 3s

#public ip
public=$(wget -qO- ifconfig.me)
echo "> public ip: $public "
sleep 3s

exit 0


