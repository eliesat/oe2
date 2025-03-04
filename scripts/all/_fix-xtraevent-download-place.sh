#check mounted storage
echo "checking mounted storage please wait:"
sleep 3s
if [ -d /media/hdd ]; then
dir=/media/hdd
elif [ -d /media/usb ]; then
dir=/media/usb
elif [ -d /media/mmc ]; then
dir=/media/mmc
else
echo "> mount your external storage and try again"
fi
echo "$dir"

rm -f  '/tmp/tmpFile' 
rm -f  '/tmp/xtraevent' 

sleep 1s

grep 'xtraEvent' '/etc/enigma2/settings' > '/tmp/xtraevent'

sleep 1s

sed -i '/config.plugins.xtraEvent.loc/d' /tmp/xtraevent

sleep 1s

echo "config.plugins.xtraEvent.loc=$dir/" >>'/tmp/xtraevent'

sleep 1s

grep -v 'xtraEvent'  '/etc/enigma2/settings' > '/tmp/tmpFile'
sed -i '/config.plugins.xtraEvent/d' '/tmp/tmpFile' 
cat '/tmp/xtraevent' >> '/tmp/tmpFile' 

sleep 1s

echo "> your device will restart now please wait..."
sleep 3s

init 4 
sleep 3
mv -f  '/tmp/tmpFile'  '/etc/enigma2/settings'
rm -f  '/tmp/tmpFile' 
rm -f  '/tmp/xtraevent' 

init 3

exit 0

