/*
Autor: Caio Fernandes Moreno
Universidad Complutense de Madrid
Fecha: 30/01/2016

*/


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


proc corr data=sample_paises outp=sample_paisescorr;
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


/*
Cluster No Jerarquico 
*/

PROC FASTCLUS DATA=sample_paisesnorm MAXCLUSTERS=4 MEAN=MEDIAS2
DRIFT OUT=cluster4 maxiter=30;
var POBL NATALIDA ESPERANZ MORTALID;
run;

PROC FASTCLUS DATA=sample_paisesnorm MAXCLUSTERS=5 MEAN=MEDIAS2
DRIFT OUT=cluster5 maxiter=30;
var POBL NATALIDA ESPERANZ MORTALID;
run;

PROC FASTCLUS DATA=sample_paisesnorm MAXCLUSTERS=7 MEAN=MEDIAS2
DRIFT OUT=cluster7 maxiter=30;
var POBL NATALIDA ESPERANZ MORTALID;
run;


proc means data=cluster4 ; var distance; output out=sumacuad4 uss=w4 ;
run;
proc means data=cluster5 ; var distance; output out=sumacuad5 uss=w5 ;
run;
proc means data=cluster7 ; var distance; output out=sumacuad7 uss=w7 ;
run;

data beale;
    merge sumacuad4 sumacuad5 sumacuad7;
k1=(_freq_-4)*(4**(-2/8));
k2=(_freq_-5)*(5**(-2/8));
k3=(_freq_-7)*(7**(-2/8));
fbeale1=(w4-w5)*k2/(w5*(k1-k2));
pvalor=1-probf(fbeale1,(k1-k2),k2);
fbeale2=(w4-w7)*k3/(w7*(k1-k3));
pvalor2=1-probf(fbeale2,(k1-k3),k3);
fbeale3=(w5-w7)*k3/(w7*(k2-k3));
pvalor3=1-probf(fbeale3,(k2-k3),k3);
run;

proc print data=beale;run;



proc sort data=cluster4 out=cluster4s;
 by cluster;

proc Freq data=cluster4s;
  by cluster; tables PAIS;
run;


proc sort data=cluster5 out=cluster5s;
 by cluster;

proc Freq data=cluster5s;
  by cluster; tables PAIS;
run;


proc sort data=cluster7 out=cluster7s;
 by cluster;

proc Freq data=cluster7s;
  by cluster; tables PAIS;
run;


proc sort data=cluster4 out=cluster4s;
 by cluster;

proc print data=cluster4s;
run;


proc Freq data=cluster4 ;
tables cluster;run;
proc sort;by cluster;
proc print;
by cluster;
run;


proc means data=cluster4 noprint;
by cluster;
var POBL NATALIDA ESPERANZ MORTALID;
output out=centinic mean=POBL NATALIDA ESPERANZ MORTALID;
run;
proc print data=centinic;run;


PROC STANDARD DATA=cluster4 MEAN=0 STD=1 OUT=cluster4out;
var POBL NATALIDA ESPERANZ MORTALID;
RUN;
PROC PRINT DATA=cluster4out (OBS=7);
RUN;



/*

Analises Discriminante 

*/


proc univariate data=cluster4 normal plot;
VAR POBL NATALIDA ESPERANZ MORTALID CLUSTER;
run;


/*
Quitando datos atipicos - Tentativa 1
*/

data cluster4id;
set cluster4;
id=_N_;
run;

proc print data=cluster4id;run;

proc print data=cluster4id;
run;


data cluster4sinatipicos;
set cluster4id;
if cluster = 3 then delete;
run;

proc print data=cluster4sinatipicos;
run;


proc univariate data=cluster4sinatipicos normal plot;
VAR POBL NATALIDA ESPERANZ MORTALID CLUSTER;
id id;
run;


proc discrim data=cluster4id method=normal pool=test wcov pcov list crossvalidate crosslist outstat=salida;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;

/*
Quitando datos atipicos - Tentativa 2

*/

data cluster4id;
set cluster4;
id=_N_;
run;

proc discrim data=cluster4id method=normal pool=test wcov pcov list crossvalidate crosslist outstat=salida;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;


data cluster4sinatipicos2;
set cluster4id;
if _N_ in (7,12,47,13) then delete;
run;

proc print data=cluster4sinatipicos2;
run;


proc discrim data=cluster4sinatipicos2 method=normal pool=test wcov pcov list crossvalidate crosslist outstat=salida;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;



data cluster_pequeno;
set cluster4id;
DROP POBL NATALIDA ESPERANZ MORTALID;
run;

proc print data=cluster_pequeno;
run;


data sample_paises_con_clusters;
    merge sample_paises cluster_pequeno;
run;


proc print data=sample_paises_con_clusters;
run;

proc print data=sample_paises;
run;


data sample_paises_con_clusterstransf;
set sample_paises_con_clusters;
z=0;
run;

proc transreg data=sample_paises_con_clusterstransf maxiter=0 nozeroconstant detail 
plots=(transformation(dependent)scatter);
model boxcox(POBL)=identity(z);
output out=tdatos;
run;

proc print data=tdatos;
run;


proc discrim data=tdatos method=normal pool=test wcov pcov list crossvalidate crosslist outstat=salida;
class _NAME_;
run;

proc discrim data=tdatos pool=test testlisterr crossvalidate;
class _NAME_;
run;


data logcluster;
set sample_paises_con_clusters;
logESPERANZ = log(ESPERANZ);
logNATALIDA = log(NATALIDA);
logPOBL = log(POBL);
logMORTALID = log(MORTALID);
run;

proc print data=logcluster;
run;

proc univariate data=sample_paises_con_clusters normal plot;
VAR POBL NATALIDA ESPERANZ MORTALID;
run; 


proc univariate data=logcluster normal plot;
var logESPERANZ logNATALIDA logMORTALID logPOBL; 
run; 



proc discrim data=logcluster pool=test testlisterr crossvalidate;
var logESPERANZ logNATALIDA logMORTALID logPOBL; 
class CLUSTER;
run;



proc discrim data=cluster4 pool=test testlisterr crossvalidate;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;






proc univariate data=cluster4 normal;
run;

proc contents data=cluster4 out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CATEGÓRICAS';if type=2 then put name @@;run;


proc univariate data=cluster4 normal;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;


proc discrim data=cluster4 method=normal pool=test wcov pcov list crossvalidate crosslist outstat=salida;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;


proc discrim data=cluster4 crossvalidate pool=test outstat=salidacluster4;
class CLUSTER;
VAR POBL NATALIDA ESPERANZ MORTALID;
run;

proc print data=salidacluster4;
run;



/*

Parte que no he entendido bien se se debe utilizar

*/



data datos;
set datos;
z=0;
run;

proc transreg data=datos maxiter=0 nozeroconstant detail
plots=(transformation(dependet) scatter);
model boxcox(y) = identiy(z);
output out=tdados;
run;


data datos;
set corazon;
z=0;
run;

proc transreg data=datos maxiter=0 nozeroconstant detail plots=(transformation(dependet) scatter);
model boxcox(triglice) = identity(z);
output out=tdatos;
run;






PROC STEPDISC DATA=cluster4 METHOD=STEPWISE SLE=0.10 SLS=0.20;
var POBL NATALIDA ESPERANZ MORTALID;
clASS cluster;
RUN;


PROC DISCRIM DATA=cluster4 OUTSTAT=ESTADISTICOS POOL=TEST method=normal DISTANCE CROSSVALIDAte crosslisterr;
CLASS x14; 
VAR x9 x3 x6 x10 x7; 
RUN;
PROC PRINT DATA=ESTADISTICOS;RUN;
