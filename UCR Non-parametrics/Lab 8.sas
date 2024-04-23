options ls =78 nocenter nodate nonumber ps=55;
data lab8w17;
infile 'C:\Users\Sarah\Downloads\PLANTW17.DAT' firstobs =2;
title1 'Stats 140 Lab8';
title2 'Sarah Ruckman';
do row = 1 to 10;
do plant = 1 to 3;
if     plant = 1 then name = 'PlantA';
else if plant =2 then name = 'PlantB';
else                  name = 'PlantC';
input dischrg @@;
output;
end;
end;
proc print noobs;
proc sort;
by plant;
proc npar1way median;
class plant;
var dischrg;
run;
quit;