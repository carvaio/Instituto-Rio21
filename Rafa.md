```python
from bs4 import BeautifulSoup
import requests
import csv
import os
import time
import cfscrape
import re
import json
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from collections import Counter as cnt
import pandas as pd
from selenium.webdriver import ActionChains
import cfscrape
import cloudscraper
```


```python
url = 'https://www.1746.rio/portal/acessar?redirect_url=http://www.1746.rio/portal/perfil/minhas-solicitacoes'

driver = webdriver.Safari()
driver.get(url)
driver.maximize_window()

time.sleep(20)

email = driver.find_element_by_css_selector('body > div.container > #content > #acessar-view > div > div > section > div > div > form > fieldset > #diazo-71032_3 > #login-modal')
email.send_keys("rafaella.salles@rio21.org")

senha = driver.find_element_by_css_selector("body > div.container > #content > #acessar-view > div > div > section > div > div > form > fieldset > #diazo-71032_3 > #password")
senha.send_keys("Rs220s251**")

botao = driver.find_element_by_css_selector('#acessar-view > div > div > section > div > div > form > fieldset > div:nth-child(4) > button')
botao.click()

time.sleep(20)

acomp = driver.find_element_by_css_selector('#portaltab-acompanhamento-de-solicitacoes > a')
acomp.click()

time.sleep(20)

area = driver.find_element_by_css_selector('#ver-suas-solicitacoes > div > a')
area.click()

time.sleep(20)
    
num = list(range(1, 14))
converted_num = []

for y in num:
    y = str(y)
    converted_num.append(y)

for x in range(0,14):
    url='https://www.1746.rio/portal/perfil/minhas-solicitacoes?page='+converted_num[x]
    driver.get(url)
    ids = driver.find_elements_by_xpath("//*[contains(@id,'RIO')]")
    serviços = driver.find_elements_by_xpath("//*[contains(@id,'RIO')]/div[1]/div[2]/div[2]/div[1]/p")
    
    for r in ids:
        ii = r.get_attribute('id')
        print(ii)
        
    for e in serviços:
        ss = e.get_attribute('p')
        print(ss)

        #serviço = driver.find_element_by_css_selector('#RIO-23974184-0 > div.collapsible-header.p-t-0.p-b-20.active > div.p-l-10 > div:nth-child(2) > div.col.s12.l5 > p')
        #abertura = driver.find_element_by_xpath('//*[@id="RIO-23961951-4"]/div[1]/div[1]/div[1]/small')
        #status = driver.find_element_by_xpath('//*[@id='+ii+']/div[1]/div[2]/div[2]/div[3]/span')
        #aba = driver.find_element_by_xpath('//*[@id="RIO-23961951-4"]/div[1]/div[1]/div[2]/span')
        #aba.click()
        #resposta = driver.find_element_by_xpath('//*[@id="RIO-23961951-4"]/div[2]/div[1]/div[2]/div[2]')
```

    RIO-23974184-0
    RIO-23974181-6
    RIO-23952950-2
    RIO-23952828-8
    RIO-23952810-4
    RIO-23946311-8
    RIO-23946310-5
    RIO-23946309-2
    RIO-23946306-0
    RIO-23946305-7
    None
    None
    None
    None
    None
    None
    None
    None
    None
    None
    RIO-23946304-4
    RIO-23946302-8
    RIO-23946300-2
    RIO-23919236-4
    RIO-23919231-4
    RIO-23919224-2
    RIO-23919221-0
    RIO-23919219-8
    RIO-23919214-8
    RIO-23919212-0
    None
    None
    None
    None
    None
    None
    None
    None
    None
    None
    RIO-23919210-4
    RIO-23919209-4
    RIO-23919201-4
    RIO-23919198-5
    RIO-23900766-0
    RIO-23888384-5
    RIO-23880109-4
    RIO-23879863-0
    RIO-23879858-0
    RIO-23879850-0
    None
    None
    None
    None
    None
    None
    None
    None
    None
    None



    ---------------------------------------------------------------------------

    WebDriverException                        Traceback (most recent call last)

    <ipython-input-41-74d2c2cd3d70> in <module>
         37 for x in range(0,14):
         38     url='https://www.1746.rio/portal/perfil/minhas-solicitacoes?page='+converted_num[x]
    ---> 39     driver.get(url)
         40     ids = driver.find_elements_by_xpath("//*[contains(@id,'RIO')]")
         41     serviços = driver.find_elements_by_xpath("//*[contains(@id,'RIO')]/div[1]/div[2]/div[2]/div[1]/p")


    /opt/anaconda3/lib/python3.8/site-packages/selenium/webdriver/remote/webdriver.py in get(self, url)
        331         Loads a web page in the current browser session.
        332         """
    --> 333         self.execute(Command.GET, {'url': url})
        334 
        335     @property


    /opt/anaconda3/lib/python3.8/site-packages/selenium/webdriver/remote/webdriver.py in execute(self, driver_command, params)
        319         response = self.command_executor.execute(driver_command, params)
        320         if response:
    --> 321             self.error_handler.check_response(response)
        322             response['value'] = self._unwrap_value(
        323                 response.get('value', None))


    /opt/anaconda3/lib/python3.8/site-packages/selenium/webdriver/remote/errorhandler.py in check_response(self, response)
        240                 alert_text = value['alert'].get('text')
        241             raise exception_class(message, screen, stacktrace, alert_text)
    --> 242         raise exception_class(message, screen, stacktrace)
        243 
        244     def _value_or_default(self, obj, key, default):


    WebDriverException: Message: 




```python

```
