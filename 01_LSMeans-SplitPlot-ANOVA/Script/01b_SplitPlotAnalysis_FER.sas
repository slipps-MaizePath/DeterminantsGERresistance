/* Appropriately doing the split-plot analysis for 21GE using SAS */
/* I designed this model based on conversations with Martin Bohn and Altman and Krzywinski 2015 "Split plot design" */

/* Do ferulic acid first */

/* Load and format the dataset */
data meta21;
	set work.meta;
	if Year= "2021";
run;

data meta21_clean;
	set meta21;
	FER_num = input(FER, best12.); /* convert to numeric */
run;

/* Run model for FER_num */
proc mixed data=meta21_clean method=type3;
class Field Treatment plot;
model FER_num = Treatment plot Treatment*plot;
random Field Field*Treatment;
lsmeans Treatment /adjust=tukey;
run;

proc mixed data=meta21_clean method=type3;
class Field Treatment plot;
model FER_num = Treatment plot Treatment*plot;
random Field Field*Treatment;
lsmeans plot /adjust=tukey;
run;

proc mixed data=meta21_clean method=type3;
class Field Treatment plot;
model FER_num = Treatment plot Treatment*plot;
random Field Field*Treatment;
lsmeans Treatment*plot /adjust=tukey;
run;