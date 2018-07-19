Data automobile;
input Make$ Price KPL Foreign;
Datalines;
Toyota 1500 12 0
Toyota 1600 13 1
Toyota 1700 13.5 1
BMW 2200 20 1
BMW 2350 21 1
BMW 2400 21 0
Maruti 1200 14 0
Maruti 1300 15 1
;
run;

proc print data=automobile;
run;

proc freq data=automobile;
tables price;
run;