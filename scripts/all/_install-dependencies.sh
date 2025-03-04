#!/bin/bash

FEED="/etc/opkg/eliesat-feed.conf"
left=">>>>"
right="<<<<"
LINE1="---------------------------------------------------------"
LINE2="-------------------------------------------------------------------------------------"

echo "$LINE1"
echo "> Installing dependencies be patient ...
> it takes 2 to 15 minutes please wait..."
echo "$LINE1"
sleep 5

echo "> start of process ..."
sleep 3

# Check python
pyVersion=$(python -c"from sys import version_info; print(version_info[0])")

deps=("wget" "alsa-conf" "alsa-state" "alsa-plugins" "alsa-utils" "alsa-utils-aplay" "astra-sm" "bzip2" "curl" "duktape" "dvbsnoop" "enigma2" "exteplayer3" "ffmpeg" "gstplayer" "perl-module-io-zlib" "libasound2" "libusb-1.0-0" "libxml2" "libxslt" "libc6" "libgcc1" "libstdc++6" "openvpn" "p7zip" "rtmpdump" "transmission" "transmission-client" "enigma2-plugin-systemplugins-serviceapp" "unrar" "zip" "xz" "zstd")

if [ "$pyVersion" = 3 ]; then
  deps+=( "livestreamersrv" "python3-backports-lzma" "python3-beautifulsoup4" "python3-certifi" "python3-chardet" "python3-cfscrape" "python3-codecs" "python3-core" "python3-compression" "python3-cryptography" "python3-dateutil" "python3-difflib" "python3-fuzzywuzzy" "python3-future" "python3-futures3" "python3-html" "python3-image" "python3-imaging" "python3-js2py" "python3-json" "python3-levenshtein" "python3-lxml" "python3-mmap" "python3-misc" "python3-mechanize" "python3-multiprocessing" "python3-ndg-httpsclient" "python3-netclient" "python3-netserver" "python3-pillow" "python3-pkgutil" "python3-pycurl" "python3-pycrypto" "python3-pydoc" "python3-pyexecjs" "python3-pyopenssl" "python3-rarfile" "python3-pysocks" "python3-requests" "python3-shell" "python3-sqlite3" "python3-six" "python3-treq" "python3-twisted-web" "python3-transmission-rpc" "python3-unixadmin" "python3-urllib3" "python3-xmlrpc" "python3-zoneinfo" )
else
  
deps+=( "f4mdump" "hlsdl" "kodi-addon-pvr-iptvsimple" "python-lzma" "python-argparse" "python-beautifulsoup4" "python-certifi" "python-chardet" "python-codecs" "python-compression" "python-core" "python-pycurl" "python-cryptography" "python-difflib" "python-futures" "python-html" "python-image" "python-imaging" "python-json" "python-js2py" "python-lxml" "python-lzma" "python-mechanize" "python-multiprocessing" "python-misc" "python-mmap" "python-ndg-httpsclient" "python-netclient" "python-pycrypto" "python-pyexecjs" "python-pydoc" "python-pyopenssl" "python-requests" "python-robotparser" "python-six" "python-shell" "python-sqlite3" "python-pysocks" "python-subprocess" "python-twisted-web" "python-unixadmin" "python-urllib3" "python-xmlrpc" )
fi

if [ -f /etc/opkg/opkg.conf ]; then
  STATUS='/var/lib/opkg/status'
  OSTYPE='Opensource'
  OPKG='opkg update'
  OPKGINSTAL='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
  STATUS='/var/lib/dpkg/status'
  OSTYPE='DreamOS'
  OPKG='apt-get update'
  OPKGINSTAL='apt-get install'
fi

install() {
  if ! grep -qs "Package: $1" "$STATUS"; then
    $OPKG >/dev/null 2>&1
    rm -rf /run/opkg.lock
    echo -e "> Need to install ${left} $1 ${right} please wait..."
    echo "$LINE2"
    sleep 0.8
    echo
    if [ "$OSTYPE" = "Opensource" ]; then
      $OPKGINSTAL "$1"
      sleep 1
      clear
    elif [ "$OSTYPE" = "DreamOS" ]; then
      $OPKGINSTAL "$1" -y
      sleep 1
      clear
    fi
  fi
}

for i in "${deps[@]}"; do
  install "$i"
done

if [ -f /etc/opkg/opkg.conf ]; then
    install='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
    install='apt-get install'
fi

#check python version
python=$(python -c "import platform; print(platform.python_version())")
sleep 1;
case $python in 
2.7.18)
$install libavcodec58 libavformat58 libpython2.7-1.0 > /dev/null 2>&1
;;
3.9.9)
$install libavcodec58  libavformat58 libpython3.9-1.0 > /dev/null 2>&1
;;
3.10.0|3.10.1|3.10.2|3.10.3|3.10.4|3.10.5|3.10.6)
$install libavcodec60  libavformat60 libpython3.10-1.0 > /dev/null 2>&1
;;
3.11.0|3.11.1|3.11.2|3.11.3|3.11.4|3.11.5|3.11.6)
$install libavcodec60  libavformat60 libpython3.11-1.0 > /dev/null 2>&1
;;
3.12.0|3.12.1|3.12.2|3.12.3|3.12.4|3.12.5|3.12.6)
$install libavcodec60  libavformat60 libpython3.12-1.0 > /dev/null 2>&1
;;
*)
echo ""
sleep 3
;;
esac

rm -rf /var/cache/opkg/*
rm -rf /var/lib/opkg/lists/*
rm -rf /run/opkg.lock
echo "> cache is cleaned...
updating feeds please wait..."
sleep 3

opkg update > /dev/null 2>&1

echo "> end of process...
> your device will reboot now...please wait..."
sleep 3

reboot