options nocenter nodate ps=55 ls=78 formdlim='#';
ods graphics off;
/*Create temporary SAS dataset*/
data quest1;
/*Use infile statement first line starts on 3 and ends on line 4*/
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 3 obs = 4;
input weights @@;
proc print;
proc univariate;
ods select GoodnessOfFit;
var weights;
histogram weights/normal(mu=80 sigma=10);
data quest2;
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 6 obs = 7;
input time @@;
proc print;
var time;
proc univariate;
ods select GoodnessOfFit;
var time;
histogram/exponential(sigma=est);
data quest3;
input gift $ obs1;
datalines;
Sweat 280
Coffe 180
Earrings 40
;
proc print;
proc freq order = data;
tables gift/chisq testp = (50 40 10);
weight obs1;
data quest4;
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 9 obs = 11;
input number @@;
proc freq;
tables number;
data quest5;
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 13 obs =16;
do level = 1 to 4;
	 if level = 1 then number = 'None         ';
else if level = 2 then number = 'One          ';
else if level = 3 then number = 'Two          ';
else                   number = 'More than two';
do income = 1 to 4;
	 if income = 1 then amt = '<15         ';
else if income = 2 then amt = '15-24,999   ';
else if income = 3 then amt = '25-34,999   ';
else                    amt = 'At least 35 ';
input wt @@;
output;
end;
end;
proc print;
proc freq order = data;
weight wt;
tables number*amt/chisq expected nopercent norow nocol;
data quest6;
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 18 obs = 19;
do accident = 1 to 2;
	 if accident = 1 then type = 'Fatal/Crit   ';
else                      type = 'No Fatal/Crit';
do auto = 1 to 2;
	 if auto = 1 then size = 'Compact    ';
else                  size = 'Non-compact';
input wt @@;
output;
end;
end;
proc freq order = data;
weight wt;
tables type*size/chisq expected nopercent norow nocol;
data quest7;
infile 'C:\Users\sarah\Downloads\data_lab1w18.dat' firstobs = 21 obs = 22;
do accident = 1 to 2;
	 if accident = 1 then type = 'Fatal/Crit   ';
else                      type = 'No Fatal/Crit';
do auto = 1 to 3;
	 if auto = 1 then size = 'Sub-Compact    ';
else if auto = 2 then size = 'Compact        ';
else                  size = 'Full           ';
input wt @@;
output;
end;
end;
proc freq order = data;
weight wt;
tables type*size/chisq expected nopercent norow nocol;
run;
quit;