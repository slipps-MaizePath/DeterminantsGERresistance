#!/bin/bash

#05a_FormatGBS4GAPIT
#2024-05-24
#Sarah Lipps

#The GBS dataset has a massive header, and the "#" in the actual header isnt readable by GAPIT
#This file removes the big header and the extra "#" so the file is GAPIT readable

touch ./../Data/ames_filt-Taxa-Markers-MAF1_NoHeader.hmp.txt

cat ./../Data/ames_filt-Taxa-Markers-MAF1.hmp.txt | tail -n +335 > ./../Data/ames_filt-Taxa-Markers-MAF1_NoHeader.hmp.txt
