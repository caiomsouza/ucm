/* EJEMPLO SUBMISSION 
LA VARIABLE IP_1 SALIDA DE LA LOGÍSTICA ES EL RESULTADO QUE HAY QUE DAR.
LA OPCIÓN ROC EN LOGISTIC OS DA EL ÁREA BAJO LA CURVA ROC PARA DATOS TRAIN.
UTILIZAR VALIDACIÓN CRUZADA Y MACROS PARA DETERMINAR LOS MODELOS BUENOS. */

/* NORMALMENTE CREAREMOS VARIABLES NUEVAS PARA LOS MODELOS.
ESTAS VARIABLES TAMBIÉN DEBEN SER CREADAS PARA LOS DATOS TEST.

SI SE USA LA MACRO NOMBRESMODOBIEN PARA TENER LAS VARIABLES EN AMBOS ARCHIVOS 
HAY UN PROBLEMA: EL ARCHIVO DE UNION CONTIENE MISSINGS EN LA VARIABLE MALO 
Y LA MACRO NOMBRESMODBIEN PUEDE FALLAR.

PARA EVITARLO:

1) HACEMOS MALO=-1 PARA LOS DATOS TEST ANTES DE CREAR EL ARCHIVO UNION
data test;set discoc.testalumnos;malo=-1;
2) CREAMOS UNION
3) APLICAMOS LA MACRO NOMBRESMODBIEN
4) EN PRETEST HACEMOS malo=. SI MALO=-1:
data pretest;set pretest;if malo=-1 then malo=.;run;

LUEGO YA PODEMOS TRABAJAR SOBRE PRETEST INCLUIDO EL PROC LOGISTIC FINAL. */

libname kaggle 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card';

data kaggle.creditostestalumnos_1;
set kaggle.creditostestalumnos;
malo = -1;
run;

data kaggle.union;
set kaggle.creditostrain kaggle.creditostestalumnos_1;
run;

proc surveyselect data=kaggle.union out=kaggle.m1 samprate=0.20 seed=12345;
/*strata y;*/
run;

proc contents data=kaggle.union out=sal;
data;set sal;put name @@;run;

/*strata 

campo1 campo2 campo3 campo4 campo5 cantidad dominio1 estado1 flag1 
flag2 flag3 flag4 flag5 hora1 hora2 id indicador1 indicador2 malo total zip1

*/

%interacttodo(archivo=kaggle.m1,vardep=malo,listclass=dominio1 estado1,listconti=campo1 campo2 campo3 campo4 campo5 cantidad flag1 
flag2 flag3 flag4 flag5 hora1 hora2 id indicador1 indicador2 total zip1,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card);

/*
dominio1*estado1 dominio1*cantidad dominio1*total dominio1 dominio1*zip1 dominio1*campo4
dominio1*flag5 dominio1*id dominio1*hora2 dominio1*hora1 dominio1*campo3 dominio1*campo1
dominio1*flag2 dominio1*flag1 dominio1*campo2 dominio1*flag3 dominio1*campo5 dominio1*indicador1
dominio1*indicador2 dominio1*flag4 estado1*indicador2 estado1*campo2 estado1*cantidad
estado1*campo4 estado1*total estado1*flag1 estado1*campo3 estado1 estado1*id estado1*zip1
estado1*flag2 estado1*campo5 estado1*hora2 estado1*indicador1 estado1*hora1 estado1*flag5
estado1*flag3 estado1*campo1 campo2 zip1 flag1 indicador2 indicador1 campo4 cantidad total flag2
estado1*flag4 id campo5 campo3 flag3 flag5 flag4 campo1 hora2 hora1
*/



%nombresmodbien(archivo=kaggle.m1,depen=malo,
modelo=
dominio1*estado1 dominio1*cantidad dominio1*total dominio1 dominio1*zip1 dominio1*campo4
dominio1*flag5 dominio1*id dominio1*hora2 dominio1*hora1 dominio1*campo3 dominio1*campo1
dominio1*flag2 dominio1*flag1 dominio1*campo2 dominio1*flag3 dominio1*campo5 dominio1*indicador1
dominio1*indicador2 dominio1*flag4 estado1*indicador2 estado1*campo2 estado1*cantidad
estado1*campo4 estado1*total estado1*flag1 estado1*campo3 estado1 estado1*id estado1*zip1
estado1*flag2 estado1*campo5 estado1*hora2 estado1*indicador1 estado1*hora1 estado1*flag5
estado1*flag3 estado1*campo1 campo2 zip1 flag1 indicador2 indicador1 campo4 cantidad total flag2
estado1*flag4 id campo5 campo3 flag3 flag5 flag4 campo1 hora2 hora1
,
listclass=dominio1 estado1
,
listconti=campo1 campo2 campo3 campo4 campo5 cantidad flag1 
flag2 flag3 flag4 flag5 hora1 hora2 id indicador1 indicador2 total zip1 ,
corte=15,directorio=C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card);


proc logistic data=kaggle.union;
class malo;
model malo=cantidad hora1 zip1 campo1 campo2 hora2 flag1 
/selection=stepwise;roc;
output out=sal1 predprobs=(I);
run;


data;file 'C:\discoc\TRABAJO_3\submission2.csv' dlm=','; /* EL ARCHIVO CREADO SE METE EN KAGGLE */
set sal1;
if _n_=1 then put 'row_id,value';
if malo=. then put id ip_1;
run;






/*	Muestras de kaggle.union

data kaggle.muestraKG;
do i=1 to 3000;
y=ranbin(0,1,0.10);
z=rannor(0);
output;
end;
run;

proc sort data=kaggle.muestraKG;
by y;
run;

proc surveyselect data=kaggle.muestra out=kaggle.m1 samprate=0.20 seed=12345;
strata y;
run;

proc freq data=kaggle.m1; tables y; run;
*/



