#!/bin/bash

#Formatting output files from TASSEL MLM for PAST Analysis
#Runtime on N417 Desktop: ~1.5 hrs

#Get array of unique phenotypes
phenos=($(awk '{print $1}' TASSEL-MLM_GE-ames_2024112216.txt | sort -u))

#For Association Files#

#Loop through array and process each phenotype
for p in "${phenos[@]}"; do
#create output  file name
  outfile="${p}_MLM-GE_AssocFile.txt"
  outeffect="${p}_MLM-GE_EffectFile.txt"
#create output files 
  touch "$outfile"
  touch "$outeffect"
#echo which pheno i am on
  echo "$p"
#filter each main output file, and append to their own unique file
  grep -F "$p" TASSEL-MLM_GE-ames_2024112216.txt >> "$outfile"
  grep -F "$p" TASSEL-MLM_GE-ames_2024112217.txt >> "$outeffect"
done

#For Effect Files#
#for p in "${phenos[@]}"; do
#  outeffect="${p}_MLM-GE_EffectFile.txt"