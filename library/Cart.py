import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from robot.api import logger


class Cart:
    def empty_cart(self, url):
        driver = webdriver.Chrome()
        driver.get(url)
        try:
            cart_items = driver.find_element(By.CLASS_NAME,'cart_list')
        except "NoSuchElementException":
            cart_items = None
           
    def add_to_cart(self, url):
        driver = webdriver.Chrome()
        driver.get(url)
        item = driver.find_element(By.XPATH,'//*[@id="inventory_container"]/div/div[2]/div[3]/button').click()
        if driver.find_element(By.XPATH,'//*[@id="shopping_cart_container"]/a/span').text  >= '1':
            return True
        else:
            return False 
        
    def buy_item(self, url):
        params = {'first-name': 'test', 'last-name': 'test', 'postal-code': 'test'}
        requests.post(url, params=params)
        url_checkout = 'https://www.saucedemo.com/v1/checkout-step-two.html'
        requests.get(url_checkout)
        driver = webdriver.Chrome()
        driver.get(url_checkout)
        driver.find_element(By.CSS_SELECTOR,'#checkout_summary_container > div > div.summary_info > div.cart_footer > a.btn_action.cart_button').click()
        return requests.get('https://www.saucedemo.com/v1/checkout-complete.html').status_code
        
            
