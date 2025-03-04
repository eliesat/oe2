#!/bin/sh

echo "> removing ipaudio playlists please wait..."
sleep 3

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/IPAudio ]; then

file1="/tmp/tmpFile"
file2="/etc/enigma2/ipaudio.json"

rm -rf "$file1" > /dev/null 2>&1

cat <<F >"$file1"

{
    "playlist":[{
        "channel":"TEST",
        "url":"http://URL/USER/PASS/CH_ID"

    }]
}

F
mv "$file1" "$file2"

elif [ -d /usr/lib/enigma2/python/Plugins/Extensions/IPaudioPro ]; then

file3="/tmp/tmpFile"
file4="/etc/enigma2/ipaudio.json"

rm -rf "$file3" > /dev/null 2>&1

cat <<F >"$file3"

{
    "streams": [
        {
            "name": "this field is used to display picons and epg",
            "display_name": "TEST",
            "url": "http://streams-link"
        }
    ]
}

F

mv "$file3" "$file4"

else
echo "> install ipaudio plugin and try again"

exit 1

fi
echo "> done"
sleep 3