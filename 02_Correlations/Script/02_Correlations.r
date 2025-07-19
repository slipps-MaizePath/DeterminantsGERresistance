# ESTIMATING CORRELATIONS BETWEEN ENVIRONMENTS AND AMONG TRAITS WITH LS MEANS

# PACKAGES
library(tidyverse)
library(Hmisc) #corrs

# LOAD AND FORMAT
lsmeans <- read.csv("./../Data/All-SAS-LSMeans_20241121.csv", header = T)
lsmeans$plot <- as.factor(lsmeans$plot)

for (i in c(2:16)) {
  lsmeans[,i] <- as.numeric(lsmeans[,i])
}

#raw meta file
meta <- read.csv("./../Data/MEG_MetaFile_ForAnalysis_SL_2024-08-26.csv", header = T)

for (i in c(1:19)) {
  meta[,i] <- as.factor(meta[,i])
}

for (i in c(26:51)) {
  meta[,i] <- as.numeric(meta[,i])
}

# CORRELATIONS WITHIN ENVIRONMENTS
meta %>% filter(Treatment == "Inoc") -> inoc
meta %>% filter(Treatment == "UN") -> un

## MWF
inoc %>% filter(Field == "MF1300-I") -> mf.raw
rcorr(as.matrix(mf.raw[,c(26:28,46,48:51)]), type = "spearman") -> mf 
write.table(mf$r, "./../Output/Corrs_Maxwell2021.csv", col.names = T, sep = ",")
write.table(paste("P-Values"), "./../Output/Corrs_Maxwell2021.csv", col.names = F, sep = ",", append = T)
write.table(mf$P, "./../Output/Corrs_Maxwell2021.csv", col.names = F, sep = ",", append = T)

## ANSC
inoc %>% filter(Field == "ANSC") -> ansc.raw
rcorr(as.matrix(ansc.raw[,c(26:28,46,48:51)]), type = "spearman") -> ansc
write.table(ansc$r, "./../Output/Corrs_ANSC2022.csv", col.names = T, sep = ",")
write.table(paste("P-Values"), "./../Output/Corrs_ANSC2022.csv", col.names = F, sep = ",", append = T)
write.table(ansc$P, "./../Output/Corrs_ANSC2022.csv", col.names = F, sep = ",", append = T)

## CFAR
inoc %>% filter(Field == "CFAR500-2021") -> cfar2021.raw
rcorr(as.matrix(cfar2021.raw[,c(26:28,46,48:51)]), type = "spearman") -> cfar2021 
write.table(cfar2021$r, "./../Output/Corrs_CFAR2021.csv", col.names = T, sep = ",")
write.table(paste("P-Values"), "./../Output/Corrs_CFAR2021.csv", col.names = F, sep = ",", append = T)
write.table(cfar2021$P, "./../Output/Corrs_CFAR2021.csv", col.names = F, sep = ",", append = T)

inoc %>% filter(Field == "CFAR") -> cfar2022.raw
rcorr(as.matrix(cfar2022.raw[,c(26:28,46,48:51)]), type = "spearman")  -> cfar2022
write.table(cfar2022$r, "./../Output/Corrs_CFAR2022.csv", col.names = T, sep = ",")
write.table(paste("P-Values"), "./../Output/Corrs_CFAR2022.csv", col.names = F, sep = ",", append = T)
write.table(cfar2022$P, "./../Output/Corrs_CFAR2022.csv", col.names = F, sep = ",", append = T)

# CORRELATIONS BETWEEN ENVIRONMENTS
meta %>% filter(Treatment == "Inoc") %>% select(plot, Field, DTA, DTS, ger_avg, DON, ZEA, FER, PCO) %>%
  pivot_longer(cols = c(DTA, DTS, ger_avg, DON, ZEA, FER, PCO), names_to = "pheno", values_to = "value") %>%
  pivot_wider(id_cols = plot, names_from = c(pheno, Field), values_from = value, values_fn = mean) -> meta.corr

rcorr(as.matrix(meta.corr[,c(2:ncol(meta.corr))]), type = "spearman") -> meta.btw.envs
write.table(meta.btw.envs$r, "./../Output/CorrsBTWenvs.csv", col.names = T, sep = ",")
write.table(paste("P-Value"), "./../Output/CorrsBTWenvs.csv", col.names = F, sep = ",", append = T)
write.table(meta.btw.envs$P, "./../Output/CorrsBTWenvs.csv", col.names = F, sep = ",", append = T)

# CORRELATIONS BETWEEN LSMEANS ALL TRAITS
rcorr(as.matrix(lsmeans[,c(14,3,16,6,7,10,11,9,13,12,15,4,5)]), type = "spearman") -> lsmeans.cor
write.table(lsmeans.cor$r, "./../Output/Corrs_LSMEANS.csv", col.names = T, sep = ",")
write.table(paste("P-Values"), "./../Output/Corrs_LSMEANS.csv", col.names = F, sep = ",", append = T)
write.table(lsmeans.cor$P, "./../Output/Corrs_LSMEANS.csv", col.names = F, sep = ",", append = T)