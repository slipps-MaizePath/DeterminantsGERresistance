# HISTOGRAMS OF TRAITS

library(tidyverse)
library(ggpubr)

# LOAD AND FORMAT DATA
pheno <- read.csv("./../Data/LSMeans_AllPhenos_BarcodesAdded_20241121.csv", header = T)
colnames(pheno)

for (i in c(2:16)) {
  pheno[,i] <- as.numeric(pheno[,i])
}

# INTEXT - SEV, DON, ZEA
ggplot(pheno, aes(x = SEV)) +
  geom_histogram(binwidth = 8, color = "black", fill = "lightgrey", lwd = 1.01) +
  labs(x="SEV", y = "Frequency") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> sev

ggplot(pheno, aes(x = DON)) +
  geom_histogram(binwidth = 0.75, color = "black", fill = "lightgrey", lwd = 1.01) +
  labs(x = "DON", y = "") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> don

ggplot(pheno, aes(x = ZEA)) +
  geom_histogram(binwidth = 0.5, color = "black", fill = "lightgrey", lwd = 1.01) +
  labs(x = "ZEA", y = "") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> zea

tiff("./../Output/Figure2_LSMeans-SEV-DON-ZEA_325x100mm_20241213.tiff", width = 325, height = 100, units = "mm", res = 350, bg = "white")
ggarrange(sev, don, zea, ncol = 3, nrow = 1,
          labels = c("A", "B", "C"), font.label = list(size = 30, color = "black", family = "sans"),
          hjust = 0.0, vjust = 1.0)
dev.off()

# SUPPLEMENTARY HISTOGRAM
ggplot(pheno, aes(x = PCoAinoc)) +
  #geom_histogram(binwidth = 2, color = "black", fill = "#41b6c4", lwd = 1.01) +
  geom_histogram(binwidth = 2, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "PCoA Inoculated", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> pco.inoc

pco.inoc

ggplot(pheno, aes(x = FerAinoc)) +
#  geom_histogram(binwidth = 500, color = "black", fill = "#41b6c4", lwd = 1.01) +
  geom_histogram(binwidth = 500, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "FerA Inoculated", y = "FILL \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", colour = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> fer.inoc

fer.inoc

ggplot(pheno, aes(x = PCoAUN)) +
#  geom_histogram(binwidth = 25, color = "black", fill = "#41b6c4", lwd = 1.01) +
  geom_histogram(binwidth = 25, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "PCoA Untreated", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", color = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> pco.un

pco.un

ggplot(pheno, aes(x = FerAUN)) +
#  geom_histogram(binwidth = 500, color = "black", fill = "#41b6c4", lwd = 1.01) +
  geom_histogram(binwidth = 500, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "FerA Untreated", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> fer.un

fer.un

ggplot(pheno, aes(x = FIBER)) +
  #geom_histogram(binwidth = 0.1, color = "black", fill = "#fed976", lwd = 1.01) +
  geom_histogram(binwidth = 0.25, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "Fiber", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", color = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> fiber
fiber

ggplot(pheno, aes(x = OIL)) +
  #geom_histogram(binwidth = 0.2, color = "black", fill = "#feb24c", lwd = 1.01) +
  geom_histogram(binwidth = 0.2, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "OIL", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", color = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> oil
oil

ggplot(pheno, aes(x = PROTEIN)) +
#  geom_histogram(binwidth = 1, color = "black", fill = "#feb24c", lwd = 1.01) +
  geom_histogram(binwidth = 1, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "PROTEIN", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> protein
protein

ggplot(pheno, aes(x = STARCH)) +
 # geom_histogram(binwidth = 1, color = "black", fill = "#feb24c", lwd = 1.01) +
  geom_histogram(binwidth = 1, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "STARCH", y = "Frequency \n") +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", color = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> starch
starch

ggplot(pheno, aes(x = PCpct)) +
 # geom_histogram(binwidth = 1, color = "black", fill = "#feb24c", lwd = 1.01) +
  geom_histogram(binwidth = 1, color = "black", fill = "darkgrey", lwd = 1.01) +
  labs(x = "PCpct", y = "Frequency \n") + 
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 24, face = "bold"),
        axis.title.y = element_text(size = 24, face = "bold", color = "white"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> peri
peri

tiff("./../Output/SupplementaryFigure_LSMeans-AllPhenos_500x350mm_20250121.tiff", width = 500, height = 350, units = "mm", res = 350, bg = "white")
ggarrange(pco.inoc, fer.inoc, pco.un, fer.un, fiber, oil, protein, starch, peri,
          ncol = 3, nrow = 3,
          labels = c("A", "B", "C", "D", "E", "F", "G", "H", "I"), 
          font.label = list(size = 20, color = "black", family = "sans"),
          hjust = 0.0, vjust = 1.0)
dev.off()