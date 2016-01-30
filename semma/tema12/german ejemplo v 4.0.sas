data german;set 'C:\Users\win\Documents\GitHub\ucm\semma\tema12\germanbien.sas7bdat';
run;

proc freq data=german;run;
proc contents data=german out=sal;run;quit;
data;set sal;put name @@;run;
options mprint=0;
/* Continuas

age amount checking coapp duration employed existcr installp resident savings 

Cualitativas

foreign marital telephon depends history purpose other housing job property 

Dependiente
bad 
*/

/**************************************************************************************
/* MODELOS SIN INTERACCIONES 

PARA APUNTAR LOS MODELOS, DESGRACIADAMENTE HAY QUE PONER CABECERA 
ODS OUTPUT type3=parametros y el data mode POSTERIOR*/
/**************************************************************************************/

ods output type3=parametros;
proc logistic data=german namelen=20 descending ;
class foreign marital telephon depends history purpose other housing job property ;
model bad=age amount checking coapp duration employed existcr installp resident savings 
foreign marital telephon depends history purpose other housing job property 
/selection=stepwise;
run;quit;
data mode;length length effect $20. modelo $ 20000;retain modelo " ";set parametros end=fin;effect=cat(' ',effect);
if _n_ ne 1 then modelo=catt(modelo,' ',effect);if fin then output;
run;
data ;set mode;put modelo;run;

/* amount checking duration installp savings foreign marital history purpose other  */

/* CON LA OPCIÓN selection=score SE UTILIZA ods output bestsubsets=modelos y se escogen los mejores modelos de k=1,2,...efectos .
El problema es que esta opción no permite meter variables de clase con más de 2 categorías
*/

ods output bestsubsets=modelos;
proc logistic data=german descending;
class foreign marital telephon depends history purpose other housing job property ;
model bad=age amount checking coapp duration employed existcr installp resident savings 
/selection=score best=1 start=3 stop=7;
run;
data ;set modelos;put variablesinmodel;run;

/*

checking duration savings
checking duration employed savings
checking coapp duration employed savings
checking coapp duration employed installp savings
amount checking coapp duration employed installp savings


*/

/**************************************************************************************
/* INTERACTTODO LOGISTICA*/
/**************************************************************************************/

%interacttodolog(archivo=german,vardep=bad,
listclass=foreign marital telephon depends history purpose other housing job property ,
listconti=age amount checking coapp duration employed existcr installp resident savings,directorio=c:);

data;set union;put variable @@;run;
ods output type3=parametros;
proc logistic data=german descending;
class foreign marital telephon depends history purpose other housing job property ;
model bad=
checking history*checking history*purpose purpose*checking other*checking history*other history*age purpose*duration history*employed marital*history history history*savings job*checking history*resident history*existcr marital*purpose purpose*other
housing*checking purpose*property foreign*checking history*installp duration purpose*housing foreign*duration purpose*amount history*coapp purpose*employed purpose*job foreign*purpose purpose*savings foreign*history marital*checking purpose*installp
purpose*coapp savings purpose purpose*age other*housing history*job other*savings history*housing job*property housing*employed purpose*existcr property*employed job*duration purpose*resident property*age history*duration housing*savings history*amount
property*amount housing*property property*resident property*coapp other*property other*employed housing*age housing*job property housing*existcr amount property*existcr other*age housing*resident marital*other marital*savings housing*coapp
property*installp depends*purpose depends*checking foreign*amount property*checking property*duration marital*property housing marital*housing property*savings job*amount job*savings other*existcr other*job housing*installp depends*history depends*amount
foreign*property history*property marital*amount foreign*installp employed marital*duration foreign*savings other telephon*purpose other*coapp other*resident depends*duration job*employed marital*employed other*amount foreign*housing marital*existcr
depends*housing marital age marital*resident marital*installp other*duration foreign marital*job marital*age marital*depends depends*savings marital*coapp telephon*installp telephon*job other*installp telephon*history installp foreign*telephon
telephon*property housing*duration foreign*marital job*age job*existcr telephon*amount foreign*other telephon*duration foreign*resident telephon*resident depends*job job*coapp foreign*coapp existcr depends*property telephon*housing depends*employed job
marital*telephon job*resident depends*other job*installp telephon housing*amount depends*age telephon*other telephon*employed telephon*age telephon*savings foreign*job foreign*employed coapp telephon*coapp foreign*existcr telephon*existcr telephon*depends
depends*coapp depends*resident foreign*depends foreign*age depends resident depends*existcr depends*installp telephon*checking
/selection=stepwise;
run;

data mode;length modelo $ 20000;retain modelo " ";set parametros end=fin;effect=cat(' ',effect);
if _n_ ne 1 then modelo=catt(modelo,' ',effect);if fin then output;
run;
data ;set mode;put modelo;run;

/* history duration savings purpose duration*history amount marital foreign installp */

/**************************************************************************************
/* NOMBRESMOD LOGISTICA MISMO PROGRAMA*/
/**************************************************************************************/
options nonotes;
%nombresmodbien(archivo=german,depen=bad,modelo=
checking history*checking history*purpose purpose*checking other*checking history*other history*age purpose*duration history*employed marital*history history history*savings job*checking history*resident history*existcr marital*purpose purpose*other
housing*checking purpose*property foreign*checking history*installp duration purpose*housing foreign*duration purpose*amount history*coapp purpose*employed purpose*job foreign*purpose purpose*savings foreign*history marital*checking purpose*installp
purpose*coapp savings purpose purpose*age other*housing history*job other*savings history*housing job*property housing*employed purpose*existcr property*employed job*duration purpose*resident property*age history*duration housing*savings history*amount
property*amount housing*property property*resident property*coapp other*property other*employed housing*age housing*job property housing*existcr amount property*existcr other*age housing*resident marital*other marital*savings housing*coapp
property*installp depends*purpose depends*checking foreign*amount property*checking property*duration marital*property housing marital*housing property*savings job*amount job*savings other*existcr other*job housing*installp depends*history depends*amount
foreign*property history*property marital*amount foreign*installp employed marital*duration foreign*savings other telephon*purpose other*coapp other*resident depends*duration job*employed marital*employed other*amount foreign*housing marital*existcr
depends*housing marital age marital*resident marital*installp other*duration foreign marital*job marital*age marital*depends depends*savings marital*coapp telephon*installp telephon*job other*installp telephon*history installp foreign*telephon
telephon*property housing*duration foreign*marital job*age job*existcr telephon*amount foreign*other telephon*duration foreign*resident telephon*resident depends*job job*coapp foreign*coapp existcr depends*property telephon*housing depends*employed job
marital*telephon job*resident depends*other job*installp telephon housing*amount depends*age telephon*other telephon*employed telephon*age telephon*savings foreign*job foreign*employed coapp telephon*coapp foreign*existcr telephon*existcr telephon*depends
depends*coapp depends*resident foreign*depends foreign*age depends resident depends*existcr depends*installp telephon*checking /noint
,listclass=foreign marital telephon depends history purpose other housing job property ,
listconti=age amount checking coapp duration employed existcr installp resident savings,corte=35);

/**************************************************************************************
LOGISTICA stepwise SOBRE PRETEST COMPLETO :

EN LUGAR DEL ARCHIVO TYPE3 SE USA PARAMETERESTIMATES

TYPE3: 					CUANDO HAY CUALITATIVAS
PARAMETERESTIMATES:		SOLO CONTINUAS

/**************************************************************************************/

ods output parameterestimates=parametros;
proc logistic data=pretest descending;
model bad=
age agehistory0 agehistory1 agehistory2 agehistory3 agehistory4 agehousing1 agehousing2 agehousing3 agemarital1 agemarital2 agemarital3 agemarital4 ageother1 ageother2 ageother3 ageproperty1 ageproperty2 ageproperty3
ageproperty4 agepurpose0 agepurpose1 agepurpose2 agepurpose3 agepurpose6 agepurpose9 amount amountdepends1 amountdepends2 amountforeign1 amountforeign2 amounthistory0 amounthistory1 amounthistory2 amounthistory3
amounthistory4 amountjob2 amountjob3 amountjob4 amountmarital1 amountmarital2 amountmarital3 amountmarital4 amountother1 amountother2 amountother3 amountpurpose0 amountpurpose1 amountpurpose2 amountpurpose3
amountpurpose6 amountpurpose9 amourty1 amourty2 amourty3 amourty4 checeign1 checeign2 checends1 checends2 checital1 checital2 checital3 checital4 checkingjob2 checkingjob3 checkingjob4 checkingother1 checkingother2
checkingother3 checperty1 checperty2 checperty3 checperty4 checpose0 checpose1 checpose2 checpose3 checpose6 checpose9 checsing1 checsing2 checsing3 chectory0 chectory1 chectory2 chectory3 chectory4 coapphistory0
coapphistory1 coapphistory2 coapphistory3 coapphistory4 coapphousing1 coapphousing2 coapphousing3 coappmarital1 coappmarital2 coappmarital3 coappmarital4 coappother1 coappother2 coappother3 coappproperty1 coappproperty2
coappproperty3 coappproperty4 coapppurpose0 coapppurpose1 coapppurpose2 coapppurpose3 coapppurpose6 coapppurpose9 depeing11 depeing12 depeing13 depeing22 depeory11 depeory12 depeory13 depeory14 depeory22 depeory24
depeose10 depeose11 depeose12 depeose13 depeose16 depeose19 depeose20 duraeign1 duraeign2 duraends1 duraends2 duraital1 duraital2 duraital3 duraital4 duraperty1 duraperty2 duraperty3 duraperty4 durapose0 durapose1
durapose2 durapose3 durapose6 durapose9 duration durationjob2 durationjob3 durationjob4 durationother1 durationother2 durationother3 duratory0 duratory1 duratory2 duratory3 duratory4 emplital1 emplital2 emplital3
emplital4 employed employedjob2 employedjob3 employedjob4 employedother1 employedother2 employedother3 emplperty1 emplperty2 emplperty3 emplperty4 emplpose0 emplpose1 emplpose2 emplpose3 emplpose6 emplpose9 emplsing1
emplsing2 emplsing3 empltory0 empltory1 empltory2 empltory3 empltory4 exiserty1 exiserty2 exiserty3 exiserty4 exising1 exising2 exising3 exisory0 exisory1 exisory2 exisory3 exisory4 exisose0 exisose1 exisose2 exisose3
exisose6 exisose9 existal1 existal2 existal3 existal4 existcrother1 existcrother2 existcrother3 foreerty11 foreerty12 foreerty13 foreerty14 foreign1 foreign2 foreing11 foreing12 foreing13 foreory10 foreory11 foreory12
foreory13 foreory14 foreose10 foreose11 foreose12 foreose13 foreose16 foreose19 histerty21 histerty22 histerty23 histerty24 histerty41 histerty42 histerty43 histerty44 histing21 histing22 histing23 histing32 histing41
histing42 history0 history1 history2 history3 history4 historyjob22 historyjob23 historyjob24 historyjob33 historyjob42 historyjob43 historyjob44 historyother21 historyother23 historyother33 historyother43 histose20
histose21 histose22 histose23 histose40 histose41 histose42 histose43 houserty11 houserty12 houserty13 houserty21 houserty22 houserty23 houserty34 housing1 housing2 housing3 housingjob12 housingjob13 housingjob22
housingjob23 housingjob24 housingjob33 insteign1 insteign2 instephon1 instephon2 instital1 instital2 instital3 instital4 instperty1 instperty2 instperty3 instperty4 instpose0 instpose1 instpose2 instpose3 instpose6
instpose9 instsing1 instsing2 instsing3 insttory0 insttory1 insttory2 insttory3 insttory4 jobproperty21 jobproperty22 jobproperty23 jobproperty31 jobproperty32 jobproperty33 jobproperty34 jobproperty43 jobproperty44
marierty21 marierty22 marierty23 marierty31 marierty32 marierty33 marierty34 marierty41 mariing12 mariing21 mariing22 mariing31 mariing32 mariing33 mariing42 marinds11 marinds21 marinds31 marinds32 marinds41 mariory22
mariory24 mariory32 mariory33 mariory34 mariory42 mariose20 mariose22 mariose23 mariose30 mariose31 mariose32 mariose33 mariose39 mariose43 marital1 marital2 marital3 marital4 maritaljob22 maritaljob23 maritaljob24
maritaljob32 maritaljob33 maritaljob34 maritaljob43 maritalother13 maritalother21 maritalother23 maritalother31 maritalother33 maritalother43 other1 other2 other3 otherhousing12 otherhousing22 otherhousing31
otherhousing32 otherhousing33 otherjob13 otherjob32 otherjob33 otherjob34 othety13 othety31 othety32 othety33 othety34 property1 property2 property3 property4 purperty01 purperty02 purperty03 purperty04 purperty13
purperty21 purperty22 purperty23 purperty31 purperty32 purperty33 purping01 purping02 purping12 purping21 purping22 purping31 purping32 purping92 purpose0 purpose1 purpose2 purpose3 purpose6 purpose9 purposejob02
purposejob03 purposejob13 purposejob23 purposejob32 purposejob33 purposejob93 purposeother03 purposeother13 purposeother23 purposeother33 purposeother63 purposeother93 residentother1 residentother2 residentother3
resiital1 resiital2 resiital3 resiital4 resiperty1 resiperty2 resiperty3 resiperty4 resipose0 resipose1 resipose2 resipose3 resipose6 resipose9 resising1 resising2 resising3 resitory0 resitory1 resitory2 resitory3
resitory4 savierty1 savierty2 savierty3 savierty4 saviign1 saviign2 saviing1 saviing2 saviing3 savinds1 savinds2 savings savingsjob2 savingsjob3 savingsjob4 savingsother1 savingsother2 savingsother3 saviory0 saviory1
saviory2 saviory3 saviory4 saviose0 saviose1 saviose2 saviose3 saviose6 saviose9 savital1 savital2 savital3 savital4 telephonjob12 telephonjob13 telephonjob23 telephonjob24 telepose10 telepose11 telepose12 telepose13
telepose19 telepose20 telepose21 telepose22 telepose23 telepose29
/selection=stepwise;
run;

data mode;length modelo effect $ 30000;retain modelo " ";set parametros end=fin;effect=variable;effect=cat(' ',effect);
if _n_ ne 1 then modelo=catt(modelo,' ',effect);if fin then output;
run;
data ;set mode;put modelo;run;
proc print data=parametros;run;
/*
agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty
02 resitory0 savings telepose19 telepose23
*/

/**************************************************************************************
CHEQUEO DE LOS PUNTOS DE CORTE
/**************************************************************************************/

%corteoptimo(archivo=german,
vardepen=bad,
conti=amount checking duration installp savings foreign marital history purpose other,
categor=purpose other marital foreign ,
corteinicio=0.2,cortefin=0.8,incremento=0.05,
porcaptura=0.3,directorio=c:);

%corteoptimo(archivo=pretest,
vardepen=bad,
conti=agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23,
categor=,
corteinicio=0.2,cortefin=0.8,incremento=0.05,
porcaptura=0.3,directorio=c:);


/* PARECE QUE EL CORTE EN 0.5 SALE SUFICIENTEMENTE BIEN 
	OTRA OPCIÓN ES EVALUAR CON LA MACRO CRUZADACORTE
*/


/**************************************************************************************
PRUEBA VARIOS MODELOS COMPARACIÓN VALIDACIÓN CRUZADA
/**************************************************************************************/
options nonotes;
%cruzadalogistica(archivo=german,
vardepen=bad,
conti=amount checking duration installp savings foreign marital history purpose other,
categor=purpose other marital foreign ,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final1;set final;modelo=1;

%cruzadalogistica(archivo=german,
vardepen=bad,
conti=checking duration savings,
categor=,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final2;set final;modelo=2;

%cruzadalogistica(archivo=german,
vardepen=bad,
conti=checking duration employed savings,
categor=,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final3;set final;modelo=3;

%cruzadalogistica(archivo=german,
vardepen=bad,
conti=checking coapp duration employed savings,
categor=,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final4;set final;modelo=4;

%cruzadalogistica(archivo=german,
vardepen=bad,
conti=history duration savings purpose duration*history amount marital foreign installp ,
categor=history marital foreign purpose,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final5;set final;modelo=5;

%cruzadalogistica(archivo=pretest,
vardepen=bad,
conti=
agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23,
categor=,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final6;set final;modelo=6;

data union;set final1 final2 final3 final4 final5 final6;
ods graphics off;
proc boxplot data=union;plot tasafallos*modelo;run;

/**************************************************************************************
PROBAR SUBMODELOS DEL MODELO ÓPTIMO
/**************************************************************************************/

ods output bestsubsets=modelos;
proc logistic data=pretest descending;
model bad=
agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23
/selection=score start=3 stop=16 best=1;
run;
data ;set modelos;put numberofvariables variablesinmodel;run;
proc print data=modelos;run;
/*
3 agehistory4 checkingother3 durationother3
4 agehistory4 checkingother3 durationother3 savings
5 agehistory4 checkingother3 coapphousing2 durationother3 savings
6 agehistory4 checkingother3 coapphousing2 durationother3 purperty02 savings
7 agehistory4 checkingother3 coapphousing2 durationother3 insteign1 purperty02 savings
8 agehistory4 checkingother3 coapphousing2 durationother3 insteign1 purperty02 resitory0 savings
9 agehistory4 checkingother3 coapphousing2 durationother3 emplpose3 insteign1 mariose31 resitory0 savings
10 amounthistory2 checkingother3 durationother3 emplpose3 foreory11 insteign1 mariose31 mariose32 resitory0 savings
11 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 insteign1 mariose31 mariose32 resitory0 savings
12 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 insteign1 instephon2 mariose31 mariose32 resitory0 savings
13 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 insteign1 instephon2 mariose31 mariose32 resitory0 savings telepose19
14 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 insteign1 instephon2 mariose31 mariose32 resitory0 savings telepose19 telepose23
15 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 housingjob24 insteign1 instephon2 mariose31 mariose32 resitory0 savings telepose19 telepose23
16 amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 resitory0 savings telepose19 telepose23

*/


/* Aquí me quedo solo con las 16 variables par reducir el tiempo de proceso 
*/

data protest;set pretest;
keep bad
agehistory4 checkingother3 coapphousing2 durationother3 insteign1 purperty02 savings
amounthistory2 checkingother3 coapphousing2 durationother3 emplpose3 foreory11 historyjob24 housingjob24 insteign1 
instephon2 mariose31 mariose32 resitory0 savings telepose19 telepose23;
run;

proc printto print='c:\ka.txt' ;
options notes;
/* 7 efectos */
%cruzadalogistica(archivo=protest,
vardepen=bad,
conti=agehistory4 checkingother3 coapphousing2 durationother3 insteign1 purperty02 savings,
categor=,
ngrupos=4,sinicio=12345,sfinal=12365,objetivos=tasafallos);
data final7;set final;modelo=7;
/* 10 efectos */
%cruzadalogistica(archivo=protest,
vardepen=bad,
conti=amounthistory2 checkingother3 durationother3 emplpose3 foreory11 insteign1 mariose31 mariose32 resitory0 savings
,
categor=,
ngrupos=4,sinicio=12345,sfinal=12365,objetivos=tasafallos);
data final8;set final;modelo=8;
/* 13 efectos */
%cruzadalogistica(archivo=protest,
vardepen=bad,
conti=amounthistory2 checkingother3 coapphousing2 
durationother3 emplpose3 foreory11 insteign1 instephon2 mariose31 mariose32 resitory0 savings telepose19
,
categor=,
ngrupos=4,sinicio=12345,sfinal=12365,objetivos=tasafallos);
data final9;set final;modelo=9;

data union;set final1 final2 final3 final4 final5 final6 final7 final8 final9;
ods graphics off;
proc boxplot data=union;plot tasafallos*modelo;run;


/**************************************************************************************
OBSERVAR LAS VARIABLES DEL MEJOR MODELO 
/**************************************************************************************/

proc freq data=pretest;tables
amouhon2 checking coapphousing2 coapppurpose1 duraeign1 duraephon2 histerty12 
historyother43 houserty24 housingjob34 insteign1 instpose0 maritalother33 resitory0 savings telepose16
;run;

proc gplot data=pretest;
plot bad*amouhon2 bad*amountpurpose1 bad*checking bad*coapphousing2 bad*coapppurpose1 bad*duraeign1 bad*duraephon2 bad*histerty12 
bad*historyother43 bad*houserty24 bad*housingjob34 bad*insteign1 bad*instpose0 bad*maritalother33 bad*resitory0 bad*savings
bad*telepose16;run;

proc gchart data=pretest;
vbar amouhon2 checking coapphousing2 coapppurpose1 duraeign1 duraephon2 histerty12 
historyother43 houserty24 housingjob34 insteign1 instpose0 maritalother33 resitory0 savings telepose16
/group=bad ;run;
proc gchart data=pretest;
vbar amouhon2 checking coapphousing2 coapppurpose1 duraeign1 duraephon2 histerty12 
historyother43 houserty24 housingjob34 insteign1 instpose0 maritalother33 resitory0 savings telepose16
/subgroup=bad ;run;

proc logistic data=pretest namelen=20 descending ;
model bad=
amouhon2 checking coapphousing2 coapppurpose1 duraeign1 duraephon2 histerty12 
historyother43 houserty24 housingjob34 insteign1 instpose0 maritalother33 resitory0 savings telepose16
/selection=stepwise;
run;quit;


/* PROBAR CON AGRUPACIÓN DE CATEGORÍAS EN EL ARCHIVO PRETEST
(NOTA: ESTO SE PODÍA HABER INTENTADO AL PRINCIPIO DE TODO)
*/

%AgruparCategorias(archivo=pretest,vardep=bad,vardeptipo=N,listclass=agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23,criterio=,directorio=c:);

ods output parameterestimates=parametros;
proc logistic data=archivofinal descending;
class  resitory0_G;
model bad=
agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23  resitory0_G
/selection=stepwise sle=0.015 sls=0.015;run;
data mode;length modelo effect $ 30000;retain modelo " ";set parametros end=fin;effect=variable;effect=cat(' ',effect);
if _n_ ne 1 then modelo=catt(modelo,' ',effect);if fin then output;
run;
data ;set mode;put modelo;run;
proc print data=parametros;run;

%cruzadalogistica(archivo=archivofinal,
vardepen=bad,
conti=
agehistory4 checkingother3 coapphousing2 durationother3 duratory4 emplpose3 exisose3 insteign1 mariose31 mariose32 purperty02 savings,
categor=resitory0_G,
ngrupos=4,sinicio=12345,sfinal=12365,objetivos=tasafallos);
data final10;set final;modelo=10;

data union;set final1 final2 final3 final4 final5 final6 final7 final8 final9 final10;
ods graphics off;
proc boxplot data=union;plot tasafallos*modelo;run;


/* FINALMENTE PROBAR LOS MEJORES MODELOS CON MUCHAS SEMILLAS OBSERVANDO BIEN SI EL RANGO DE ERROR SE MANTIENE
RESPECTO A LAS ANTERIORES PRUEBAS
pruebo el mejor  modelo con las variables originales (1), con las dummys (6) y un submodelo con menos efectos (8)

*/


%cruzadalogistica(archivo=german,
vardepen=bad,
conti=amount checking duration installp savings foreign marital history purpose other,
categor=purpose other marital foreign ,
ngrupos=4,sinicio=12345,sfinal=12355,objetivos=tasafallos);
data final1;set final;modelo=1;

%cruzadalogistica(archivo=pretest,
vardepen=bad,
conti=
agehistory4 amounthistory2 amountpurpose1 checkingother3 checpose1 checpose3 coapphousing2 durationother3 
duratory4 emplpose3 exisose3 foreory11 historyjob24 housingjob24 insteign1 instephon2 mariose31 mariose32 purperty02
resitory0 savings telepose19 telepose23,
categor=,
ngrupos=4,sinicio=22345,sfinal=22400,objetivos=tasafallos);
data final6;set final;modelo=6;


%cruzadalogistica(archivo=protest,
vardepen=bad,
conti=amounthistory2 checkingother3 durationother3 emplpose3 foreory11 insteign1 mariose31 mariose32 resitory0 savings
,
categor=,
ngrupos=4,sinicio=22345,sfinal=22400,objetivos=tasafallos);
data final8;set final;modelo=8;



