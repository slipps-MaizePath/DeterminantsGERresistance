#PAST Analysis
#Sarah Lipps
#2024-12-02

PAST analysis using the bioconductor package (PAST v1.22.0, doi:10.18129/B9.bioc.PAST)

I have a function that runs the various loading stages of PAST and identifies the significant increasing and decreasing pathways, filters only for those with a pvalue < 0.05.

Input files for each trait: Association File, an Effect File, and an LD File
LD generated using script and data in folder "./LD"
Assoc and Effect files generated using script and data in "./Format4PAST"
Gene Model GFF and Pathway files downloaded for B73 RefGen_v4

These are the parameters I set (they are the default, since this was developed using maize)
*assign_SNPs_to_genes
filter_type = "gene"
window = 1000
r square cutoff = 0.8

*find_pathway_significance
gene number cutoff = 5
sample_size = 1000
mode = "increasing" and "decreasing"

Final outputs are in "./PASTOutputs/PAST_{TRAIT}_20241202.csv"


