/* Filter data for only inoculated dataset */

data meta_inoc;
	set work.meta;
	if Treatment = "Inoc";
run;

/* Build the model for severity */

ods output lsmeans=bluesSEV;
proc mixed data=work.meta_inoc method=type3 covtest;
	class Field  Number_of_Ears plot;
	model ger_avg = plot / outpred=resids;
	random Field Field*plot;
	weight Number_of_Ears;
	lsmeans plot;
run;
ods output close;

/* Print and look at the estimates */
proc print data=bluesSEV (obs=10);
run;

/* Look at the residuals */
proc univariate data=resids normal plot;
var resid;
run;

/* Export it to SAS On Demand */
proc export data=work.bluessev
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_SEV.csv"
	dbms=csv
	replace;
run;

/*Make PCoA a numeric column and transform it */
data work.meta_inoc;
	set work.meta_inoc;
	PCO_num = input(PCO, best12.);
run;

/* Build Model for p-coumaric acid */
ods output lsmeans=bluesPCOinoc;
proc mixed data=work.meta_inoc method=type3 covtest;
	class Field BlockContiguous plot;
	model PCO_num = plot / outpred=resids;
	random Field Field*plot;
	lsmeans plot;
run;
ods output close;

/* Print and look at estimates */
proc print data=bluesPCOinoc (obs=10);
run;

/* Look at the residuals */
proc univariate data=resids normal plot;
var resid;
run;

/* Export it to SAS On Demand */
proc export data=work.bluesPCOinoc
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_PCOinoc.csv"
	dbms=csv
	replace;
run;

/*Make FER Numeric*/
data work.meta_inoc;
	set work.meta_inoc;
	FER_num = input(FER, best12.);
run;


/* Build Model for Ferulic Acid */
ods output lsmeans=bluesFERinoc;
proc mixed data=work.meta_inoc method=type3 covtest;
	class Field BlockContiguous plot;
	model FER_num = plot / outpred=resids;
	random Field Field*plot;
	lsmeans plot;
run;
ods output close;

/* Pring and look at estimates */
proc print data=bluesFERinoc (obs=10);
run;

/* Look at the residuals */
proc univariate data=resids normal plot;
var resid;
run;

/* Export it to SAS On Demand */
proc export data=work.bluesFERinoc
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_FERinoc.csv"
	dbms=csv
	replace;
run;

/* Build Model for DON*/
/* Create Variable with log transformed values */
data work.meta_inoc_trans;
	set work.meta_inoc;
	DON_trans = log(DON + 1/6);
run;

/* Build Model for DON */
ods output lsmeans=bluesDONinoc;
proc mixed data=work.meta_inoc_trans method=type3 covtest;
	class  Field plot;
	model DON_trans = plot / outpred=resids;
	random Field;
	lsmeans plot;
run;
ods output close;

/* Look at the residuals */
proc univariate data=resids normal plot;
var resid;
run;

/* Export it to SAS On Demand */
proc export data=work.bluesDONinoc
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_DONinoc.csv"
	dbms=csv
	replace;
run;

/* Create variable with log transformed zea values */
data work.meta_inoc_trans;
	set work.meta_inoc;
	ZEA_trans = log(ZEA + 1/6);
run;

/* Build Model for ZEA */
ods output lsmeans=bluesZEAinoc;
proc mixed data=work.meta_inoc_trans method=type3 covtest;
	class Year Field BlockContiguous plot;
	model ZEA_trans = plot / outpred=resids;
	random Field;
	lsmeans plot;
run;
ods output close;

/* Look at the residuals */
proc univariate data=resids normal plot;
var resid;
run;

/* Export it to SAS On Demand */
proc export data=work.bluesZEAinoc
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_ZEAinoc.csv"
	dbms=csv
	replace;
run;

