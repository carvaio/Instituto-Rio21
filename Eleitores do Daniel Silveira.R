library("electionsBR")
library("dplyr")
library("openxlsx")

setwd("~/Desktop")

#dados sobre daniel silveira 
data = vote_section_fed(2018, uf='RJ')
data = data %>% filter(NUM_VOTAVEL==1796)
data = data %>% select(CODIGO_MUNICIPIO,NOME_MUNICIPIO,NUMERO_ZONA,QTDE_VOTOS)

#votos no daniel silveira por zona eleitoral em petropolis
petropolis = data %>% filter(NOME_MUNICIPIO=='PETRÓPOLIS')
#write.xlsx(petropolis, 'daniel.xlsx')

#votos no daniel silveira por zona eleitoral na cidade do rio de janeiro
rio = data %>% filter(NOME_MUNICIPIO=='RIO DE JANEIRO')
#write.xlsx(rio, 'rio.xlsx')

#dados sobre eleitores elegiveis
dados = details_mun_zone_fed(2018,uf='RJ')
dados = dados %>% select(CODIGO_MUNICIPIO,DESCRICAO_CARGO,NOME_MUNICIPIO,QTD_VOTOS_NOMINAIS,QTD_APTOS,QTD_APTOS_TOT,QTD_VOTOS_LEGENDA)
dados = dados %>% filter(DESCRICAO_CARGO=="Deputado Federal")

#eleitores elegiveis em petropolis
petro_eleitores = dados %>% filter(NOME_MUNICIPIO=='PETRÓPOLIS')
#write.xlsx(petro_eleitores, 'rio.xlsx')

#eleitores elegiveis na cidade do rio de janeiro
rio_eleitores = dados %>% filter(NOME_MUNICIPIO=='RIO DE JANEIRO')
#write.xlsx(rio_eleitores, 'rio.xlsx')

#votos validos no estado do rio por municipio
validos = dados %>% select(CODIGO_MUNICIPIO,NOME_MUNICIPIO,DESCRICAO_CARGO,QTD_VOTOS_NOMINAIS,QTD_VOTOS_LEGENDA)
#write.xlsx(validos, 'rio.xlsx')

#votos no daniel silveira no estado do rio para fazer o heatmap
mapa = vote_section_fed(2018, uf='RJ')
mapa = mapa %>% filter(NUM_VOTAVEL==1796)
mapa = mapa %>% select(CODIGO_MUNICIPIO,NOME_MUNICIPIO,QTDE_VOTOS)
#write.xlsx(mapa, 'daniel.xlsx') 



