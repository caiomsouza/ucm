/* EJEMPLO SUBMISSION 

LA VARIABLE IP_1 SALIDA DE LA LOG�STICA ES EL RESULTADO QUE HAY QUE DAR.
LA OPCI�N ROC EN LOGISTIC OS DA EL �REA BAJO LA CURVA ROC PARA DATOS TRAIN.
UTILIZAR VALIDACI�N CRUZADA Y MACROS PARA DETERMINAR LOS MODELOS BUENOS.
 
*/

data union;
set discoc.creditostrain discoc.creditostestalumnos;
run;

proc logistic data=union;
class malo;
model malo=
cantidad hora1 zip1 campo1 campo2 hora2 flag1 /selection=stepwise;
roc;
output out=sal1 predprobs=(I) ;
run;

data;file 'c:\submission2.csv' dlm=','; /* EL ARCHIVO CREADO SE METE EN KAGGLE */
set sal1;
if _n_=1 then put 'row_id,value';
if malo=. then put id ip_1;
run;



/* NORMALMENTE CREAREMOS VARIABLES NUEVAS PARA LOS MODELOS.ESTAS VARIABLES TAMBI�N DEBEN SER CREADAS PARA LOS DATOS TEST.

SI SE USA LA MACRO NOMBRESMODOBIEN PARA TENER LAS VARIABLES EN AMBOS ARCHIVOS HAY UN PROBLEMA:
EL ARCHIVO DE UNION CONTIENE MISSINGS EN LA VARIABLE MALO Y LA MACRO NOMBRESMODBIEN PUEDE FALLAR.

PARA EVITARLO:

1) HACEMOS MALO=-1 PARA LOS DATOS TEST ANTES DE CREAR EL ARCHIVO UNION
data test;set discoc.testalumnos;malo=-1;
2) CREAMOS UNION
3) APLICAMOS LA MACRO NOMBRESMODBIEN
4) EN PRETEST HACEMOS malo=. SI MALO=-1:
data pretest;set pretest;if malo=-1 then malo=.;run;

LUEGO YA PODEMOS TRABAJAR SOBRE PRETEST INCLUIDO EL PROC LOGISTIC FINAL.
*/


