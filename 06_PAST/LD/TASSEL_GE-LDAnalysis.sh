#!/bin/bash

#LD Analysis is needed to do PAST Analysis
#TASSEL does LD quite nicely

./run_pipeline.bat -Xmx10g -fork1 -h ./ames_filt-Taxa-Markers-MAF1.hmp.txt -ld -ldPermNum 1000 -ldWinSize 50 -ldHetTreatment Haplotype -export ./GE_ames_LD_20221202_