# Instale e carregue os pacotes
install.packages("dplyr")
install.packages("readr")
install.packages("readxl")
install.packages("openxlsx")
library(readxl)
library(dplyr)
library(readr)
library(openxlsx)

setwd("C:/Users/55229/Desktop/bolsa_alfredo")
getwd()

# # Leia a tabela de relação de códigos de municípios e regiões de saúde
# tabela_ibge <- read_excel("codigos_ibge.xlsx") # Substitua pelo caminho do seu arquivo
# 
# # Leia o arquivo do Excel
# dados_municipios <- read_excel("idh_ivs.xlsx") # Substitua pelo caminho do seu arquivo
# 
# # Faça a junção dos dados
# dados_com_regiao <- left_join(dados_municipios, tabela_ibge, by = c("Município com 6 dígitos" = ""))
# 
# # Agora, 'dados_com_regiao' conterá as linhas identificadas pelos códigos de municípios, juntamente com a informação da região de saúde.
# 
# 


# Ler os arquivos
codigo_ibge <- read_excel("codigos_ibge.xlsx")
macrorregiao <- read_excel("macrorreg.xlsx")
idh_ivs <- read_excel("idh_ivs.xlsx")

idh_ivs$`Município com 6 dígitos`<-as.numeric(idh_ivs$`Município com 6 dígitos`)
macrorregiao$Regiao<-as.numeric(macrorregiao$Regiao)


# Juntar os data frames
result <- idh_ivs %>%
  left_join(codigo_ibge, by = c("Município com 6 dígitos" = "municipio")) %>%
  left_join(macrorregiao, by = c("regiao de saude" = "Regiao"))

# Salvar o resultado
write.xlsx(result, "idh_ivs_com_codigos_atualizado.xlsx")
