# GWAS-FARMCPU-USING GAPIT

# LOAD DATA
## PHENOTYPES
pheno <- read.csv("./../Data/LSMeans_AllPhenos_BarcodesAdded_20241121.csv", header = T)
myY <- pheno[,c(20,2:16)]
colnames(myY)[1] <- "Taxa"

## GENOTYPES
myG <- read.table("./../Data/ames_filt-Taxa-Markers-MAF1_NoHeader.hmp.txt", sep = "\t", header = F)
## EVERYTHING MATCHES?
unlist(myG[1,c(12:ncol(myG))]) -> Gcols
myY <- subset(myY, Taxa %in% Gcols)

str(myY)
myYDIS <- myY[,c(1,14,3,16)]
myYKQual <- myY[,c(1,2,8,9,12,13,15)]
myYHCA <- myY[,c(1,4,5,6,7,10,11)] #also includes DTA/DTS

# LOAD GAPIT
source("https://zzlab.net/GAPIT/previous/gapit_20230410.txt")
source("https://zzlab.net/GAPIT/previous/gapit_functions_20230421.txt")

# RUN GAPIT
setwd("./../Output/FarmCPU-Disease_20241122//")

### SEV, DON, ZEA
myMLM = GAPIT(
  Y=myYDIS,
  G=myG,
  Model.selection = TRUE,
  model = "FarmCPU"
)

setwd("./../Output/FarmCPU-HCA-Flower_20241122//")

### FERA, PCOA, DTA, DTS
myMLM = GAPIT(
  Y=myYHCA,
  G=myG,
  Model.selection = TRUE,
  model = "FarmCPU"
)

setwd("./../Output/FarmCPU-KQual_20241122//")

### PROTEIN, STARCH, OIL, PERICARP
myMLM = GAPIT(
  Y=myYKQual,
  G=myG,
  Model.selection = TRUE,
  model = "FarmCPU"
)
