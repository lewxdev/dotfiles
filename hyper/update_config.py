import os
import requests
from datetime import datetime
from collections import namedtuple
from bs4 import BeautifulSoup


TARGET_URL = "https://hyper.is/"
FILEPATH = "./update_config/config.js"

Option = namedtuple("Option", ("property", "default", "description"))
response = requests.get(TARGET_URL)

if response.ok:
    soup = BeautifulSoup(response.text, "html.parser")
    config_options = soup.select("table.config>tbody tr")

    updated_config = [
        Option(*[
            component.get_text(strip=True)
            for component in option.select("td")
        ])
        for option in config_options
    ]

    if os.path.exists(FILEPATH):
        os.remove(FILEPATH)

    with open(FILEPATH, "w") as js:
        js.writelines([
            f"// Generated from {TARGET_URL}\n",
            f"// Last Update: {datetime.now()}\n\n",
            "config = {\n",
            ",\n\n".join(
                f"\t// {option.description}\n\t{option.property}: {option.default}"  # noqa
                for option in updated_config
            ),
            "\n}"
        ])
