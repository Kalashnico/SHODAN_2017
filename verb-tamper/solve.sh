#!/bin/bash

curl -kvX VIC 'https://46.105.49.65/957c3416a8e8/' | grep -oE '[0-9a-f]{128}'
