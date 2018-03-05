#!/bin/bash

curl -sk 'https://46.105.49.65/4adf139562fd/' \
     | grep -oE '[0-9a-f]{128}'
