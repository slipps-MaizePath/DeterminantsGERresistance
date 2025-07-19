#!/bin/bash

#GLM for all phenos in TASSEL for Sarah's AMES for Chambana diversity panel

./run_pipeline.bat -Xmx10g -fork1 -h ./ames_filt-Taxa-Markers-MAF1.hmp.txt \
-fork2 -importGuess ./LSMeans_AllPhenos_BarcodesOnly_TASSEL_20241121.txt \
-fork3 -k Kinship-CenterIBS_ames_filt-Taxa-Markers-MAF1_20241121.txt \
-combine4 -input1 -input2 -intersect -combine5 -input3 -input4 \
-mlm -mlmCompressionLevel Optimum -export TASSEL-MLM_GE-ames_20241122