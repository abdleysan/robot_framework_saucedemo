import requests
from robot.api import logger

class Authorization:
    def open_website(self, url):
        logger.info(f"Opening website: {url}")
        return requests.get(url).status_code