```python
import os
import pandas as pd
from pandas import read_excel
import geobr
from geobr import read_municipality
from geobr import read_neighborhood
import folium
import shapely.geometry
import geopandas
import jsons
```

```python
#saber diretório
os.getcwd()
```

```python
df = read_excel('/Users/carol/Desktop/millenials.xlsx')
```

```python
df
```

```python
df_json = df.to_json()
```

```python
bairros= read_neighborhood(year=2010)
```

```python
bairros_rj = bairros[(bairros.name_muni == "Rio De Janeiro")]
```

```python
bairros_rj
```

```python
geral = pd.merge(bairros_rj, df, on=["name_neighborhood"])
```

```python
geral.to_json()
```

```python
bairros_rj.to_json()
```

```python
#criando mapa
m = folium.Map(location=[-22.91546610533585, -43.43023067688268], tiles = 'cartodbpositron',zoom_start=11)

#criando tipos de layers
tiles = ['stamenwatercolor', 'cartodbpositron', 'openstreetmap', 'stamenterrain']
for tile in tiles:
    folium.TileLayer(tile).add_to(m)

#adicionando camada de cores
choropleth =folium.Choropleth(
    geo_data=geral,
    name='choropleth',
    data=df,
    columns=['name_neighborhood', 'proporção'],
    key_on='feature.properties.name_neighborhood',
    Highlight= True,
    fill_color='Blues',
    fill_opacity=1,
    line_opacity=1,
    legend_name='Taxa de Millenials (%)',
    threshold_scale=[0, 0.9, 1.7, 2.6, 3.4, 4.3,5.2]
    
).add_to(m)

#adicionando labels dos bairros
choropleth.geojson.add_child(
    folium.features.GeoJsonTooltip(['name_neighborhood','proporção'],labels=False))

#choropleth.add_child(folium.)

#adicionando opção de diferentes layers
folium.LayerControl().add_to(m)
m
```

```python
m.save("millenials_bairros.html")
```
