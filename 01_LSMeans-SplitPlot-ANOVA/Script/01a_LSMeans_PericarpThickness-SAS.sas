/*01b_LSMeans_PericarpThickness-SAS*/

/*Add column for total kernel dry weight*/
data work.pericarp;
	set work.pericarp;
	DryWeight = (GW + PW);
run;

/* Add column for percent pericarp weight*/
data work.pericarp;
	set work.pericarp;
	PericarpPCT = ((PW/DryWeight) * 100);
run;

/* Add column for percent germ weight*/
data work.pericarp;
	set work.pericarp;
	GermPCT = ((GW/DryWeight) * 100);
run;

/* LS Means for Percent of Kernel Weight attributed to Pericarp */
data work.pericarp;
	set work.pericarp;
	PWpct_trans = PericarpPCT**1.2
run;


ods output lsmeans=bluesPericarpPCT;
proc mixed data=work.pericarp method=type3 covtest;
	class rep Genotype;
	model PericarpPCT = Genotype / outpred=resids;
	random rep;
	lsmeans Genotype;
run;
ods output close;

/*Look at the residuals */
proc univariate data=resids normal plot;
	var resid;
run;

/* Export to SAS on Demand WorkSpace */
proc export data=work.bluesPericarpPCT
	outfile="/home/u63868756/sasuser.v94/Output/lsmeans_PericarpPCT.csv"
	dbms=csv
	replace;
run;

