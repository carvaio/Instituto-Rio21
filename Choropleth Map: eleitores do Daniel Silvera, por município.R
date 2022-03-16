library(tidyverse)
library(brazilmaps)
library(readxl)
library(ggplot2)
library(dplyr)

setwd("/Users/carol/Desktop/R")

mapa = get_brmap("City", geo.filter = list(State = 33)) 
mapa$nome = tolower(mapa$nome)

base = read_xls("daniel.xls")
base = base %>% select(codigo,Municipio,relacao,Daniel)
base$Municipio = tolower(base$Municipio)

maps=left_join(mapa, base,c("nome" = "Municipio"))
#Porcentagem dos votos válidos recebidos por Daniel Silveira em cada município

maps %>% 
  mutate(relacao = cut(relacao, c(0,0.05,0.1,0.5,1.5,15))) %>% 
  ggplot() +
  geom_sf(aes(fill = relacao), 
          colour = "black", size = 0.1) +
  geom_sf(data = get_brmap("City",geo.filter = list(State = 33)),
          fill = "transparent",
          colour = "black", size = 0.5) +
  scale_fill_viridis_d(name="% dos votos",option = "viridis", begin = 0.2, end = 0.8) +
  labs(title="Porcentagem dos votos válidos recebidos por Daniel Silveira",subtitle="em cada município do Rio de Janeiro",
       weight=0.1, size=8) +
  theme(panel.grid = element_line(colour = "transparent"),
        panel.background = element_blank(),
        plot.title = element_text(color="black", size=11, face="bold",hjust = 0.5),
        plot.subtitle = element_text(color="black", size=11, face="bold",hjust = 0.5),
        axis.text = element_blank(),
        axis.ticks = element_blank())


