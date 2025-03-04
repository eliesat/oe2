#!/bin/bash

#configuration
#######################################
device=$(head -n 1 /etc/hostname)
image='opendroid'
version='image'
date="$(date +%Y%m%d)"

#detetmine image name
#########################################
case $device in
vuzero4k|vusolo4k|vuuno4k|vuuno4kse|vuduo4k|vuduo4kse|vuultimo4k)
u1=Vu+
ext=_usb.zip
;;
gbx34k|gbtrio4k|gbtrio4kpro|gbip4k|gbue4k|gbquad4k)
u1=GigaBlue
ext=_mmc.zip
;;
sf8008|sf4008|sf8008m)
u1=Octagon
ext=_mmc.zip
;;
ustym4kpro|ustym4kottpremium)
u1=uClan
ext=_mmc.zip
;;
*)
echo "> your devive is not supported"
esac

case $device in
gbx34k|gbtrio4k|gbtrio4kpro|gbip4k|gbue4k|gbquad4k|sf8008|sf4008|sf8008|mustym4kpro|ustym4kottpremium)
img=$(curl -s "https://opendroid.org/$u1/index.php?open=$device" | grep $device | tail -n 1 | sed 's/\.zip.*/.zip/' | sed 's/^.*opendroid/opendroid/'| sed 's/_recovery//' | sed 's/_emmc.zip//')
imgnm="$img""$ext"
;;
*)
img=$(curl -s "https://opendroid.org/$u1/index.php?open=$device" | grep $device | tail -n 1 | sed 's/\.zip.*/.zip/' | sed 's/^.*opendroid/opendroid/'| sed 's/_recovery//' | sed 's/_emmc.zip//')
imgnm="$img"
esac

echo "> "$imgnm" image found ..."
sleep 5

#check mounted storage
#########################################
for ms in "/media/hdd" "/media/usb" "/media/mmc"
do
    if mount|grep $ms >/dev/null 2>&1; then
    echo "> Mounted storage found at: $ms"
    mkdir "$ms"/images >/dev/null 2>&1
    break
    fi
done

if [ -z "$ms" ]; then
echo "> Mount your external memory and try again"
exit 1
fi
sleep 3

#download image to mounted storage
#########################################
echo "> Downloading "$image"-"$version" to "$ms"/images please wait..."
sleep 3

url=https://opendroid.org/$u1/$device/$imgnm
if wget -q --method=HEAD $url;
 then
wget --show-progress -qO $ms/images/$imgnm $url

else
echo "> check your internet connection and try again or your device is not supported..."
exit 1
fi

echo "> Download of "$image"-"$version"  to "$ms"/images is finished"
sleep 3

#copy image to multiboot upload folders
#########################################
for dir in "/media/hdd/ImagesUpload/" "/media/hdd/open-multiboot-upload/" "/media/hdd/OPDBootUpload/" "/media/hdd/EgamiBootUpload/"
do
if [ -d $dir ] ; then
echo "> "$dir" folder found ..."
sleep 1
echo "> copying image to "$dir" folder please wait ..."
sleep 1
cp $ms/images/$imgnm $dir >/dev/null 2>&1
fi
done

echo "> Eliesat enjoy..."
