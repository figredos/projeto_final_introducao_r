library(readxl)
library(tidyverse)

dados_pubchem <- read.csv("data_pubchem.csv")

n <- 100000

# Limitando os dados a 100000 entradas.
# Limiting the data to 100000 entries
dados_pubchem <- dados_pubchem[row.names(dados_pubchem) %in% 1:n,]

# Filtrando os dados
# Filtering the data
dados_pubchem_filter <- select(dados_pubchem, 
                               SMILES,
                               PUBCHEM_CACTVS_HBOND_ACCEPTOR, 
                               PUBCHEM_CACTVS_HBOND_DONOR,
                               PUBCHEM_XLOGP3_AA, 
                               PUBCHEM_EXACT_MASS, 
                               PUBCHEM_MOLECULAR_FORMULA, 
                               PUBCHEM_CACTVS_ROTATABLE_BOND, 
                               PUBCHEM_CACTVS_TPSA)

# Tratando NA's
# Treating NA's
dados_pubchem_filter["PUBCHEM_XLOGP3_AA"][is.na(dados_pubchem_filter["PUBCHEM_XLOGP3_AA"])] <- 0

# Análise exploratória dos dados
# Exploratory analisys of the data

summary(dados_pubchem_filter)

# Variancia
# Variance
var(dados_pubchem_filter)

# Desvio padrao
# Standard deviation
sd(dados_pubchem_filter$SMILES)
sd(dados_pubchem_filter$PUBCHEM_CACTVS_HBOND_ACCEPTOR)
sd(dados_pubchem_filter$PUBCHEM_CACTVS_HBOND_DONOR)
sd(dados_pubchem_filter$PUBCHEM_XLOGP3_AA)
sd(dados_pubchem_filter$PUBCHEM_EXACT_MASS)
sd(dados_pubchem_filter$PUBCHEM_MOLECULAR_FORMULA)
sd(dados_pubchem_filter$PUBCHEM_CACTVS_ROTATABLE_BOND)
sd(dados_pubchem_filter$PUBCHEM_CACTVS_TPSA)

# Correlacao linear
# Linear correlation
cor(select(dados_pubchem_filter,
           PUBCHEM_XLOGP3_AA,
           PUBCHEM_CACTVS_ROTATABLE_BOND, 
           PUBCHEM_CACTVS_TPSA, 
           PUBCHEM_CACTVS_HBOND_ACCEPTOR, 
           PUBCHEM_CACTVS_HBOND_DONOR,
           PUBCHEM_EXACT_MASS))

# Plots
# TPSA
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_HBOND_ACCEPTOR, y= PUBCHEM_CACTVS_TPSA, alpha= PUBCHEM_CACTVS_TPSA)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_HBOND_DONOR, y= PUBCHEM_CACTVS_TPSA, alpha= PUBCHEM_CACTVS_TPSA)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_EXACT_MASS, y= PUBCHEM_CACTVS_TPSA, alpha= PUBCHEM_CACTVS_TPSA)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_ROTATABLE_BOND, y= PUBCHEM_CACTVS_TPSA, alpha= PUBCHEM_CACTVS_TPSA)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_XLOGP3_AA, y= PUBCHEM_CACTVS_TPSA, alpha= PUBCHEM_CACTVS_TPSA)) 


# Acceptor 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_HBOND_DONOR, y=  PUBCHEM_CACTVS_HBOND_ACCEPTOR, alpha=  PUBCHEM_CACTVS_HBOND_ACCEPTOR)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_EXACT_MASS, y=  PUBCHEM_CACTVS_HBOND_ACCEPTOR, alpha=  PUBCHEM_CACTVS_HBOND_ACCEPTOR)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_ROTATABLE_BOND, y=  PUBCHEM_CACTVS_HBOND_ACCEPTOR, alpha=  PUBCHEM_CACTVS_HBOND_ACCEPTOR)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_XLOGP3_AA, y=  PUBCHEM_CACTVS_HBOND_ACCEPTOR, alpha=  PUBCHEM_CACTVS_HBOND_ACCEPTOR)) 

# Rotatable Bound
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_CACTVS_HBOND_DONOR, y=  PUBCHEM_CACTVS_ROTATABLE_BOND, alpha=  PUBCHEM_CACTVS_ROTATABLE_BOND)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_EXACT_MASS, y=  PUBCHEM_CACTVS_ROTATABLE_BOND, alpha=  PUBCHEM_CACTVS_ROTATABLE_BOND)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_XLOGP3_AA, y=  PUBCHEM_CACTVS_ROTATABLE_BOND, alpha=  PUBCHEM_CACTVS_ROTATABLE_BOND)) 

# Donor
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_EXACT_MASS, y=  PUBCHEM_CACTVS_HBOND_DONOR, alpha=  PUBCHEM_CACTVS_HBOND_DONOR)) 
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_XLOGP3_AA, y=  PUBCHEM_CACTVS_HBOND_DONOR, alpha=  PUBCHEM_CACTVS_HBOND_DONOR)) 

# Log p3
ggplot(data=dados_pubchem_filter) + geom_point(mapping = aes(x= PUBCHEM_EXACT_MASS, y=  PUBCHEM_XLOGP3_AA, alpha=  PUBCHEM_XLOGP3_AA)) 

# Boxplot
boxplot(dados_pubchem_filter$PUBCHEM_CACTVS_HBOND_ACCEPTOR)
boxplot(dados_pubchem_filter$PUBCHEM_CACTVS_HBOND_DONOR)
boxplot(dados_pubchem_filter$PUBCHEM_EXACT_MASS)
boxplot(dados_pubchem_filter$PUBCHEM_CACTVS_ROTATABLE_BOND)
boxplot(dados_pubchem_filter$PUBCHEM_MOLECULAR_WEIGHT)
boxplot(dados_pubchem_filter$PUBCHEM_CACTVS_TPSA)
