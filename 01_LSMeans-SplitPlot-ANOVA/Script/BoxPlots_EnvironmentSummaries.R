#Generating box plots to visualize trends between environments

# PACKAGES
library(tidyverse)
library(ggpubr)

# LOAD AND FORMAT DATA
meta <- read.csv("./../Data/MEG_MetaFile_ForAnalysis_SL_2024-08-26.csv", header = T)
for (i in c(1:19)) {
  meta[,i] <- as.factor(meta[,i])
}
for (i in c(24:51)) {
  meta[,i] <- as.numeric(meta[,i])
}
str(meta)

 # MAKE BOXPLOTS TO VISUALIZE TRENDS
 ## SEV
meta %>% filter(Treatment == "Inoc") %>%
  ggplot(., aes(x = reorder(Field, ger_avg, na.rm = T), y = ger_avg)) +
  geom_boxplot(color = "black", fill = "lightgrey", lwd = 1.01) + 
  labs(y = "SEV (0-100%)", x = "FILL") +
  scale_x_discrete(labels = c("CFAR2021", "Maxwell2021", "ANSC2022", "CFAR2022")) +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 22, face = "bold", color = "white"),
        axis.title.y = element_text(size = 22, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> sev.violin

## DON
meta %>% filter(Treatment == "Inoc") %>%
  ggplot(., aes(x = reorder(Field, ger_avg, na.rm = T), y = DON)) +
  geom_boxplot(color = "black", fill = "lightgrey", lwd = 1.01) + 
  labs(y = "DON (ppm)", x = "FILL") +
  scale_x_discrete(labels = c("CFAR2021", "Maxwell2021", "ANSC2022", "CFAR2022")) +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 22, face = "bold", color = "white"),
        axis.title.y = element_text(size = 22, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> don.violin

## ZEA
meta %>% filter(Treatment == "Inoc") %>%
  ggplot(., aes(x = reorder(Field, ger_avg, na.rm = T), y = ZEA)) +
  geom_boxplot(color = "black", fill = "lightgrey", lwd = 1.01) + 
  labs(y = "ZEA (ppm)", x = "FILL") +
  scale_x_discrete(labels = c("CFAR2021", "Maxwell2021", "ANSC2022", "CFAR2022")) +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 22, face = "bold", color = "white"),
        axis.title.y = element_text(size = 22, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> zea.violin

## FERA - INOC
meta %>% filter(Treatment == "Inoc") %>%
  ggplot(., aes(x = reorder(Field, ger_avg, na.rm = T), y = FER)) +
  geom_boxplot(color = "black", fill = "lightgrey", lwd = 1.01) +
  labs(y = "FerA (ppm)", x = "FILL") +
  scale_x_discrete(labels = c("CFAR2021", "Maxwell2021", "ANSC2022", "CFAR2022")) +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 22, face = "bold", color = "white"),
        axis.title.y = element_text(size = 22, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> fer.violin
  
## PCOA - INCO
meta %>% filter(Treatment == "Inoc") %>%
  ggplot(., aes(x = reorder(Field, ger_avg, na.rm = T), y = PCO)) +
  geom_boxplot(color = "black", fill = "lightgrey", lwd = 1.01) +
  labs(y = "PCoA (ppm)", x = "FILL") +
  scale_x_discrete(labels = c("CFAR2021", "Maxwell2021", "ANSC2022", "CFAR2022")) +
  theme_classic(base_size = 12, base_family = "sans", base_line_size = 12/22) +
  theme(axis.text.x = element_text(size = 20, face = "bold"),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 22, face = "bold", color = "white"),
        axis.title.y = element_text(size = 22, face = "bold"),
        axis.line = element_line(linewidth = 1.01),
        axis.ticks = element_blank(),
        plot.title = element_text(element_blank())) -> pco.violin

# COMBINE AND EXPORT
tiff("./../Output/Figure2_DiseaseSummaries-Boxplots_600x200mm_20250205.tiff", width = 600, height = 200, units = "mm", res = 350, bg = "white")
ggarrange(sev.violin, don.violin, zea.violin, fer.violin, pco.violin, ncol = 3, nrow = 2,
          labels = c("A", "B", "C", "D", "E"), font.label = list(size = 30, color = "black", family = "sans"),
          hjust = 0.0, vjust = 1.0)
dev.off()