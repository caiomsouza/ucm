*------------------------------------------------------------* ;
* Plot: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Median_House_value(DESC) households(ASC) housing_median_age(ASC) latitude(ASC)
   longitude(ASC) median_income(ASC) population(ASC) total_bedrooms(ASC)
   total_rooms(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Ids2_DATA
dmdbcat=WORK.Plot_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
target
Median_House_value
;
run;
quit;
*------------------------------------------------------------*;
* Plot: Creating variable by target scatter plots;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG hpos=100 vpos=50;
*;
axis1 minor=none offset=(5,5) width=2;
axis2 minor=none offset=(10,10) width=2;
*;
proc gplot
data=EMWS1.Ids2_DATA gout=WORK.PlotGRAPH;
*;
title "households por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * households /
vaxis=axis1
haxis=axis1
name = "households     x Median_House_va" description="households por Median_House_value (dispersión)"
noframe;
run;
title "housing_median_age por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * housing_median_age /
vaxis=axis1
haxis=axis1
name = "housing_median_x Median_House_va" description="housing_median_age por Median_House_value (dispersión)"
noframe;
run;
title "latitude por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * latitude /
vaxis=axis1
haxis=axis1
name = "latitude       x Median_House_va" description="latitude por Median_House_value (dispersión)"
noframe;
run;
title "longitude por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * longitude /
vaxis=axis1
haxis=axis1
name = "longitude      x Median_House_va" description="longitude por Median_House_value (dispersión)"
noframe;
run;
title "median_income por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * median_income /
vaxis=axis1
haxis=axis1
name = "median_income  x Median_House_va" description="median_income por Median_House_value (dispersión)"
noframe;
run;
title "population por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * population /
vaxis=axis1
haxis=axis1
name = "population     x Median_House_va" description="population por Median_House_value (dispersión)"
noframe;
run;
title "total_bedrooms por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * total_bedrooms /
vaxis=axis1
haxis=axis1
name = "total_bedrooms x Median_House_va" description="total_bedrooms por Median_House_value (dispersión)"
noframe;
run;
title "total_rooms por Median_House_value (dispersión)";
symbol value=dot cv=blue
interpol=rlclm90 ci=red co=green;
plot Median_House_value * total_rooms /
vaxis=axis1
haxis=axis1
name = "total_rooms    x Median_House_va" description="total_rooms por Median_House_value (dispersión)"
noframe;
run;
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot: copiando gráficos en la carpeta nodo;
*------------------------------------------------------------*;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\households por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay HOUSEHOL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\housing_median_age por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay HOUSING_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\latitude por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay LATITUDE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\longitude por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay LONGITUD;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\median_income por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MEDIAN_I;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\population por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay POPULATI;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\total_bedrooms por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay TOTAL_BE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Plot\GRAPH\total_rooms por Median_House_value (dispersión).gif";
goptions device= ZGIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay TOTAL_RO;
quit;
goptions device=win;
filename gsasfile;
