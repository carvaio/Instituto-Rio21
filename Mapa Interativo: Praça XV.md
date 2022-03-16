```python
%matplotlib inline
import geopandas as gpd
import folium
```


```python
mapa = folium.Map(location=[-22.904682619174814, -43.174101557913964],
                 tiles="OpenStreetMap",
                 zoom_start=16)
```


```python
folium.Marker(
    location=[-22.90492415888843, -43.175145975621334],
    popup="Rua São José, 35",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901683071998434, -43.17518356027998],
    popup="Rua do Ouvidor, 22/24",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90214590641625, -43.17647106268916],
    popup="Rua do Rosário, 76",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.905076496164604, -43.17554308357295],
    popup="Rua São José, 54",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.906336646675253, -43.174273946785945],
    popup="Avenida Nilo Peçanha, 11",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.904904393110655, -43.174963585420365],
    popup="Rua São José, 35",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903870274706975, -43.17687192959702],
    popup="Rua da Quitanda, 49",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.904165245795866, -43.176620275621374],
    popup="Rua Sete de Setembro, 55",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.902693949491688, -43.17465911519481],
    popup="Praça XV, 38",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.904593675602886, -43.174435371926464],
    popup="Rua São José, 25",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903546426045605, -43.172106183360945],
    popup="Avenida Alfred Agache, 3",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90567409411995, -43.17446747987796],
    popup="Avenida Erasmo Braga, 299",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.905134727694367, -43.17492944493861],
    popup="Avenida Erasmo Braga, 278",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90295309055189, -43.17588024493854],
    popup="Beco dos Barbeiros, 12",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903445157164562, -43.17397746638403],
    popup="Praça XV, 48",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.904763927154022, -43.17577314493861],
    popup="Rua da Assembleia, 45",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901753622768073, -43.17689039521945],
    popup="Rua Buenos Aires, 20",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.902171204914954, -43.17705710686584],
    popup="Rua da Quitanda, 98",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901771039690285, -43.174989273773896],
    popup="Rua do Ouvidor, 21",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901908021567433, -43.17484019521949],
    popup="Rua do Ouvidor, 31",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.902016138588046, -43.17453453939609],
    popup="Rua do Mercado, 21",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901648205727366, -43.17469394493856],
    popup="Rua do Ouvidor, 16",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901591522531987, -43.17512420260937],
    popup="Rua do Ouvidor, 20",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.900854638288347, -43.17572454493858],
    popup="Rua Visconde de Itaboraí, 20",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903322491036327, -43.1760305179507],
    popup="Rua do Carmo, 38 sobreloja",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.902567707000067, -43.1751691449387],
    popup="Rua 1º de Março, 8",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903874391760013, -43.17679607377393],
    popup="Rua da Quitanda, 45",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90124955460565, -43.175639673774015],
    popup="Rua Visconde de Itaboraí, 8",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90361507657583, -43.1732551314446],
    popup="Rua Dom Manoel, 15",
    icon=folium.Icon(color='black')).add_to(mapa)

folium.Marker(
    location=[-22.90397329188969, -43.17366364493856],
    popup="Travessa do Paço, 14",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.903887042927426, -43.173554387267885],
    popup="Travessa do Paço, 10",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.90502549607537, -43.17633526028003],
    popup="Rua da Quitanda, 30",
    icon=folium.Icon(color='black') ).add_to(mapa)

folium.Marker(
    location=[-22.901836590499627, -43.17519513144464],
    popup="Rua do Ouvidor, 33",
    icon=folium.Icon(color='black') ).add_to(mapa)
```


```python
mapa
```




```python
mapa.save("praçaXV.html")
```


