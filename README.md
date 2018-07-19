# Automobile.sas
Few data analysis operations performed on data which is created for automobile using SAS University Edition.

SAS programs contain two statement:
1) Data statement
2) Procedural statement

First created a data of automobile using 4 attributes and 8 observations for 3 category of cars.
Three catrgories of cars are BMW, Toyota and Maruti.
Four attributes are:
Make: Maker of car,
Price: Price of particular car,
KPL: kilometers per liter
Foreign: Where it is sold.

Procedure statements:
1) To print the table of dataset.

proc print data=practice.automobile;
run;

2) To find the frequency or occurance and percentage for each price observation.

proc freq data=practice.automobile;
tables price;
run;

3) Pie Chart to show percentage of each category of maker.
  Pie charts show the relative contribution of the parts to the whole by displaying data as wedge-shaped slices of a circle. Each slice represents a category of data. The size of a slice represents the contribution of the data to the total chart statistic.
  
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

4) Bar Chart to show prices for every maker.
  Bar charts compare numeric values or statistics between different values of a chart variable. Bar charts show the relative magnitude of data by displaying bars of varying height. Each bar represents a category of data.
  
ods graphics / reset width=5.4in height=3.8in imagemap;

proc sgplot data=PRACTICE.AUTOMOBILE;
	title height=14pt "Bar Chart";
	vbar Make / response=Price fillattrs=(color=CX0cce1c transparency=0.25) 
		fillType=gradient stat=mean dataskin=gloss;
	yaxis grid;
run;

ods graphics / reset;
title;

5) Scatter Plot: Scatter plots show the relationships between two or three variables by revealing patterns or concentrations of data points.

ods graphics / reset width=4.4in height=2.8in imagemap;

proc sgplot data=PRACTICE.AUTOMOBILE;
	title height=14pt "Scatter Plot";
	scatter x=Price y=Make / markerattrs=(symbol=circle color=CX420538);
	xaxis valuesrotate=diagonal;
	yaxis grid;
run;

ods graphics / reset;
title;

6) Histogram: Creates a frequency distribution of a numeric variable.

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
  
Result file is attached with repository as "Program automobile-results.pdf" and "Program automobile-results.html".
