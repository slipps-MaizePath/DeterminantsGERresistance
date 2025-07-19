#README TASSEL
#SARAH LIPPS
#2024-12-02

I ran an MLM in TASSEL for all phenotypes we collected on the diversity panel.
Input files for TASSEL are the same as the input files for GAPIT. EXCEPT, I included a kinship file. The kinship file I generated using the Centered IBS method from TASSEL.

MLM ran using TASSEL_GE-AllPhenos.sh
GBS file has already been formatted and filtered see (03_Filtering-Formatting-Mapping/GBS_FilterFormat/)

1. import GBS, pheno, and kinship files
2. combine GBS and pheno files
3. combine output from 2 with kinship files
4 run -mlm plugin with optimal compression.

Run time: ~12 hours

Output files:
TASSEL-MLM_GE-ames_202411221 through TASSEL-MLM_GE-ames_2024112215: Phenotype files for ASH,DON,DTA,DTS,FerAinoc,FerAUN,FIBER,OIL,PCoAinoc,PCoAUN,PROTEIN,PCpct,SEV,STARCH,ZEA
TASSEL-MLM_GE-ames_2024112216: Association files for ALL phenotypes
TASSEL-MLM_GE-ames_2024112217: Effect files for ALL phenotypes
TASSEL-MLM_GE-ames_2024112218: MLM specific stats, include -2 Log Likelihood, genetic variance, and residual variance componenets under different levels of compression.

For more info on MLM in TASSEL see: https://tassel.bitbucket.io/docs/Tassel_User_Guide_3.0.pdf

