library(ggplot2)
library(dplyr)
library(sf)
library(brazilmaps)
library(readxls)
library(viridis)
library(geobr)
library(Rgb)
library(RColorBrewer)
library(colourvalues)
library(Polychrome)
library(paletti)
library(tidyverse)
library(glue)
library(xlsx)


brasil = get_brmap(geo=c("State"))

mapa = get_brmap(geo="City")
mapa$nome = tolower(mapa$nome)

target <- c("aracaju","belém","belo horizonte","boa vista","brasília","campo grande", "cuiabá","curitiba",
            "florianópolis","fortaleza","goiânia","joão pessoa","macapá","maceió","manaus","natal","palmas",
            "porto alegre","porto velho","recife","rio branco","rio de janeiro","salvador","são luís",
            "são paulo","teresina","vitória")
mapa = filter(mapa, nome %in% target)

#limpado: boa vista, rio branco, belém, palmas, campo grande
mapa = mapa[-c(2,12,13,16,17,26),]

#nome=="boa vista" & State="RR", 14)
#nome=="rio branco" & State="AC",12)
#nome=="belém" & State="PA",15)
#nome=="palmas" & State="TO",17)
#nome=="campo grande" & State="MS",50)

setwd("/Users/carol/Desktop/R")

base = read_xlsx("saneamento_data.xlsx")
base$name_muni = tolower(base$name_muni)

maps=left_join(mapa, base,c("nome" = "name_muni"))

#arrumando NA
#belém
 maps[4,7]="PA"
 maps[4,8]= 46.57
 maps[4,9]=31.2
 maps[4,10]=-14.583319493775000
 maps[4,11] = -48.50529224210170

#macapá
 maps[5,7]="AP"
 maps[5,8]=1.9
 maps[5,9]=3.78
 maps[5,10]=0.040830245177469235
 maps[5,11]=-51.058585710162600 
  
#joão pessoa
 maps[11,7]="PB"
 maps[11,8]=22.49
 maps[11,9]=27.8
 maps[11,10]=-71.45240915409140
 maps[11,11]=-34.86040041459720

#maceio
 maps[13,7]="AL"
 maps[13,8]=28.12
 maps[13,9]=27.6
 maps[13,10]=-96.52090026880600
 maps[13,11]=-35.71870575379010
 
 
#florianopolis
 maps[21,7]="SC"
 maps[21,8]=48.47
 maps[21,9]=96.75
 maps[21,10]=-27.59603727570880
 maps[21,11]=-48.54023261543550

#goiania
  maps[26,7]="GO"
  maps[26,8]=77.6
  maps[26,9]=51.18
  maps[26,10]=-16.68958030093310
  maps[26,11]=-49.28144837159480

#brasilia
  maps[27,7]="DF"
  maps[27,8]=251.67
  maps[27,9]=83.47
  maps[27,10]=-15.794409581787500
  maps[27,11]=-47.889133050097400
  
#cuiaba
  maps[24,7]="MT"
  maps[24,8]=115.91
  maps[24,9]=189.22 
  maps[24,10]=-15.601742989267000
  maps[24,11]=-56.07276401781740

BR <- read_state(year=2018)
BR <- cbind(BR, st_coordinates(st_centroid(BR)))
  

mybreaks = c(40,80,120,160,200)

#cores em HEX
institutorio21= c("roxo"="#5D4898",
                  "azul_es"="#4385C5",
                  "azul_cl"="#26AFC8",
                  "verde"="#5DB131",
                  "amarelo"="#FAC026")

viz_palette(institutorio21)


#construção do mapa    
ggplot() +
geom_sf(data = BR,
        fill = "white",
        colour = "grey50", 
        size = 0.3) + 
geom_point(data=base, aes(x=long, y=lat,size=Media_Hab,color=Media_Hab),alpha=0.5)+
scale_size_continuous(name="Média (R$/Hab.)",breaks=mybreaks,range=c(1,20))+
scale_color_gradient(name="Média (R$/Hab.)",breaks=mybreaks,low="#26AFC8",high="#5D4898")+
theme_void()+  
guides(size=guide_legend(),color=guide_legend())+
geom_text(data = BR, aes(X, Y, label = abbrev_state,fontface="bold"), colour = "black",size=2.8,hjust=0.5)+
theme(legend.text = element_text(face="bold"),
      legend.title = element_text(face="bold"))
