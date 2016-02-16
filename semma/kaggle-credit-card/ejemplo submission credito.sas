

/* EJEMPLO SUBMISSION 

LA VARIABLE IP_1 SALIDA DE LA LOGÍSTICA ES EL RESULTADO QUE HAY QUE DAR.
LA OPCIÓN ROC EN LOGISTIC OS DA EL ÁREA BAJO LA CURVA ROC PARA DATOS TRAIN.
UTILIZAR VALIDACIÓN CRUZADA Y MACROS PARA DETERMINAR LOS MODELOS BUENOS.
 
*/

libname discoc 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card';


data union;
set discoc.creditostrain discoc.creditostestalumnos;
run;

proc contents data=union;run;

data union;
set union;
logcantidad = log(cantidad);
expcantidad = cantidad**2; 
run;


proc standard data=union out=salida_standard mean=0 std=1; var age baths beds lot sqft tax;
run;


/* tentativa 1 */
proc logistic data=union;
class malo;
model malo=
cantidad hora1 zip1 campo1 campo2 hora2 flag1 /selection=stepwise;
roc;
output out=sal1 predprobs=(I) ;
run;

/* tentativa 2 */

proc logistic data=union;
class malo;
model malo=
campo1 campo2 campo3 campo4 campo5 cantidad flag1 flag2 flag3 flag4 flag5 hora1 hora2 indicador1 indicador2 expcantidad logcantidad total zip1  /selection=stepwise;
roc;
output out=sal1 predprobs=(I) ;
run;


/* tentativa 3 */

proc logistic data=union;
class malo;
model malo=
campo1 campo2 campo3 campo4 campo5 cantidad flag1 flag2 flag3 flag4 flag5 hora1 hora2 indicador1 indicador2 total zip1  /selection=stepwise;
roc;
output out=sal1 predprobs=(I) ;
run;

/* tentativa 4 */

proc logistic data=union;
class malo;
model malo=
campo1 campo2 campo3 campo4 campo5 cantidad flag1 flag2 flag3 flag4 flag5 hora1 hora2 indicador1 indicador2 total zip1 cantidad*total /selection=stepwise;
roc;
output out=sal1 predprobs=(I) ;
run;

/* dominio1 estado1 */

%interacttodo(archivo=union,vardep=malo,
listclass=dominio1 estado1 ,listconti=campo1 campo2 campo3 campo4 campo5 cantidad flag1 flag2 flag3 flag4 flag5 hora1 hora2 indicador1 indicador2 total zip1,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card\logs\);



data;file 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle-credit-card\submission-caio03-09feb16.csv' dlm=','; /* EL ARCHIVO CREADO SE METE EN KAGGLE */
set sal1;
if _n_=1 then put 'row_id,value';
if malo=. then put id ip_1;
run;




/* NORMALMENTE CREAREMOS VARIABLES NUEVAS PARA LOS MODELOS.ESTAS VARIABLES TAMBIÉN DEBEN SER CREADAS PARA LOS DATOS TEST.

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



