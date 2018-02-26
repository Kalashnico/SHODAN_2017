#!/bin/bash

curl -sLk 'https://46.105.49.65/018fc65524c8/login.php' \
     -d "user=Cartman&password=wh47_4_h4x0r" \
     | grep -oE '[0-9a-f]{128}'
