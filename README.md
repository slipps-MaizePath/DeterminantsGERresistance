# DeterminantsGERresistance
This is the code for the accepted manuscript Lipps et al. 2025. "Uncovering Genetic and Metabolic Determinants of Gibberella Ear Rot Resistance in Diverse Maize Germplasm." Accepted in the Plant Genome 10.22541/au.174838140.02592987/v1

# Abstract
Fusarium graminearum colonizes the maize ear causing Gibberella ear rot (GER) and producing harmful mycotoxins, such as deoxynivalenol (DON) and zearalenone (ZEA), that pose a risk to human and animal health when consumed. The disease can be managed in part by breeding and planting resistant maize cultivars. Resistance to GER is a quantitative and complex trait. Evaluation of diverse germplasm to identify regions and candidate genes associated with resistance may be useful for crop improvement efforts. Screening for GER is time-consuming and costly. Thus, identifying other traits that may serve as a proxy for GER resistance may accelerate resistance breeding efforts. We hypothesized that grain phenylpropanoid content and kernel composition are genetically and mechanistically related to GER resistance. We screened a diverse set of maize inbred lines for disease severity, DON, ZEA, ferulic acid, p-coumaric acid, and several kernel composition traits. Using a genome-wide association study, we identified multiple markers associated with each phenotype and genomic regions that harbor alleles for both disease and metabolite-related phenotypes. We also identified multiple metabolic pathways associated with general biotic defense and potential detoxification. End-season ferulic acid and p-coumaric acid concentrations are not strong proxies for GER resistance, but secondary metabolites are important components of the maize-F. graminearum system. In summary, we identified candidate genes and mechanisms for GER resistance, uncovered a link between phenylpropanoid content and GER, and showed that lignin mutants are more susceptible to infection by F. graminearum

# Repository outline

## 01 LSMeans SplitPlot ANOVAs
Generation of LS Means, analysis of split-plot design, and generation of ANOVA outputs
Code primarily in SAS

## 02 Correlations
Are any traits good proxies for DON or ZEA?
Code in R

## 03 Filtering Formatting Mapping
Filtering and formatting marker dataset (TASSEL, CLI) to conduct GWAS using GAPIT (R)

## 04 GAPIT
GWAS for traits (n = 13) in GAPIT (R)

## 05 TASSEL
Running GWAS MLM in TASSEL to use in PAST (CLI)

 ## 06 PAST 
 Pathway association study tool (R)

 ## 07 BMR Mutants

 Staatistical analysis, outlier test, dunnett's test redduced lignin maize lines (R)

 ## 08 Tables and figures
 Code used to generate all tables and figures

# Notes
Each folder contains Script, Data, Output. Sequencing data is publicly available from panzea.org

Repository created and managed by Sarah Lipps (slipps@illinois.edu)
