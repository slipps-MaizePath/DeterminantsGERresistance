# GWAS RESULTS TABLE
library(tidyverse)

# LOAD DATA
## SIG SNPS
snps <- read.csv("./../Data/FARMCPU_sigSNPS-ALLPHENOS_20241203.csv", header = T)
snps.2 <- select(snps, c("SNP", "P.value", "H.B.P.Value", "Effect", "trait"))
snps.2$Name <- str_c(snps.2$SNP, snps.2$trait, sep = ":")
snps.2 %>% filter(trait == "SEV" | trait == "ZEA" | trait == "PCoAinoc" | trait == "PCoAUN" | trait == "FerAinoc" | trait == "FerAUN" | trait == "PCpct") -> snps.2

## NEAREST GENES
genes <- read.table("./../Data/nearestgenes_20241204.txt", sep = "\t", header = F)
colnames(genes) <- c("Chr", "StartPos", "EndPos", "Name", "Chr.B", "GeneStart", "GeneEnd", "Gene", "V9", "V10", "source", "type", "V13", "Annotation", "DistancefromSNP")
head(genes)

genes.2 <- select(genes, c("Name", "Chr", "StartPos", "Gene", "Annotation", "DistancefromSNP"))
head(genes.2)

## COMBINE THE TWO
snpsgenes <- merge(snps.2, genes.2, by.x = "Name", by.y = "Name", all.x = T)

# FINAL FORMATTING AND EXPORT
snpsgenes[c("ID", "biotype", "description", "gene_id", "logic_name")] <- str_split_fixed(snpsgenes$Annotation, ";", 5)
snpsgenes$ID <- str_sub(snpsgenes$ID, start = 9)
snpsgenes$biotype <- str_sub(snpsgenes$biotype, start = 9)
snpsgenes$description <- str_sub(snpsgenes$description, start = 13)
snpsgenes$gene_id <- str_sub(snpsgenes$gene_id, start = 9)
snpsgenes$gene_id <- str_sub(snpsgenes$logic_name, start = 12)


snpsgenes.final <- select(snpsgenes, c("trait", "SNP", "Chr", "StartPos", "Effect", "H.B.P.Value",
                                       "ID", "DistancefromSNP", "description"))
write.csv(snpsgenes.final, "./../Output/Table_SignificantMarkers.csv", row.names = F)