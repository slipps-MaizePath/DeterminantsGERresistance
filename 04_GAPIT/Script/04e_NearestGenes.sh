#!/bin/bash

#Using BedTools to find the nearest upstream and downstream genes
#to each of my significant markers for ALL phenotypes

#convert my gff file to a bed file
gff2bed < ./../Data/Zm-B73-Ref-Gramene-4.0_GENES.gff > ./../Data/Zm-B73-Ref-Gramene-4.0_GENES.bed

#ID the closes genes
bedtools closest -a ./../Output/FarmCPU_SigSNP_sorted.bed \
	 -b ./../Data/Zm-B73-Ref-Gramene-4.0_GENES.bed \
	 -D ref -t all > ./../Output/nearestgenes_20241204.txt
	 
echo "bedtools is done! you now have your nearest genes! :)"
