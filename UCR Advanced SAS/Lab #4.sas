options ls = 78 nocenter nodate ps=55 nonumber;
data copy1;
infile 'C:\Users\sarah\Downloads\compny1.dat' firstobs=2;
input sales earnings avg_rtn pe_ratio mrktval;
proc print noobs;
var sales earnings avg_rtn pr_ratio mrktval;
proc contents;
proc corr nosimple noprob;
proc reg;
model mrktval = sales earnings avg_rtn pe_ratio / P R;
data cmpy22;
infile 'C:\Users\sarah\Downloads\compny2.dat' firstobs = 2;
input sales earnings avg_rtn pe_ratio mrktval;
proc reg;
model mrktval = sales earnings avg_rtn pe_ratio / P R;
output out = comp2 P=pred2 R=resid2 Student =stdres2;
data outliers2;
set comp2;
if stdres2 < -2 or stdres2 > 2;
proc print;
proc gplot data=comp2;
plot stdres2*pred2;
title 'Residual Plot';
proc univariate data = comp2 normal;
ods select TestsForNormality;
var stdres2;
data new_models;
set cmpy22;
proc reg;
model mrktval = sales earnings avg_rtn pe_ratio / selection = rsquare adjrsq mse cp best =1;
model mrktval = sales earnings avg_rtn pe_ratio / selection = stepwise sle = 0.05 sls = 0.05;
run;
quit;
