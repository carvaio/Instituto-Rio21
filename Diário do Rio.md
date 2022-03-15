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
import cfscrape
import cloudscraper
```


```python
scraper = cloudscraper.create_scraper()

num = list(range(1, 81))
converted_num = []
todos_links=[]

for y in num:
    y = str(y)
    converted_num.append(y)

for x in range(0,80):
    url='https://diariodorio.com/page/'+converted_num[x]+'/?s'
    print(url)
    r = scraper.get(url)
    soup = BeautifulSoup(r.content,'html.parser')
    conteudo = soup.find_all('h3',class_='entry-title td-module-title')
    
    for link in conteudo:
        acesso = link.find('a')['href']
        todos_links.append(acesso)
        print(acesso)
```

```python
#mudar nome de arquivo de acordo com mês
csv_file = open('ddr_fevereiro22.csv','w', encoding='utf-8')
csv_writer= csv.writer(csv_file,delimiter =";")
csv_writer.writerow(['link','data','titulo','autor'])
```

```python
tudo=[]

for i in todos_links:
    source = i
    r = scraper.get(source)
    soup = BeautifulSoup(r.content,'html.parser')
    content = soup.find_all('header',class_="td-post-title")
    
    for a in content:
        titulo = a.find('h1', {'class' : 'entry-title'}).text
        autor = a.find('div',class_='td-post-author-name').text
        data = a.find("span",class_='td-post-date').text
        link=i
        
        tudo.append([link,data,titulo,autor])
        print(link,titulo,autor,data)
        csv_writer.writerow([link,data,titulo,autor])

csv_file.close
```

```python
planilha = pd.DataFrame(tudo, columns=['link','data','titulo','categoria'])  
```


```python
#lembrar de mudar nome de arquivo
planilha.to_excel('ddr_fevereiro22.xlsx',index = False)
```

