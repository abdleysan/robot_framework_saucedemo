import requests
from requests.auth import HTTPDigestAuth
import time
from robot.api import logger


class Authorization:
    def open_website(self, url):
        logger.info(f"Opening website: {url}")
        return requests.get(url).status_code
    
    def auth(self, url, username, password):
        #body = {'username': username, 'password': password}
        return requests.get(url, auth=HTTPDigestAuth(username, password))
    
    def open_catalog(self, url):
        return requests.get(url).status_code
    
    def loading_time(self, url):
        start_time = time.time()
        requests.get(url).status_code
        stop_time = time.time()
        return round(stop_time-start_time)
    
    
        
