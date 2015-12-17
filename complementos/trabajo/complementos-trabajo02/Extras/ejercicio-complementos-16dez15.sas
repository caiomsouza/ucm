libname ucm 'C:\Users\win\Desktop\trabajo\complementos-trabajo02\';

data nacidos;
set ucm.nacidos;
run;

proc print data=ucm.nacidos (obs=100);


proc contents data=ucm.nacidos out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CATEGÓRICAS';if type=2 then put name @@;run;


proc corresp data=nacidos all chi2p print=both;
var E0A9 E10A19 E20A29 E30A39 E40A49 E50A59 E60A69 E70A79 E80ANDMO;
id CATEGORI;
run;

proc corresp data=nacidos all chi2p print=both dim=2;
var E0A9 E10A19 E20A29 E30A39 E40A49 E50A59 E60A69 E70A79 E80ANDMO;
id CATEGORI;
run;


proc corresp data=nacidos all chi2p print=both dim=2;
var E0A9 E10A19 E20A29 E30A39 E40A49 E50A59 E60A69 E70A79 E80ANDMO;
id CATEGORI;
supplementary E0A9;
run; 




proc template;
      define statgraph Stat.Corresp.Graphics.Configuration;
         dynamic xVar yVar head legend;
         begingraph;
            entrytitle HEAD;
            layout overlayequated / equatetype=fit xaxisopts=(offsetmin=0.1
               offsetmax=0.1) yaxisopts=(offsetmin=0.1 offsetmax=0.1);
   
               referenceline x=0;
               referenceline y=0;
   
               scatterplot y=YVAR x=XVAR / group=GROUP index=INDEX
                  datalabel=LABEL datalabelattrs=GRAPHVALUETEXT
                  name="Type" tip=(y x datalabel group)
                  tiplabel=(group="Point");
               if (LEGEND)
                  discretelegend "Type";
               endif;
            endlayout;
         endgraph;
      end;
   run;
