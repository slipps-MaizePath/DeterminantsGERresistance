#!/bin/bash

#uploading and filtering the GBS data for mapping
#1 Split by chromosome
#2 GT summary - remove anything with > 20% missing

./run_pipeline.bat -Xmx10g \
-fork1 -h5 ./ZeaGBSv27_publicSamples_imputedV5_AGPv4-181023.h5 \
-fork2 -genotypeSummary taxa -input1 -export ames_genotypeSummary_Taxa
#-fork2 -genotypeSummary all -input1 -export ames_genotypeSummary_All