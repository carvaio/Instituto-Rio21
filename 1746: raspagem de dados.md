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

#inserir senha
senha = driver.find_element_by_css_selector("body > div.container > #content > #acessar-view > div > div > section > div > div > form > fieldset > #diazo-71032_3 > #password")
senha.send_keys("inserir")

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
