DATA SERIES.ZARAGOZA;
SET SERIES.ZARAGOZA;
DROP FECHA;
RUN;

DATA SERIES.ZARAGOZA;
SET SERIES.ZARAGOZA;
FECHA = intnx( 'month', '01jan1999'd, _n_-1 );
format FECHA DATE.; 
RUN;


ods html;
 ods graphics on;
proc sgplot data=SERIES.ZARAGOZA;
series x=FECHA y=VIAJEROS; 
run;

ods graphics off;
 ods html close;


ods html;
 ods graphics on;

proc timeseries data=SERIES.ZARAGOZA PLOTS=(DECOMP PERIODOGRAM SERIES) PRINT=(SEASONS DECOMP);
   id FECHA interval=month ;
var VIAJEROS;
run;

ods graphics off;
 ods html close;

ods html;
 ods graphics on;

proc timeseries data=SERIES.ZARAGOZA PLOTS=(DECOMP) PRINT=(SEASONS DECOMP);
   id FECHA interval=month ;
var VIAJEROS;
run;

ods graphics off;
 ods html close;




 ods html;
 ods graphics on;

proc esm data=SERIES.ZARAGOZA out=salida lead=12 print=(FORECASTS)
plots=(FORECASTS MODELS SEASONS);
id FECHA interval=month;
forecast VIAJEROS;
run;


ods graphics off;
 ods html close;


 ods html;
 ods graphics on;

proc esm data=SERIES.ZARAGOZA out=salida lead=12 print=(FORECASTS)
plots=(FORECASTS MODELS SEASONS);
id FECHA interval=month;
forecast VIAJEROS / model=MULTwinters;
run;


ods graphics off;
 ods html close;




ods html;
 ods graphics on;


 proc sgplot data=SERIES.ZARAGOZA;
series x=FECHA y=VIAJEROS; 
 where '01jan1999'd < FECHA < '01jan2014'd;
run;

ods graphics off;
 ods html close;


 ods html;
 ods graphics on;

proc esm data=SERIES.ZARAGOZA out=salida lead=12 print=(FORECASTS)
plots=(FORECASTS MODELS SEASONS);

id FECHA interval=month;

forecast VIAJEROS / model=MULTwinters;

 where '01jan1999'd < FECHA < '01jan2014'd;

run;


ods graphics off;
 ods html close;




 ods html;
 ods graphics on;

proc esm data=SERIES.ZARAGOZA out=salida lead=12 print=(FORECASTS)
plots=(FORECASTS MODELS SEASONS);

id FECHA interval=month;

forecast VIAJEROS / model=Lineal;

 where '01jan1999'd < FECHA < '01jan2014'd;

run;


ods graphics off;
 ods html close;


 ods html;
 ods graphics on;

proc esm data=SERIES.ZARAGOZA out=salida lead=12 print=(FORECASTS)
plots=(FORECASTS MODELS SEASONS);

id FECHA interval=month;

forecast VIAJEROS;

 where '01jan1999'd < FECHA < '01jan2014'd;

run;


ods graphics off;
 ods html close;



 ods html;
 ods graphics on;


proc timeseries data=SERIES.ZARAGOZA PLOTS=( SERIES ACF PACF) OUTCORR=AUTOCOR PRINT=ALL;
   id FECHA interval=month ;
var VIAJEROS; 
run;

PROC PRINT DATA=AUTOCOR; 
RUN;


ods graphics off;
 ods html close;



 ods html;
 ods graphics on;


proc arima data=SERIES.ZARAGOZA;
identify var = viajeros;
run;

ods graphics off;
 ods html close;


ods html;
 ods graphics on;


proc arima data=SERIES.ZARAGOZA;
identify var = viajeros(1);
run;

ods graphics off;
 ods html close;


ods html;
 ods graphics on;


proc arima data=SERIES.ZARAGOZA;
identify var = viajeros(1 12);
run;

ods graphics off;
 ods html close;


ods html;
 ods graphics on;


PROC ARIMA data=SERIES.ZARAGOZA; identify var=viajeros(1 12) nlag=10; estimate Q= (12);
run;

ods graphics off;
 ods html close;



ods html;
 ods graphics on;


PROC ARIMA data=SERIES.ZARAGOZA;
identify var=viajeros(1 12) nlag=10;
estimate P= (12);
run;

ods graphics off;
 ods html close;



data SERIES.ZARAGOZA;
set SERIES.ZARAGOZA;
Lviajeros=log(viajeros);
run;

/* ARIMA(0,1, 0)(0,1,1)12 */

ods html;
 ods graphics on;


PROC ARIMA data=SERIES.ZARAGOZA;
identify var=Lviajeros(1 12) nlag=10;
estimate Q= (12);
run;


ods graphics off;
 ods html close;




/*ARIMA(0,1, 0)(1,1, 0)12*/

ods html;
 ods graphics on;


PROC ARIMA data=SERIES.ZARAGOZA;
identify var=Lviajeros(1 12) nlag=10;
estimate P= (12);
run;


ods graphics off;
 ods html close;


ods html;
 ods graphics on;


PROC ARIMA data=SERIES.ZARAGOZA;
identify var=Lviajeros(1 12) nlag=10;
estimate Q= (12) noconstant;
forecast lead=12 id=fecha interval=month out=predicciones Printall;
run;
title "Estimaciones";
title "Estimaciones";


PROC PRINT DATA= predicciones;
where fecha >= '01oct2015'd;
RUN;

ods graphics off;
 ods html close;


ods html;
 ods graphics on;


/*Para quitar las transformaciones*/
data c;
set predicciones;
x = exp(Lviajeros);
forecast= exp(FORECAST);
l95=exp(L95);
u95=exp(U95);
run;
PROC PRINT DATA= c;
where fecha >= '01oct2015'd;
RUN;

ods graphics off;
 ods html close;


