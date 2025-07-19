READ ME
04b_GBS_FilterFormat
Sarah Lipps
2024-05-23

The Genotypic file ZeaGBSv27_publicSamples_imputedV5_AGPv4-181023.h5 contains nearly a million SNPS
The genotypeSummary plugin on tassel provides information on Taxa and Sites

The sites will be filtered to include only those with <20% missing data
Some Taxa were genotyped more than once
If there is a duplicate, the most complete genotypic representation of that Taxa will be kept.

Steps:
-1 get genotype summary for taxa and sites - get list of sites with <20% Missing
	I manually filtered the output for the site filter -> ames_gbs_siteNames2Include
-2 First filter: filter by Taxa List (Taxa_List.txt, n = 318)
	Input: ZeaGBSv27_publicSamples_imputedV5_AGPv4-181023.h5 and Taxa_List.txt
	Output: ames_taxa_filter1.hmp.txt (900k markers, 318 taxa)
	Runtime: ~30 min
-3 Second filter: filter to include only markers with <20% missing (ames_siteFilter_AllChrPositions_Markers2Keep.txt, ~600,000 markers)
	Input: ames_taxa_filter1.hmp.txt and ames_gbs_siteNames2Include.txt
	Output: ames_site_filter2.hmp.txt (633k markers, 318 taxa)
	Runtime: <1 min
-4 Third filter: filter for MAF of 0.05
	Input: ames_site_filter2.hmp.txt
	Output: ames_filt_Taxa-Markers-MAF1.hmp.txt (202,453 markers, 318 taxa)
	Runtime: <1 min

The final dataset is ames_filt_Taxa-Markers-MAF1.hmp.txt contains 202,453 markers for 318 taxa will be used for mapping.