library(geobr)
library(ggplot2)
library(sf)
library(dplyr)
library(readxl)
library(extrafont)
library(wesanderson)
library(ColorBrewer)

setwd = "/Users/carol/Desktop/R"
bairros = read_neighborhood(year=2010)
bairros_rj = bairros %>% filter(name_muni=="Rio De Janeiro")
bairros_rj = bairros_rj %>% select(name_neighborhood,geom,code_neighborhood)

#necessario para merge acontecer sem problemas
bairros_rj$code_neighborhood = as.numeric(levels(bairros_rj$code_neighborhood))[bairros_rj$code_neighborhood]

base = read_xlsx("/Users/carol/Desktop/R/regiao_mora_mar22.xlsx")

maps = left_join(bairros_rj,base,by="code_neighborhood",all=TRUE)

#mais opcoes de fontes
font_import()
loadfonts(device="win")

#nao usei
ggplot(data=maps) +
  geom_sf(data=maps[maps$regiao %in% c("centro"), ], fill="#26AFC8",color="black")+
  geom_sf(data=maps[maps$regiao %in% c("zona sul"), ], fill="#5D4898",color="black")+
  geom_sf(data=maps[maps$regiao %in% c("zona norte"), ], fill="#4B6AA8",color="black")+
  geom_sf(data=maps[maps$regiao %in% c("zona oeste"), ], fill="#388DB8",color="black")+
  labs(subtitle="Município do Rio de Janeiro")+
  theme_void()+
  theme(text=element_text(family="Arial", size=14))

maps$porc = cut(maps$porc,breaks=c(0,0.05,0.17,0.36,0.41))

ggplot(data=maps)+
  geom_sf(aes(fill=porc),color="black")+
  theme_void()+
  labs(subtitle="Município do Rio de Janeiro")+
  theme(text=element_text(family="Arial", size=14))+
  scale_fill_brewer(name="Entrevistados", type="seq",palette="Purples",labels=c("5,3%","17,1%","36,6%","41,1%"))+
  annotate("text",x=-43.67807151583586,y=-22.839309423653157, label= "Zona Oeste")+
  annotate("text",x=-43.36427452738515,y=-22.79008320650884, label= "Zona Norte")+
  annotate("text",x=-43.14570609642406,y=-22.875839082449834, label= "Centro")+
  annotate("text",x=-43.18943812216233,y=-22.9994017494222067, label= "Zona Sul")
