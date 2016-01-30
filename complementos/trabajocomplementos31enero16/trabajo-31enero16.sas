/*
El archivo \DatosPaises.xlsx" (que podeis descargar del campus) contie-
ne informacion sobre 7 variables socioeconomicas de 133 paises. Seleccionar
aleatoriamente una muestra de 100 paises con el procedimiento
surveyselect
de la siguiente forma:

*/

libname ucm 'C:\Users\win\Documents\GitHub\ucm\complementos\trabajocomplementos31enero16\';

data paises;
set ucm.paises;
run;

proc print data=paises (obs=100);
run;


proc contents data=paises out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CATEGÓRICAS';if type=2 then put name @@;run;


proc surveyselect data=paises method=srs n=100 out=sample_paises;
run;

/*

Para la muestra obtenida, realizar un Analisis Cluster incluyendo SOLO
las variables demograficas (Pobl Natalidad EsperanzaVida Mortalidad
), que debe incluir como minimo:

*/

proc print data=sample_paises (obs=100);
var POBL NATALIDA ESPERANZ MORTALID;
run;

proc stdize data=sample_paises out=sample_paisesnorm;
var POBL NATALIDA ESPERANZ MORTALID;
run;

proc print data=sample_paisesnorm;
var POBL NATALIDA ESPERANZ MORTALID;
run;

proc print data=sample_paisesnorm;
run;


proc cluster data=sample_paisesnorm method=average pseudo RSQUARE ccc outtree=sample_paisesnormA
print=10 plots=den(VERTICAL);
var POBL NATALIDA ESPERANZ MORTALID;
run;

proc cluster data=sample_paisesnorm method=centroid pseudo ccc RSQUARE
outtree=sample_paisesnormC
print=10 plots=den(VERTICAL);
var POBL NATALIDA ESPERANZ MORTALID;
run;

proc cluster data=sample_paisesnorm method=ward pseudo ccc RSQUARE
outtree=sample_paisesnormW
print=10 plots=den(VERTICAL);
var POBL NATALIDA ESPERANZ MORTALID;
run;


