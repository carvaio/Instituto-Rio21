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
from collections import Counter as cnt
import pandas as pd
from selenium.webdriver import ActionChains
```


```python
#Atualizar nome do arquivo de acordo com o mês
csv_file = open('veja_fev22.csv','w', encoding='utf-8')
csv_writer= csv.writer(csv_file)
csv_writer.writerow(['link','data','titulo','categoria'])
```

```python
driver = webdriver.Safari()
url = 'https://vejario.abril.com.br/?s=&orderby=date'
driver.get(url)
driver.maximize_window()

#loadMoreButton = driver.find_element_by_css_selector("#infinite-handle > span > button")
loadMoreButton = driver.find_element_by_xpath("//*[@id='infinite-handle']")

for i in range(30):
    loadMoreButton.click()
    time.sleep(20)
    
elems = driver.find_elements_by_xpath("//div/div[1]/a[@href]")

for elem in elems:
    print(elem.get_attribute("href"))
    

driver.close() 
```

```python
#Copie as urls geradas acima e cole em um arquivo de excel. Selecione todas as urls e clique em 'Remover Duplicatas' localizada em 'Dados'. 
#Na coluna ao lado use a função CONCATENAR() para colocar aspas simples (') entre os links e vírgula (,) no final também 
```

```python
#irá copiar e colar os links com aspas e vígulas do excel abaixo. Apagar a vírgula do último link.
todos_links = []
```

```python
tudo=[]
for i in todos_links:
    scraper = cfscrape.create_scraper()
    source = i
    r = scraper.get(source)
    soup = BeautifulSoup(r.content,'html.parser')
    content = soup.find_all("div",class_="post-header")
    link = i

    for a in content:
        try:
            data = a.find('span',class_='author').text
        except:
            data = None
        try:
            titulo = a.find('h1').text
        except:
            titulo=None
        try:
            categoria = a.find('div',class_='category').text
        except:
            categoria = None
        
        
        tudo.append([link,data,titulo,categoria])
        print(link,data,titulo,categoria)    
        csv_writer.writerow([link,data,titulo,categoria])

csv_file.close
```

```python
planilha = pd.DataFrame(tudo, columns=['link','data','titulo','categoria']) 
```

```python
#lembrar de alterar o nome do arquivo
planilha.to_excel('veja_fevereiro22.xlsx',index = False)
```
