library("basedosdados")
library(dplyr)

set_billing_id("inserir")

base = read_sql("SELECT * FROM `basedosdados.br_inep_censo_escolar.turma` WHERE id_municipio= \'3304904\'",page_size=9000)

base = base %>% filter(ano==2020)
base = base %>% filter(rede=='municipal')

write.csv(base,"sao-goncalo.csv")
