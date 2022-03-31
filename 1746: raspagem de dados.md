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
csv_file = open('ocorrencias.csv','w', encoding='utf-8')
csv_writer= csv.writer(csv_file)
csv_writer.writerow(['protocolo','status2','abertura2','fechamento2'])
```

```python
url = 'https://www.1746.rio/portal/acessar?redirect_url=http://www.1746.rio/portal/perfil/minhas-solicitacoes'

driver = webdriver.Safari()
driver.get(url)
driver.maximize_window()

infos=[]

time.sleep(20)

email = driver.find_element_by_css_selector('body > div.container > #content > #acessar-view > div > div > section > div > div > form > fieldset > #diazo-71032_3 > #login-modal')
email.send_keys("gisele@rio21.org")

senha = driver.find_element_by_css_selector("body > div.container > #content > #acessar-view > div > div > section > div > div > form > fieldset > #diazo-71032_3 > #password")
senha.send_keys("instituto21")

botao = driver.find_element_by_css_selector('#acessar-view > div > div > section > div > div > form > fieldset > div:nth-child(4) > button')
botao.click()

time.sleep(20)

acomp = driver.find_element_by_css_selector('#portaltab-acompanhamento-de-solicitacoes > a')
acomp.click()

time.sleep(20)

area = driver.find_element_by_css_selector('#ver-suas-solicitacoes > div > a')
area.click()

time.sleep(20)
    
num = list(range(1, 44))
converted_num = []

for y in num:
    y = str(y)
    converted_num.append(y)

for x in range(0,43):
    url='https://www.1746.rio/portal/perfil/minhas-solicitacoes?page='+converted_num[x]
    driver.get(url)
    time.sleep(20)
    ids = driver.find_elements_by_xpath("//*[contains(@id,'RIO')]")

    for ii in ids:
        protocolo = ii.get_attribute('id')
        abertura = driver.find_element_by_xpath('//*[@id="'+protocolo+'"]/div[1]/div[1]/div[1]/small')
        abertura2 = abertura.text
        
        status = driver.find_element_by_xpath('//*[@id="'+protocolo+'"]/div[1]/div[2]/div[2]/div[3]/span')
        status2 = status.text
        
        if status2 == 'Fechado': 
            status.click()
            fechamento = driver.find_element_by_xpath('//*[@id="'+protocolo+'"]/div[2]/div[1]/div[2]/div[2]')
            fechamento2 = fechamento.text
            infos.append([protocolo,status2,abertura2,fechamento2])
            print(protocolo,status2,abertura2,fechamento2)
            csv_writer.writerow([protocolo,status2,abertura2,fechamento2])
        else:
            infos.append([protocolo,status2,abertura2])
            print(protocolo,status2,abertura2)
            csv_writer.writerow([protocolo,status2,abertura2])
            
csv_file.close      
```
