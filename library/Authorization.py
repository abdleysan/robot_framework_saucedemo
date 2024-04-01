import requests
from requests.auth import HTTPDigestAuth
from robot.api import logger


class Authorization:
    def open_website(self, url):
        logger.info(f"Opening website: {url}")
        return requests.get(url).status_code
    
    def auth(self, url, username, password):
        #body = {'username': username, 'password': password}
        return requests.get(url, auth=HTTPDigestAuth(username, password)).status_code
    
