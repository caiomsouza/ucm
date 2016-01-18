/* Carga los datos SAS en la libreria disco que estan en la carpeta */
libname trabajo2 'C:\Users\win\Documents\GitHub\ucm\semma\trabajo2';

data uno; set trabajo2.Vino; run;

data uno;
	set trabajo2.Vino;
	if _n_ < 1600  then tipovino='red';
    else tipovino='white';
run;

proc print data=uno;run;

/*  List all the variables in the dataset */
proc contents data=uno out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;

/*  selection=stepwise(select=SBC choose=SBC); */
proc glmselect data=uno; 
class tipovino; 
model quality=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed 
/selection=stepwise(select=SBC choose=SBC); 
run;

/*  Ahora con el metodo atras (backward) normal (SLE=0.05,SLS=0.10): selection=backward(select=SL ); */
proc glmselect data=uno; 
class tipovino; 
model quality=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed 
/selection=backward(select=SL ); 
run;

/*  Ahora con el metodo atras backward exigente: /selection=backward(select=SL ) sle=0.01 sls=0.01;  */
proc glmselect data=uno; 
class tipovino; 
model quality=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed 
/selection=backward(select=SL ) sle=0.01 sls=0.01; 
run;

/*  Ahora con el metodo atras backward muy exigente: /selection=backward(select=SL ) sle=0.001 sls=0.001;  */
proc glmselect data=uno; 
class tipovino; 
model quality=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed 
/selection=backward(select=SL ) sle=0.001 sls=0.001; 
run;

/*  Una pequena comparacion con validacion cruzada  
Hay que ejecutar antes la macro %cruzada en el archivo macro cruzada regresion v 4.0.sas
*/

%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final1;set final;modelo=1;

%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=,ngrupos=4,sinicio=12345,sfinal=12385); data final2;set final;modelo=2;

%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final3;set final;modelo=3;

%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides volatile totalsulfur sulphates sugar, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final4;set final;modelo=4;

data union;set final1 final2 final3 final4; run; 
proc boxplot data=union;plot media*modelo;run;

/*    
Hay que ejecutar antes la macro %AgruparCategorias en el archivo todas macros logistica v 4.0.sas o en el archivo macro agrupar categorias v 3.0.sas
*/
%AgruparCategorias(archivo=uno,vardep=quality,vardeptipo=I,listclass=tipovino, criterio=,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);

/*    
Hay que ejecutar antes la macro %interacttodo en el archivo interacttodo v 5.0.sas
*/
%interacttodo(archivo=uno,vardep=quality,
listclass=tipovino,listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);


 /* output the la macro %interacttodo
tipovino*alcohol alcohol density tipovino*density tipovino*volatile volatile tipovino*chlorides
chlorides tipovino*totalsulfur tipovino*sulphates tipovino*pH tipovino tipovino*freesulfur
tipovino*sugar tipovino*fixed tipovino*citric citric fixed freesulfur totalsulfur sulphates sugar
pH
*/


/* selection=stepwise(select=AIC choose=AIC); */
proc glmselect data=uno; 
class tipovino; 
model quality=tipovino*alcohol alcohol density tipovino*density tipovino*volatile volatile tipovino*chlorides
chlorides tipovino*totalsulfur tipovino*sulphates tipovino*pH tipovino tipovino*freesulfur
tipovino*sugar tipovino*fixed tipovino*citric citric fixed freesulfur totalsulfur sulphates sugar
pH 
/selection=stepwise(select=AIC choose=AIC); 
run;


/* selection=stepwise(select=SBC choose=SBC); */
proc glmselect data=uno; 
class tipovino; 
model quality=tipovino*alcohol alcohol density tipovino*density tipovino*volatile volatile tipovino*chlorides
chlorides tipovino*totalsulfur tipovino*sulphates tipovino*pH tipovino tipovino*freesulfur
tipovino*sugar tipovino*fixed tipovino*citric citric fixed freesulfur totalsulfur sulphates sugar
pH 
/selection=stepwise(select=SBC choose=SBC); 
run;


%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final1;set final;modelo=1;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=,ngrupos=4,sinicio=12345,sfinal=12385); data final2;set final;modelo=2;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final3;set final;modelo=3;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides volatile totalsulfur sulphates sugar, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final4;set final;modelo=4;
%cruzada(archivo=uno, vardepen=quality, listconti=alcohol*tipovino density*tipovino volatile*tipovino chlorides*tipovino totalsulfur*tipovino sulphates*tipovino pH*tipovino tipovino freesulfur*tipovino sugar*tipovino fixed*tipovino pH, listclass=tipovino,ngrupos=4, sinicio=12345,sfinal=12385); data final5;set final;modelo=5;
%cruzada(archivo=uno, vardepen=quality, listconti=alcohol*tipovino density volatile*tipovino freesulfur*tipovino fixed*tipovino sulphates sugar pH , listclass=tipovino,ngrupos=4, sinicio=12345,sfinal=12385); data final6;set final;modelo=6;
title 'Modelos con y sin interacciones'; data union;set final1 final2 final3 final4 final5 final6;run; proc boxplot data=union;plot media*modelo;run;

proc glm data=uno; class tipovino; model quality=alcohol*tipovino density*tipovino volatile*tipovino chlorides*tipovino totalsulfur*tipovino sulphates*tipovino pH*tipovino tipovino freesulfur*tipovino sugar*tipovino fixed*tipovino pH /solution; run;


/*    
Hay que ejecutar antes la macro %nombresmodbien en el archivo nombresmod v 8.0.sas
*/


data uno;set uno;if quality=. then delete;run; options mprint;
%nombresmodbien(archivo=uno,depen=quality,
modelo=alcohol*tipovino density volatile*tipovino freesulfur*tipovino fixed*tipovino sulphates sugar pH
,listclass=tipovino,
listconti=freesulfur alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed,
corte=15,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);

/* output ha funcionado
alcovinored alcovinowhi density fixenored fixenowhi freeipovinored freeipovinowhi pH sugar sulphates
volaovinored volaovinowhi
*/

ods output SelectedEffects=efectos;/* Para crear un archivo con el nombre de los efectos seleccionados */ 
proc glmselect data=pretest; 
model quality=alcovinored alcovinowhi density fixenored fixenowhi freeipovinored freeipovinowhi pH sugar sulphates
volaovinored volaovinowhi
/selection=stepwise(select=AIC choose=AIC);/* aqui se cambia la medida */ run;
data;set efectos; put effects @@;run;/* Para obtener en LOG la lista de los efectos seleccionados */

/* output ha funcionado
 alcovinored alcovinowhi density fixenored fixenowhi freeipovinored freeipovinowhi pH sugar sulphates volaovinored volaovinowhi
*/



data uno;set uno;if quality=. then delete;run; options mprint;
%nombresmodbien(archivo=uno,depen=quality,
modelo=alcohol*tipovino density*tipovino volatile*tipovino chlorides*tipovino totalsulfur*tipovino sulphates*tipovino pH*tipovino tipovino freesulfur*tipovino sugar*tipovino fixed*tipovino pH
,listclass=tipovino,
listconti=freesulfur alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed,
corte=15,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);

/* output ha funcionado

alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi
freeipovinored freeipovinowhi pH pHtipovinored pHtipovinowhi suganored suganowhi sulppovinored
sulppovinowhi tipovinored tipovinowhi totatipovinored totatipovinowhi volaovinored volaovinowh


*/


ods output SelectedEffects=efectos;/* Para crear un archivo con el nombre de los efectos seleccionados */ 
proc glmselect data=pretest; 
model quality=alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi
freeipovinored freeipovinowhi pH pHtipovinored pHtipovinowhi suganored suganowhi sulppovinored
sulppovinowhi tipovinored tipovinowhi totatipovinored totatipovinowhi volaovinored volaovinowhi
/selection=stepwise(select=SBC choose=SBC);/* aqui se cambia la medida */ run;
data;set efectos; put effects @@;run;/* Para obtener en LOG la lista de los efectos seleccionados */

/* output ha funcionado

alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi

*/


%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final1;set final;modelo=1;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=,ngrupos=4,sinicio=12345,sfinal=12385); data final2;set final;modelo=2;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final3;set final;modelo=3;
%cruzada(archivo=uno, vardepen=quality, listconti=freesulfur alcohol chlorides volatile totalsulfur sulphates sugar, listclass=tipovino,ngrupos=4,sinicio=12345,sfinal=12385); data final4;set final;modelo=4;
%cruzada(archivo=uno, vardepen=quality, listconti=alcohol*tipovino density*tipovino volatile*tipovino chlorides*tipovino totalsulfur*tipovino sulphates*tipovino pH*tipovino tipovino freesulfur*tipovino sugar*tipovino fixed*tipovino pH, listclass=tipovino,ngrupos=4, sinicio=12345,sfinal=12385); data final5;set final;modelo=5;
%cruzada(archivo=uno, vardepen=quality, listconti=alcohol*tipovino density volatile*tipovino freesulfur*tipovino fixed*tipovino sulphates sugar pH , listclass=tipovino,ngrupos=4, sinicio=12345,sfinal=12385); data final6;set final;modelo=6;

%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi density fixenored fixenowhi freeipovinored freeipovinowhi pH sugar sulphates volaovinored volaovinowhi , listclass=,ngrupos=4, sinicio=12345,sfinal=12385); data final7;set final;modelo=7;
%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi, listclass=,ngrupos=4,sinicio=12345,sfinal=12385); data final8;set final;modelo=8;


title 'Modelos con nombresmod-dummys'; data union;set final1 final2 final3 final4 final5 final6 final7 final8;run; proc boxplot data=union;plot media*modelo;run;




/*    
Hay que ejecutar antes la macro %randomselect en el archivo macro randomselect v 4.0.sas
*/


/*    
randonselect con las variables del modelo 7
*/

%randomselect(data=pretest, listclass=, vardepen=quality, modelo=alcovinored alcovinowhi density fixenored fixenowhi freeipovinored freeipovinowhi pH sugar sulphates volaovinored volaovinowhi,criterio=SBC,sinicio=12345,sfinal=12700,fracciontrain=0.90,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);


/* modelos para probar - modelo=9
Intercept alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi
*/

/*    
randonselect con las variables del modelo 8
*/

%randomselect(data=pretest, listclass=, vardepen=quality, modelo=alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi,criterio=SBC,sinicio=12345,sfinal=12700,fracciontrain=0.90,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);

/*  modelos para probar - modelo=10,11 e 12
Intercept alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi
Intercept alcovinored alcovinowhi fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi
Intercept alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi volaovinored volaovinowhi

*/


%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi, listclass=,ngrupos=4,sinicio=12345,sfinal=12346); data final9;set final;modelo=9;

%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi, listclass=,ngrupos=4,sinicio=12345,sfinal=12346); data final10;set final;modelo=10;
%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi totatipovinored volaovinored volaovinowhi, listclass=,ngrupos=4,sinicio=12345,sfinal=12346); data final11;set final;modelo=11;
%cruzada(archivo=pretest, vardepen=quality, listconti=alcovinored alcovinowhi chlopovinored fixenowhi freeipovinowhi suganowhi sulppovinored sulppovinowhi volaovinored volaovinowhi, listclass=,ngrupos=4,sinicio=12345,sfinal=12346); data final12;set final;modelo=12;

title 'Modelos con randomselect tambien'; data union;set final1 final2 final3 final4 final5 final6 final7 final8 final9 final10 final11 final12;run; 
proc boxplot data=union;plot media*modelo;run;



/*    
Esta parte no he entendio mucho como hacer y por que

data uno; set trabajo2.Vino; run;


*/


data pretest2;set pretest;logquality=log(quality); logpH=log(pH); 

/*  List all the variables in the dataset */
proc contents data=pretest2 out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;

/*
alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi freeipovinored freeipovinowhi logpH logquality pH pHtipovinored pHtipovinowhi quality suganored suganowhi sulppovinored sulppovinowhi tipovinored tipovinowhi
totatipovinored totatipovinowhi volaovinored volaovinowhi
*/

proc print data=pretest2;run;


proc gplot data=pretest2; 
plot quality*pH logquality*pH logquality*logpH; run;


/*
Hago la transformacion del dataset pretest para logaritimo.
*/


data pretest2 (drop=i); 
array x{26} alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi freeipovinored freeipovinowhi logpH logquality pH pHtipovinored pHtipovinowhi quality suganored suganowhi sulppovinored sulppovinowhi tipovinored tipovinowhi
totatipovinored totatipovinowhi volaovinored volaovinowhi; 
array z{26}; set pretest;logquality=log(quality); 
do i=1 to 26;z{i}=log(x{i}+1);end; 
run; 

/*
Hago la transformacion del dataset original (uno) para logaritimo.
*/

data vinolog (drop=i); 
array x{11} freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed; 
array z{11}; set uno;logquality=log(quality); 
do i=1 to 11;z{i}=log(x{i}+1);end; 
run;


proc glmselect data=pretest2; 
model logquality=z1-z26 alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi freeipovinored freeipovinowhi logpH logquality pH pHtipovinored pHtipovinowhi quality suganored suganowhi sulppovinored sulppovinowhi tipovinored tipovinowhi
totatipovinored totatipovinowhi volaovinored volaovinowhi /selection=stepwise(select=sbc choose=sbc); 
run;

proc glmselect data=vinolog; 
model logquality=z1-z11 freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed  /selection=stepwise(select=sbc choose=sbc); 
run;


%cruzadabis(archivo=pretest2, vardepen=logquality, listconti=z1-z26 alcovinored alcovinowhi chlopovinored chlopovinowhi densvinored densvinowhi fixenored fixenowhi freeipovinored freeipovinowhi logpH logquality pH pHtipovinored pHtipovinowhi quality suganored suganowhi sulppovinored sulppovinowhi tipovinored tipovinowhi
totatipovinored totatipovinowhi volaovinored volaovinowhi , listclass=, ngrupos=4,sinicio=12345,sfinal=12385); data final13;set final;modelo=13;

%cruzadabis(archivo=vinolog, vardepen=logquality, listconti=z1-z11 freesulfur citric alcohol chlorides density volatile totalsulfur sulphates pH sugar fixed , listclass=, ngrupos=4,sinicio=12345,sfinal=12385); data final13;set final;modelo=14;


title 'Modelos con randomselect tambien'; data union;set final1 final2 final3 final4 final5 final6 final7 final8 final9 final10 final11 final12 final13 final14;run; proc boxplot data=union;plot media*modelo;run;


title 'Modelos con randomselect tambien'; data union;set final1 final2 final3 final4 final14;run; proc boxplot data=union;plot media*modelo;run;
