# import os
import json
import json5
import requests
# from datetime import datetime
from collections import namedtuple
from bs4 import BeautifulSoup

response = requests.get("https://hyper.is/")

ConfigFlag = namedtuple("ConfigFlag", ("default", "description"))


if response.ok:
    soup = BeautifulSoup(response.text, "html.parser")
    config_soup = soup.select("table.config>tbody tr")

    config_flags = {
        flag.select_one("td:first-child").get_text(): ConfigFlag(
            *[
                content.get_text()
                for content in flag.select("td:not(:first-child)")
            ]
        )
        for flag in config_soup
    }

    with open(".hyper.js") as config:
        it = json5.load(config)
        print(it)
