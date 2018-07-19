libname practice "/folders/myfolders/";

Data practice.automobile;
input Make$ Price KPL Foreign;
Datalines;
Toyota 1500 12 0
Toyota 1600 13 1
Toyota 1700 13.5 1
BMW 2200 20 1
BMW 2350 21 1
BMW 2400 21 0
Maruti 1200 14 0
Maruti 1200 15 1
;
run;

proc print data=practice.automobile;
run;

proc freq data=practice.automobile;
tables price;
run;

proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		entrytitle "Pie Chart" / textattrs=(size=14);
		layout region;
		piechart category=Make / stat=pct;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=5.4in height=3.8in imagemap;

proc sgrender template=SASStudio.Pie data=PRACTICE.AUTOMOBILE;
run;

ods graphics / reset;


ods graphics / reset width=5.4in height=3.8in imagemap;

proc sgplot data=PRACTICE.AUTOMOBILE;
	title height=14pt "Bar Chart";
	vbar Make / response=Price fillattrs=(color=CX0cce1c transparency=0.25) 
		fillType=gradient stat=mean dataskin=gloss;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=4.4in height=2.8in imagemap;

proc sgplot data=PRACTICE.AUTOMOBILE;
	title height=14pt "Scatter Plot";
	scatter x=Price y=Make / markerattrs=(symbol=circle color=CX420538);
	xaxis valuesrotate=diagonal;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=4.4in height=2.8in imagemap;

proc sort data=PRACTICE.AUTOMOBILE out=_HistogramTaskData;
	by Make;
run;

proc sgplot data=_HistogramTaskData;
	by Make;
	title height=15pt "Histogram";
	histogram Price /;
	yaxis grid;
run;

ods graphics / reset;
title;

proc datasets library=WORK noprint;
	delete _HistogramTaskData;
	run;