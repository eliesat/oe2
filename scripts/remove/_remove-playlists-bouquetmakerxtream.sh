#!/bin/sh

echo "> removing bouquetmakerxtream playlists please wait..."
sleep 3
sed -i '/http/d' /etc/enigma2/bouquetmakerxtream/playlists.txt >/dev/null 2>&1
echo "> done"
sleep 3