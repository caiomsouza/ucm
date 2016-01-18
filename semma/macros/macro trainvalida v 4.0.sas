/**********************************************************************************************/
/* MACRO TRAINING-VALIDACIÓN PARA REGRESIÓN GLM

LA DIFERENCIA CON LA VALIDACIÓN CRUZADA ES QUE CADA VEZ SE SORTEA UN ARCHIVO TRAINING 
Y OTRO DE VALIDACIÓN,
SE ESTIMA EL MODELO CON EL ARCHIVO TRAINING Y SE PREDICE EL DE VALIDACIÓN

[[[[[[[[[[NOTA:

CON VALIDACIÓN CRUZADA 
*********************
a) SE REALIZAN K VECES MÁS PRUEBAS, DONDE K ES EL NÚMERO DE GRUPOS
b) ESTÁ MÁS ESTRUCTURADA
c) ES MÁS FIABLE PARA COMPARACIÓN DE MODELOS
d) SE PREDICEN TODAS LAS OBSERVACIONES DEL ARCHIVO SIN FORMAR PARTE EN
LA CONSTRUCCIÓN DEL MODELO ]]]]]]]]]]]

%macro trainvalida(archivo=,vardepen=,listclass=,listindepen=,porcen=,seminicio=,semifinal=);

archivo=archivo de datos
vardepen=nombre de la variable dependiente (las independientes hay que ponerlas donde está indicado)
listclass=lista de variables categóricas
listindepen=lista de efectos campo independiente (variables continuas, categórias e interacciones)
porcen=porcentaje de observaciones del archivo original que van a ser training
seminicio=semilla inicial
semifinal=semilla final

*********
SALIDA
********
La macro obtiene, en el archivo FINAL, la media de errores al cuadrado (media) para cada semilla.

/**************************************************************************************************/

%macro trainvalida(archivo=,vardepen=,listclass=,listindepen=,porcen=,seminicio=,semifinal=);
data final;run;
%do semilla=&seminicio %to &semifinal;/*<<<<<******AQUI SE PUEDEN CAMBIAR LAS SEMILLAS */
data doss;set &archivo;u=ranuni(&semilla);
proc sort data=doss;by u;run;

data doss ;
set doss nobs=nume;
if _n_<=&porcen*nume then vardep=&vardepen;else vardep=.;
run;

%if &listclass ne %then %do;
/*************************************************************/
proc glm data=doss noprint;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
class &listclass;
model vardep=&listindepen;
output out=sal p=predi;run;
/*************************************************************/
data sal;set sal;resi2=(&vardepen-predi)**2;if vardep=. then output;run;
%end;
%else %do;
/*************************************************************/
proc glm data=doss noprint;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
model vardep=&listindepen;
output out=sal p=predi;run;
/*************************************************************/
data sal;set sal;resi2=(&vardepen-predi)**2;if vardep=. then output;run;
%end;

proc means data=sal noprint;var resi2;
output out=mediaresi mean=ASE;
run;
data mediaresi;set mediaresi;semilla=&semilla;media=ASE;run;

data final (keep=media semilla);set final mediaresi;if media=. then delete;run;
%end;
proc print data=final;run;
%mend;


/* EJEMPLO */
data uno (drop=i);
do i=1 to 100;
x=ranuni(1234);
y=rannor(1234)+2*x;
z=rannor(34344);
clase=ranbin(0,1,0.5);
output;
end;
run;
proc print;run;


%trainvalida(archivo=uno,vardepen=y,listclass=clase,listindepen=x z,porcen=0.75,seminicio=12345,semifinal=12348);

