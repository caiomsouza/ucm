
/* LA MACRO RANDOMSELECT REALIZA UN MÉTODO STEPWISE 
REPETIDAS VECES CON DIFERENTES ARCHIVOS TRAIN.

LA SALIDA INCLUYE UNA TABLA DE FRECUENCIAS 
DE LOS MODELOS QUE APARECEN SELECCIONADOS EN LOS DIFERENTES 
ARCHIVOS TRAIN

LOS MODELOS QUE SALEN MÁS VECES SON POSIBLES CANDIDATOS A PROBAR 
CON VALIDACIÓN CRUZADA

listclass=lista de variables de clase
vardepen=variable dependiente
modelo=modelo
criterio= criterio del glmselect : AIC, SBC, BIC, SL , etc.
sinicio=semilla inicio
sfinal=semilla final
fracciontrain=fracción de datos train
directorio=directorio de trabajo para archivos de texto de apoyo

EL ARCHIVO QUE CONTIENE LOS EFECTOS SE LLAMA SALEFEC. 
SE INCLUYE EN EL LOG EL LISTADO PARA PODER COPIAR Y PEGAR 
(A VECES LA VENTANA OUTPUT ESTÁ LIMITADA)

*/

%macro randomselect(data=,listclass=,vardepen=,modelo=,criterio=,sinicio=,sfinal=,fracciontrain=,directorio=&directorio); 
options nocenter linesize=256;
proc printto print="&directorio\kk.txt";run;
data _null_;file "&directorio\cosa.txt" linesize=2000;run;
%do semilla=&sinicio %to &sfinal;
proc surveyselect data=&data rate=&fracciontrain out=sal1234 seed=&semilla;run;
ods output   SelectionSummary=modelos;
ods output    SelectedEffects=efectos;
ods output    Glmselect.SelectedModel.FitStatistics=ajuste;
proc glmselect data=sal1234  plots=all seed=&semilla;
  class &listclass; 
  model &vardepen= &modelo/ selection=stepwise(select=&criterio choose=&criterio) details=all stats=all;
run;   
ods graphics off;   
ods html close;   
data union;i=5;set efectos;set ajuste point=i;run;
data _null_;semilla=&semilla;file "&directorio\cosa.txt" mod linesize=2000;set union;put effects ;run;
%end;
proc printto ;run;
data todos;
infile "&directorio\cosa.txt" linesize=2000;
length efecto $ 1000;
input efecto @@;
if efecto ne 'Intercept' then output;
run;
proc freq data=todos;tables efecto /out=sal;run;
proc sort data=sal;by descending count;
proc print data=sal;run;

data todos;
infile "&directorio\cosa.txt" linesize=2000;
length efecto $ 1000;
input efecto $ &&;
run;
proc freq data=todos;tables efecto /out=salefec;run;
proc sort data=salefec;by descending count;
proc print data=salefec;run;
data _null_;set salefec;put efecto;run;
%mend;

/* - LA MACRO AGRUPAR CONSTRUYE VARIABLES DE AGRUPACIÓN PARA VARIABLES CATEGÓRICAS DE BASE, 
		PARA UN MODELO CON VARIABLE DEPENDIENTE CONTINUA O DISCRETA, BASÁNDOSE EN CONTRASTES DE HIPÓTESIS BÁSICOS ENTRE NIVELES.

archivo=, 		 Archivo de datos que contiene a las variables Nominales 
vardep=, 		 Variable Dependiente (Intervalo o Nominal ) 
vardeptipo=, 	 Tipo de la variable dependiente: I=Intervalo o N=Nominal 
listclass=, 	 Lista separada por espacios de las variables a agrupar 
criterio= 		 Criterio usado para la división de las ramas en el proc arboretum 

* Criteria for Interval Targets
	VARIANCE 	-> reduction in square error from node means
	PROBF 		-> p-value of F test associated with node variances (default)
* Criteria for Nominal Targets
	ENTROPY 	-> Reduction in entropy
	GINI 		-> Reduction in Gini index
	PROBCHISQ 	-> p-value of Pearson chi-square for target vs. branches (default)
Criteria for Ordinal Targets
	ENTROPY 	-> Reduction in entropy, adjusted with ordinal distances
	GINI 		-> Reduction in Gini index, adjusted with ordinal distances (default)

directorio=		 directorio de trabajo para archivos de apoyo 

*******
SALIDA
*******

	*EL ARCHIVOFINAL CONTIENE LAS VARIABLES ORIGINALES Y LAS TRANSFORMADAS CON LOS NOMBRES ORIGINALES Y EL SUBINDICE _G 
	SI HAY GRUPOS CREADOS

	* SI NO SE HACEN AGRUPACIONES POR DIFERENCIAS SIGNIFICATIVAS ENTRE TODOS LOS NIVELES, SALE UN MENSAJE EN LOG
	* SI SE UNEN TODAS LAS CATEGORÍAS (LOS NIVELES SON SIMILARES RESPECTO A LA VARIABLE DEPENDIENTE) SALE UN MENSAJE EN LOG
	
	* EN LA VENTANA OUTPUT SALE EL LISTADO DE LOS GRUPOS CREADOS RELACIONADO CON LA VARIABLE ORIGINAL

*****
NOTAS
*****
		- TRAS EJECUTAR LA MACRO, ES CONVENIENTE:

A) OBSERVAR EN EL LOG LAS VARIABLES CREADAS
B) PROC CONTENTS DEL ARCHIVO ARCHIVOFINAL (Y GUARDARLO EN PERMANENTE SI SE QUIERE)
*/

%macro AgruparCategorias(
archivo=, 		/* Archivo de datos que contiene a las variables Nominales */
vardep=, 		/* Variable Dependiente (Intervalo o Nominal ) */
vardeptipo=, 	/* Tipo de la variable dependiente: I=Intervalo o N=Nominal */
listclass=, 	/* Lista separada por espacios de las variables a agrupar */
criterio=, 		/* Criterio usado para la división de las ramas en el proc arboretum */
directorio=c:		/* directorio de trabajo para archivos de apoyo */
);
%if &criterio eq %then %do;
 %if &vardeptipo=I %then %let criterio=PROBF;
 %if &vardeptipo=N %then %let criterio=PROBCHISQ;
%end;

	/* Solo con la información relevante */
	data archivosa;
		set &archivo (KEEP = &vardep &listclass);
	run;
	data _null_;
		file "&directorio\tempAgrupacionClasesVariableNominal.txt";
		put ' ';
	run;
	/* data temporal;
		retain variable ' ';
	run;
	*/
	data _null_;
		length clase $ 10000 ;
	/* Cuento el número de variables */
	clase="&listclass";
		ncate= 1;
		do while (scanq(clase, ncate) ^= '');
			ncate+1;
		end;
		ncate+(-1);put;
		put // ncate= /;
		call symput('ncate',left(ncate));
	run;
	/* Bucle arboretum */
	%do i=1 %to &ncate;
		%let vari=%qscan(&listclass,&i);
		%if %upcase(&vardeptipo)=I %then %do;
			proc arboretum data=archivosa criterion=&criterio; /* CRITERIO PROBF HACE CONTRASTES TIPO PARES */
				input &vari / level=nominal; 
				target &vardep / level=interval; 
				save model=tree1; 
			run;
		%end;
		%else %do; 
			proc arboretum data=archivosa criterion=&criterio; 
				input &vari / level=nominal; 
				target &vardep / level=nominal; 
				save model=tree1; 
			run;
		%end;
		proc arboretum inmodel=tree1;
			score data=archivosa out=archivosa2 ;
			subtree best;
		run;
		data archivosa;
			set archivosa2;
		run;
		/* comprobar si no se hacen agrupaciones */
		proc freq data=archivosa noprint;
			tables &vari /out=sal1;
		proc freq data=archivosa noprint;
			tables _leaf_ /out=sal2;
		data _null_;
			if _n_=1 then set sal1 nobs=nume1;
			if _n_=1 then set sal2 nobs=nume2;
			if _n_=1 then do;
				if nume1=nume2 then noagrupa=1;
				else noagrupa=0;
				call symput ('noagrupa',left(noagrupa));
			end;
			if noagrupa=1 then do;
				put 'NOAGRUPA  ' "&vari";
				file "&directorio\tempAgrupacionClasesVariableNominal.txt" mod;
				put "&vari";
			end;
			stop;
		run;
		/* comprobar si se unen todas las categorías */
		proc freq data=archivosa noprint;
			tables _leaf_ /out=sal1;
		run;
		data _null_;
			set sal1 nobs=nume;
			call symput ('seunentodas',left(nume));
			if nume=1 then do;
				put 'SE UNEN TODAS   ' "&vari";
				file "&directorio\tempAgrupacionClasesVariableNominal.txt" mod;
				put "&vari";
			end;
		run;
		%if &noagrupa eq 0 and &seunentodas ne 1 %then %do;
			data _null_;koko2=cats("&vari",'_G');call symput('koko',left(koko2));run;
			data archivosa (drop=_node_ );
				set archivosa;
				rename _leaf_=&koko;
			run;
			data _null_;
				file "&directorio\tempAgrupacionClasesVariableNominal.txt" mod;
				h="&koko";h=left(h);
				put h;
			run;
		%end;
		%else %do;
			data archivosa(drop=_leaf_ _node_);
				set archivosa;
			run;
		%end;
	%end;
	data archivofinal (drop=P_&vardep R_&vardep);
		merge &archivo archivosa;
	run;
	data _null_;
		length c $ 300;
		if _n_=1 then put ' '//'LISTA DE GRUPOS CREADOS Y NO CREADOS'//'*******************************************' ;
			infile "&directorio\tempAgrupacionClasesVariableNominal.txt" ;
			input c $;
			put c @@;
	run;
	data _null_;put //'*******************************************' ;run;

/* COMPROBAR GRUPOS CREADOS */

%do i=1 %to &ncate;
	%let vari=%qscan(&listclass,&i);
 	data _null_;retain control 0;length c $ 300;infile "&directorio\tempAgrupacionClasesVariableNominal.txt" ;input c $;
		c3=cats("&vari",'_G');
		if c=c3 then control=1;
		call symput('control',left(control));
		call symput('grupo',left(c3));
	run;
	%if &control=1 %then %do;
	 proc freq data=archivofinal noprint;tables &vari*&grupo /out=sal;run;
	proc sort data=sal;by &grupo;
	proc print data=sal;run;
	%end;
%end;	

%mend;



/*******************************************************************
/* MACRO VALIDACIÓN CRUZADA PARA REGRESIÓN NORMAL

%macro cruzada(archivo=,vardepen=,listconti=,listclass=,ngrupos=,sinicio=,sfinal=);

archivo=archivo de datos
vardepen=nombre de la variable dependiente 
listconti=variables independientes continuas
listclass=variables independientes categóricas
ngrupos=número de grupos a dividir por validación cruzada
inicio=semilla de inicio
sfinal=semilla final

*******
SALIDA
*******
La macro obtiene la suma y media de errores al cuadrado por CV para cada semilla.
Esta información está contenida en el archivo final.
Variables:
media=media de errores de validación cruzada por cada ejecución-semilla
suma=suma de errores de validación cruzada por cada ejecución-semilla

NOTAS

1) Se puede poner antes de ejecuciones largas la sentencia
	options nonotes;
para no llenar la ventana log y que no nos pida borrarla.
Para volver a ver comentarios-errores en log:
	options notes;

2) Para comparar modelos, añadir la variable modelo despues de ejecutada la macro con
cada uno de los modelos:
%cruzada...
data final1;set final;modelo=1;run;
...
%cruzada...
data final5;set final;modelo=5;run;

y finalmente union y un boxplot:

data union;set final1 final2...final5;
proc boxplot data=final;plot media*modelo;run;
*************************************************************************/

%macro cruzada(archivo=,vardepen=,listconti=,listclass=,ngrupos=,sinicio=,sfinal=);
data final;run;
/* Bucle semillas */
%do semilla=&sinicio %to &sfinal;
	data dos;set &archivo;u=ranuni(&semilla);
	proc sort data=dos;by u;run;
	data dos;
	retain grupo 1;
	set dos nobs=nume;
	if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
	run;
	data fantasma;run;
	%do exclu=1 %to &ngrupos;
		data tres;set dos;if grupo ne &exclu then vardep=&vardepen;
		proc glm data=tres noprint;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
		%if &listclass ne %then %do;class &listclass;model vardep=&listconti &listclass;%end;
		%else %do;model vardep=&listconti;%end;
		output out=sal p=predi;run;
		data sal;set sal;resi2=(&vardepen-predi)**2;if grupo=&exclu then output;run;
		data fantasma;set fantasma sal;run;
	%end;
	proc means data=fantasma sum noprint;var resi2;
	output out=sumaresi sum=suma mean=media;
	run;
	data sumaresi;set sumaresi;semilla=&semilla;
	data final (keep=suma media semilla);set final sumaresi;if suma=. then delete;run;
%end;
proc print data=final;run;
%mend;

/**************************************************************************
LA MACRO REDUZCOVALORES TRADUCE LOS VALORES DE LAS VARIABLES CATEGÓRICAS 
A NÚMEROS ORDINALES PARA PODER APLICAR OTRAS MACROS COMO LA %NOMBRESMOD, 
DONDE LA COMPLEJIDAD DE LOS VALORES ALFANUMÉRICOS (CARACTERES RAROS, ESPACIOS,
ETC.)PUEDE AFECTAR. 

Parámetros:

archivo= 
listclass=lista de variables categóricas a recategorizar
directorio=directorio para archivos de texto
*******
SALIDA
*******

EL ARCHIVO DE SALIDA SE LLAMA CAMBIOS. 
EN ESTE
ARCHIVO DE SALIDA LAS VARIABLES TRANSFORMADAS TOMAN EL 
MISMO NOMBRE ORIGINAL CON UN 2 DETRÁS.
LAS VARIABLES ORIGINALES NO ESTÁN INCLUIDAS.

EXISTE OTRO ARCHIVO DE SALIDA LLAMADO DICCIONARIO, DONDE 
SE PRESENTAN LAS CATEGORÍAS DE CADA VARIABLE Y SU TRADUCCIÓN.

***************************************************************************/

%macro reduzcovalores(archivo=,listclass=,directorio=c:);
data _null_;
clase="&listclass";
  ncate= 1;
  do while (scanq(clase, ncate) ^= '');
    ncate+1;
  end;
  ncate+(-1);
  call symput('ncate',left(ncate));
run;
data diccionario;run;
data _null_;;
file "&directorio\diccionario.txt" ;
put 'data cambios(drop=' "&listclass" ');set ' "&archivo" ';';
run;
%do i=1 %to &ncate;
	 %let vari=%qscan(&listclass,&i);
	proc freq data=&archivo noprint;tables &vari/ out=salifrec;
	data u1 (keep=nombrevariable original nuevacategoria );
	length nombrevariable $ 200;
	nombrevariable="&vari";
	set salifrec nobs=nume;
	original=&vari;variable="&vari"; 
	nuevacategoria=_n_;
		file "&directorio\diccionario.txt" mod;
	put "if &vari='" &vari "' then &vari.2=" nuevacategoria ";";
run;
data diccionario;set diccionario u1;run;
%end;
data _null_;file "&directorio\diccionario.txt" mod;put 'run;';run;
%include "&directorio\diccionario.txt";run;
title 'CAMBIOS';
proc contents data=cambios;run;
data diccionario;set diccionario;if _n_=1 then delete;
proc print data=diccionario;run;
quit;
%mend;


/* MACRO RENOMBRAR

RENOMBRA LISTAS DE VARIABLES A LISTAS CON PREFIJOS


LA MACRO RENOMBRAR RENOMBRA LISTAS DE VARIABLES A 
LISTAS CON PREFIJO (X1,X2...) PARA QUE SEA MÁS CÓMODO
REALIZAR OPERACIONES TIPO ARRAY Y NO HAYA PROBLEMAS
DE CARACTERES RAROS O LONGITUDES NO CONTROLADAS

archivo=,
listaclass=, LISTA DE VARIABLES CODIFICADAS COMO CHARACTER
listaconti=, LISTA DE VARIABLES CODIFICADAS COMO NUMÉRICAS (PUEDEN SER CATEGÓRICAS)
prefijoclass=,PREFIJO A PONER EN LA LISTA DE VARIABLES CHARACTER
prefijoconti=PREFIJO A PONER EN LA LISTA DE VARIABLES NUMÉRICAS

******
SALIDA
******

EL ARCHIVO DE SALIDA SE LLAMA IGUAL QUE EL DE ENTRADA CON EL SUFIJO 2

HAY UN ARCHIVO DE SALIDA LLAMADO DICCIONARIO QUE CONTIENE A QUÉ VARIABLE
CORRESPONDE CADA VARIABLE NUEVA CREADA 

*/

%macro renombrar(archivo=,listaclass=,listaconti=,prefijoclass=,prefijoconti=);
%if &listaconti ne %then %do;
data _null_;
clase="&listaconti";
  nconti= 1;
  do while (scanq(clase, nconti) ^= '');
    nconti+1;
  end;
  nconti+(-1);
  call symput('nconti',left(nconti));
run;
%end;
%if &listaclass ne %then %do;
data _null_;
clase="&listaclass";
  ncate= 1;
  do while (scanq(clase, ncate) ^= '');
    ncate+1;
  end;
  ncate+(-1);
  call symput('ncate',left(ncate));
run;
%end;
%if (&listaconti ne and &listaclass ne) %then %do;
data &archivo.2 (drop=&listaclass &listaconti i);
array &prefijoclass{&ncate} $;
array &prefijoconti{&nconti};
array variclass{&ncate} $ &listaclass;
array variconti{&nconti} &listaconti;
set &archivo;
do i=1 to &nconti; 
	&prefijoconti{i}=variconti{i};
end;
do i=1 to &ncate; 
	&prefijoclass{i}=variclass{i};
end;
run;

data diccionario (keep=original nueva);
do i=1 to &ncate; 
 cosa="&listaclass";original=scanq(cosa,i);
 nueva=cats("&prefijoclass",i);
 output;
end;
run;

%end;
%else %if (&listaconti eq and &listaclass ne) %then %do;
data &archivo.2 (drop=&listaclass i);
array &prefijoclass{&ncate} $;
array variclass{&ncate} $ &listaclass;
set &archivo;
do i=1 to &ncate; 
	&prefijoclass{i}=variclass{i};
end;
run;
%end;
%else %if (&listaconti ne and &listaclass eq) %then %do;
data &archivo.2 (drop=&listaconti i);
array &prefijoconti{&nconti};
array variconti{&nconti} &listaconti;
set &archivo;
do i=1 to &nconti; 
	&prefijoconti{i}=variconti{i};
end;
run;
%end;

%mend;

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

/*****************************************************************************
/* MACRO CONTARVALORES

La macro contarvalores cuenta valores distintos de cada variable de la lista.

Esta macro permitirá observar si hay alguna variable inicialmente declarada como continua
que puede ser utilizada como nominal 

archivo=,
listavar=lista de variables, pueden ser de tipo numérica o alfanumérica
*******
SALIDA
*******
Archivo uni , contiene el número de valores distintos de cada variable de la lista.
También saca en el LOG la lista de variables ordenada de más valores a menos (por
si se quiere hacer un gráfico de nube de puntos)
****************************************************************************/

%macro contarvalores(archivo=,listavar=);
data _null_;
length clase $ 6000;
clase="&listavar";
  nconti= 1;
  do while (scanq(clase, nconti) ^= '');
    nconti+1;
  end;
  nconti+(-1);
  call symput('nconti',left(nconti));
run;
data uni;run;
%do i=1 %to &nconti;
	%let vari=%qscan(&listavar,&i);

proc freq data=&archivo noprint;tables &vari / out=sal1;run;
data sal1 (keep=variable valoresdistintos);length variable $ 200 ;set sal1 nobs=nume;variable="&vari";valoresdistintos=nume;output;
if _n_=1 then stop;run;
data uni;set uni sal1;run;
%end;
data uni;set uni;if _n_=1 then delete;
proc sort data=uni;by descending valoresdistintos;run;
data _null;set uni; put variable @@;run;
proc print data=uni;run;
%mend;

/****************************************************************************************
/* LA MACRO NOMBRESMODBIEN CREA UN ARCHIVO DE DISEÑO DE DUMMYS CON EFECTOS E INTERACCIONES 
SEGÚN EL MODELO DADO USANDO PROC GLMMOD Y LAS NOMBRA ADECUADAMENTE
PARA PODER ENTENDERLAS (CAMBIANDO LOS NOMBRES COL1---COLN)

SOLO VALE DE MOMENTO PARA DATOS NO MISSING, EN TODAS LAS VARIABLES TRATADAS
**************************************************************************

%macro nombresmodbien (archivo=,depen=,modelo=,listclass=,listconti=,corte=,directorio=c:);

archivo=
depen=variable dependiente
modelo=se deben poner los efectos principles e interacciones que se desee
(solo hasta orden dos)
listclass=lista de variables de clase
listconti=lista de variables continuas
corte=No se crearán en el archivo de salida dummys para categorías 
que tengan un número de observaciones menor del corte 
directorio= poner el directorio para archivos temporales basura

********
SALIDA Y NOTAS
********

1) EL ARCHIVO DE SALIDA SE LLAMA PRETEST. TIENE LOS DATOS ORIGINALES CON LAS INTERACCIONES CREADAS Y BIEN NOMBRADAS. 
CADA VARIABLE CUALITATIVA E INTERACCIONES ENTRE 2 CUALITATIVAS O ENTRE 1 CUALITATIVA Y 1 CONTINUA ESTÁ EXPANDIDO EN DUMMYS 

2) EN EL LOG HAY UN LISTADO DE LAS VARIABLES/EFECTOS CREADOS EN EL ARCHIVO

3) NOTA: SE PUEDE FINALMENTE, SI SE DESEA, HACER UN MERGE CON EL ARCHIVO ORIGINAL PARA TENER 
TODAS LAS VARIABLES CREADAS Y ADEMÁS LAS ORIGINALES:

data final;merge pretest archivooriginal;run;

4) DE CARA A CONSTRUIR MODELOS LAS VARIABLES CREADAS CON ESTA MACRO EN PRETEST
SE TRATARÁN COMO CONTINUAS EN CADA PROCEDIMIENTO POSTERIOR.

****************************************************************************************/
options mprint=0;
%macro nombresmodbien(archivo=,depen=,modelo=,listclass=,listconti=,corte=0,directorio=c:);
options NOQUOTELENMAX; 
%let haycont=1;
proc glmmod data=&archivo outdesign=outdise outparm=nomcol noprint namelen=200;
class &listclass;
model &depen=&modelo;
run;
/* borro intercept */
data outdise2;set outdise;drop col1 &depen;run;
data nomcol;set nomcol;if _colnum_=1 then delete;run;
data _null_;
clase="&listconti";
  nconti= 1;
  do while (scanq(clase, nconti) ^= '');
    nconti+1;
  end;
  nconti+(-1);
  call symput('nconti',left(nconti));
run;

data _null_;
clase="&listclass";
  ncate= 1;
  do while (scanq(clase, ncate) ^= '');
    ncate+1;
  end;
  ncate+(-1);
  call symput('ncate',left(ncate));
run;
data _null_;
clase="&modelo";
  nmodelo= 1;
  do while (scanq(clase, nmodelo) ^= '');
    nmodelo+1;
  end;
  nmodelo+(-1);
  call symput('nmodelo',left(nmodelo));
run;

/* capturo nombres de interacciones */
data _null_;
length modelo2 $2000.;
modelo2=tranwrd("&modelo",'*','AAAA');
call symput('modelo2',left(modelo2));
run;

data uninombres;run;
data listacont;run;
%do j=1 %to &nmodelo;

%let efee=%qscan(&modelo2,&j);
%let positia=0;%let conta1=0;%let conta2=0;%let conta=0;%let suma=0;
%let varinombre1=' ';%let varinombre2=' ';
data _null_;length efee $2000.;efee="&efee";put efee=;
     positia=index(efee,'AAAA');
 if positia>0 then do;
	varinombre1=tranwrd(substr(efee,1,positia+3),'AAAA','');
	varinombre2=left(compress(substr(efee,positia+3,length(efee)),'AAAA'));
	call symput('varinombre1',left(varinombre1));
	call symput('varinombre2',left(varinombre2));
	call symput('positia',left(positia));
end;
else call symput('positia',left(positia));
run;

%if &positia ne 0 %then %do;

									/* todo esto si es una interacción */
data _null_;conta1=0;conta2=0;
		%do i=1 %to &ncate;
 			%let vari=%qscan(&listclass,&i);
 			if trim("&varinombre1")="&vari" then conta1=1;
 			if trim("&varinombre2")="&vari" then conta2=1;
		%end;
		suma=conta1+conta2;
	call symput('suma',left(suma));
	call symput('conta1',left(conta1));
	call symput('conta2',left(conta2));
run;
	
/* dos cualitativas */

%if &suma eq 2 %then %do;
title 'FRECU';
proc freq data=&archivo ;tables &varinombre1*&varinombre2 /out=salcruce;run;
data salcruce;set salcruce;
    if percent=. then delete;
	ko1=put(&varinombre1,30.);
	ko2=put(&varinombre2,30.);
drop &varinombre1;
drop &varinombre2;
ko1=left(ko1);
ko2=left(ko2);
rename ko1=&varinombre1;rename ko2=&varinombre2;
run;
proc sort data=nomcol;by &varinombre1 &varinombre2;run;
data nomcol2;set nomcol;if &varinombre1=' ' or &varinombre2=' ' then delete;
data nomcol2;merge nomcol2 salcruce(keep=count &varinombre1 &varinombre2) ;by &varinombre1 &varinombre2 ;
run;
data nomu;merge nomcol nomcol2 ;by &varinombre1 &varinombre2;
cosa1=cats("&varinombre1","*","&varinombre2");
cosa2=cats("&varinombre2","*","&varinombre1");if (effname=cosa1 and effname ne '') or (effname=cosa2 and effname ne '');
run;
data uninombres;set uninombres nomu;run;

%end;

/* continua y cualitativa */
%else %do;
	%if &conta1 eq 1 %then %do;%let efee=&varinombre1;%let efee=%trim(&efee);%end;
	%else %do;%let efee=&varinombre2;%let efee=%trim(&efee);%end;
	proc freq data=&archivo noprint;tables &efee /out=sal;run; 
	data sal;set sal;if percent=. then delete;run;
	data sal;set sal;
	ko=put(&efee,30.);
	drop &efee;ko=left(ko);
	rename ko=&efee;
	run;
	data nomu;set nomcol;
	cosa1=cats("&varinombre1","*","&varinombre2");
	cosa2=cats("&varinombre2","*","&varinombre1");
	if (effname=cosa1 and effname ne '') or (effname=cosa2 and effname ne '');run;
	data nomu;merge nomu sal;run;
	data uninombres;set uninombres nomu;run;
%end;


%end;
									/* FIN si es una interacción */

%else %do;

/* PRIMERO VER SI ES UNA CATEGÓRICA PARA AÑADIR COUNT*/

data _null_;
conta=0;
%do i=1 %to &ncate;
 %let vari=%qscan(&listclass,&i);
 if "&efee"="&vari" then conta=1;
%end;
call symput('conta',left(conta));
run;
%if &conta>0 %then %do;
	proc freq data=&archivo noprint;tables &efee /out=sal;run; 
	data sal;set sal;
	ko=put(&efee,30.);
	drop &efee;ko=left(ko);
	rename ko=&efee;
	run;
	data sal;set sal;if percent=. then delete;run;
 	data nomu;set nomcol;if effname="&efee" and &efee ne ' ' then output;run;
	data nomu;merge nomu sal;run;
	data uninombres;set uninombres nomu;run;
 	
%end;

%else %do; /*ES UNA VARIABLE CONTINUA SUELTA */
data nomu (drop=haycont);set nomcol;if effname="&efee" then output;
haycont=1;
call symput('haycont',left(haycont));
run;
data listacont;set listacont nomu;run;
%end;


%end;/* fin no es una interacción */


%end; /* fin efectos en el modelo */
data uninombres;set uninombres;drop percent cosa1 cosa2;run;
title 'TODOS LOS EFECTOS SALVO CONTINUAS';
proc print data=uninombres;run;
data nomcol;set uninombres;
 if effname='Intercept' then delete;
 if _colnum_=. then delete;
 if count=. or count>&corte then output;
run;
%if &haycont=1 %then %do;
data listacont;set listacont;if _n_=1 then delete;run;
data nomcol;set nomcol listacont;run;
%end;
title 'SOLO EFECTOS INCLUIDOS';
proc print data=nomcol;run;
data efectos (keep=efecto _colnum_);
length efecto $ 31;
set nomcol;
/* aqui hay que verificar si el efecto es una variable continua */
conta=0;
%do i=1 %to &nconti;
 %let vari=%qscan(&listconti,&i);
 if effname="&vari" then conta=1;
%end;
efecto=effname;
if conta=0 then do; %do i=1 %to &ncate;
                 %let vari=%qscan(&listclass,&i);
				 efecto=compress(cats(efecto,&vari),,"p");
				%end;end;
run;

proc sort data=efectos;by _colnum_;run;
proc contents data=outdise2 out=salcon noprint;run;

data salcon(keep=name _colnum_ colu);set salcon;
 colu=compress(name,'Col');
 _colnum_=input(colu, 5.); 
run;
proc sort data=salcon;by _colnum_;run;

data unisalefec malos;merge salcon efectos(in=ef);by _colnum_;if ef=1 then output unisalefec;else output malos;run;
filename renomb "&directorio\reno.txt";
filename malos "&directorio\listamalos.txt";
data _null_;
 file "&directorio\listamalos.txt";
 set malos end=eof;
 if _n_=1 then put 'data outdise2;set outdise2;drop ';put name @@;
 if eof=1 then put ';run;';
run;
%include malos;
data _null_;
length efecto efecto2 $ 20000;
file renomb; 
set unisalefec end=eof;
if length(efecto)>14 then efecto2=trim(substr(efecto,1,4)||SUBSTR(efecto,12,length(efecto)));
else efecto2=efecto;
if _n_=1 then put "rename ";
put name '= ' efecto2;
if eof then put ';';
run;
data pretest;
set outdise2;
%include renomb; 
run;
proc contents data=pretest out=salnom noprint;run;
data _null_;set salnom;if _n_=1 then put //;put name @@;run;
data pretest;merge &archivo(keep=&depen) pretest;run;
%mend; 

/*******************************************************************
/* MACRO VALIDACIÓN CRUZADA PARA REGRESIÓN NORMAL CON 
LA VARIABLE DEPENDIENTE TRANSFORMADA LOGARÍTMICAENTE

%macro cruzadabis(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=);

archivo=archivo de datos
vardepen=nombre de la variable dependiente 
conti=variables independientes continuas
categor=variables independientes categóricas
ngrupos=número de grupos a dividir por validación cruzada
sinicio=semilla de inicio
sfinal=semilla final

La macro obtiene la suma y media de errores al cuadrado por CV para cada semilla.
La variable que se indica como dependiente es la variable dependiente transformada logarítmicamente

La información está contenida en el archivo final

Se puede poner antes de ejecuciones largas la sentencia

options nonotes;

para no llenar la ventana log y que no nos pida borrarla

Para volver a ver comentarios-errores en log:

options notes;
*************************************************************************/

%macro cruzadabis(archivo=,vardepen=,listconti=,listclass=,ngrupos=,sinicio=,sfinal=);
data final;run;
/* Bucle semillas */
%do semilla=&sinicio %to &sfinal;
	data dos;set &archivo;u=ranuni(&semilla);
	proc sort data=dos;by u;run;
	data dos;
	retain grupo 1;
	set dos nobs=nume;
	if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
	run;
	data fantasma;run;
	%do exclu=1 %to &ngrupos;
		data tres;set dos;if grupo ne &exclu then vardep=&vardepen;
		proc glm data=tres noprint;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
		%if &listclass ne %then %do;class &listclass;model vardep=&listconti &listclass;%end;
		%else %do;model vardep=&listconti;%end;
		output out=sal p=predi;run;
		data sal;set sal;resi2=(exp(&vardepen)-exp(predi))**2;if grupo=&exclu then output;run;
		data fantasma;set fantasma sal;run;
	%end;
	proc means data=fantasma sum noprint;var resi2;
	output out=sumaresi sum=suma mean=media;
	run;
	data sumaresi;set sumaresi;semilla=&semilla;
	data final (keep=suma media semilla);set final sumaresi;if suma=. then delete;run;
%end;
proc print data=final;run;
%mend;


/*******************************************************************
/* MACRO VALIDACIÓN CRUZADA PARA REGRESIÓN NORMAL 
CON CORRECCIÓN DE VARIANZA Y SPAGHETTI OPCIONAL

%macro cruzadacorr(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,spaghetti=0);

archivo=archivo de datos
vardepen=nombre de la variable dependiente 
conti=variables independientes continuas
categor=variables independientes categóricas
ngrupos=número de grupos a dividir por validación cruzada
sinicio=semilla de inicio
sfinal=semilla final

spaguetti=guardar datos para gráfico spaghetti 
(solo cuando se pide una sola semilla,sinicio=sfinal)


SALIDA

La macro obtiene la suma y media de errores al cuadrado por CV para cada semilla.
Esta información está contenida en el archivo final y si se ha pedido spaghetti, 
en el archivo unitod.

(DE CARA A LA COMPARACIÓN GRÁFICA DE MODELOS HAY DOS MEDIDAS CON 
MISMA MEDIA Y DIFERENTE VARIANZA)

Archivo final
***************
semilla=semilla de aleatorización

media=media del error en la predicción; su varianza representa lo que varía la media de las predicciones
al considerar un archivo del tamaño del archivo original.

mediacorr=media del error en la predicción; su varianza representa lo que varía el error de predecir
un individuo a otro.

NOTA

Se puede poner antes de ejecuciones largas la sentencia
options nonotes;
para no llenar la ventana log y que no nos pida borrarla
Para volver a ver comentarios-errores en log:
options notes;
*************************************************************************/

%macro cruzadacorr(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,spaghetti=0,porcenpasta=0);
data final;run;
data unotod;run;
/* Bucle semillas */
%do semilla=&sinicio %to &sfinal;
	data dos(drop=dife);set &archivo nobs=nume;u=ranuni(&semilla);id=_n_;
	    if _n_=1 then do;
		call symput('nume',left(nume));
        dife=&sfinal-&sinicio;
		call symput('dife',left(dife));
		end;
    run;
	proc sort data=dos;by u;run;
	data dos;
	retain grupo 1;
	set dos nobs=nume;
	if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
	run;
	data fantasma;run;
	%do exclu=1 %to &ngrupos;
		data tres;set dos;if grupo ne &exclu then vardep=&vardepen;
		proc glm data=tres noprint;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
		%if &categor ne %then %do;class &categor;model vardep=&conti &categor;%end;
		%else %do;model vardep=&conti;%end;
		output out=sal p=predi;run;
		data sal;set sal;resi2=(&vardepen-predi)**2;if grupo=&exclu then output;run;
		data fantasma;set fantasma sal;run;
	%end;
	proc means data=fantasma sum noprint;var resi2;
	output out=sumaresi sum=suma mean=media var=vari;
	run;
	data sumaresi;set sumaresi;semilla=&semilla;
	data final (keep=suma media semilla vari);set final sumaresi;if suma=. then delete;run;
	%if (&spaghetti=1 and &dife=0) %then %do;
	data fantasma;set fantasma;semilla=&semilla;run;
	data unotod;set unotod fantasma;run;
	%end;
%end;
/* corrección varianza */
proc means data=final noprint;var vari media;output out=salvari var=v1 v2 mean=m1 m2;run;
data final(drop=a b);set final;
if _n_=1 then set salvari;
a=(m1/(v2*(&nume)))**.5;
b=m2*(1-a);
mediacorr=a*media+b;
mediacorr=sqrt(&nume)*mediacorr+m2*(1-sqrt(&nume));
run;
%mend;



/* *****************************************************************************
MACRO INTERACTTODO
*****************************************************************************

%macro interacttodo(archivo=,vardep=,listclass=,listconti=,interac=1,directorio=c:);

La macro INTERACTTODO calcula un listado de interacciones entre: 

* variables categóricas hasta orden 2
* variables continuas y categóricas (hasta orden 2)

Y además presenta un listado de las variables e interacciones por orden de pvalor
consideradas individualmente en un proc GLM.


archivo=
depen=variable dependiente
listclass=lista de variables de clase
listconti=lista de variables continuas
interac= 1 si se quieren interacciones(puede tardar mucho dependiendo de la complejidad)
		(interac=0 si no se quieren interacciones)
directorio= poner el directorio para archivos temporales basura

********
SALIDA
********

EL ARCHIVO CONSTRUIDO POR LA MACRO SE LLAMA UNION. CONTIENE LOS EFECTOS ORDENADOS 
POR ORDEN ASCENDENTE DE AIC (CUANTO MÁS PEQUEÑO MEJOR). 
TAMBIÉN SE PUEDE REORDENAR POR ORDEN DESCENDENTE DEL VALOR DEL ESTADÍSTICO F (CUANTO MAYOR MEJOR)
O POR PVALOR DEL CONTRASTE (MÁS PEQUEÑO MEJOR).

UNA VEZ EJECUTADA LA MACRO SE PUEDE OBTENER UN LISTADO DE LOS EFECTOS
EN EL LOG POR ORDEN DE MEJOR AIC A PEOR, CON:

data _null_;set union;put variable @@;run;

******************************************************************************

NOTAS Y TRUCOS PARA SU APROVECHAMIENTO

1) ANTE ARCHIVOS CON MUCHAS VARIABLES CATEGÓRICAS SE PUEDE EJECUTAR POR PARTES,
POR EJEMPLO:
a)SOLO CONTINUAS
b)SOLO CATEGÓRICAS, CON O SIN INTERACCIONES
c)ELEGIR LAS K MEJORES CATEGÓRICAS y/o CONTINUAS Y VOLVER A EJECUTAR CON INTERACCIONES

2) EN GENERAL ANTE MUCHAS VARIABLES CATEGÓRICAS Y VARIABLES CATEGÓRICAS
CON MUCHAS CATEGORÍAS ES MEJOR REFINAR LOS DATOS UTILIZANDO LA MACRO
NOMBRESMOD ANTES. PERO PARA ELLO SE NECESITA A MENUDO UNA PRESELECCIÓN
CON EL APARTADO b ANTERIOR

3) EL ORDEN OBTENIDO NO ES DETERMINANTE PARA EL MODELO (SERÁ NECESARIO UTILIZAR
TÉCNICAS TIPO STEPWISE TAMBIÉN) PERO SÍ PARA UNA PRESELECCIÓN Y RECHAZO DE EFECTOS
QUE NO SIRVEN.

4) PUEDE PROBARSE ANTES CON AGRUPARCATEGORIAS

5) EL SIGUIENTE PROGRAMA ES ÚTIL PARA OBTENER UN LISTADO PREVIO
DE LAS VARIABLES EN UN ARCHIVO Y PEGARLO ANTES DE PROCEDER
A LA MACRO (HAY QUE TENER EN CUENTA QUE MUCHAS VECES 
HAY VARIABLES CATEGÓRICAS QUE ESTÁN EN EL ARCHIVO BASE 
CODIFICADAS COMO NUMÉRICAS, EN ESTE CASO NO VALE, HAY QUE SABER DEFINIRLAS DESPUÉS 
EN LA LISTCLASS)

proc contents data=uno out=nombres;
run;
proc sort data=nombres;by type;
data _null_;
set nombres;by type;
if first.type=1 and type=1 then put  'VARIABLES CONTINUAS';
if first.type=1 and type=2 then put // 'VARIABLES CATEGÓRICAS';
put name @@;
run;

*/

%macro interacttodo(archivo=,vardep=,listclass=,listconti=,interac=1,directorio=c:);
proc printto print="&directorio\kaka.txt";run;
data _null_;file "&directorio\inteconti.txt";put ' ';file "&directorio\intecategor.txt";put ' ';run;

data _null_;
length clase conti con cruce1 $ 32000 cruce2 $ 32000;
clase="&listclass";
conti="&listconti";
  ncate= 1;
  do while (scan(clase, ncate) ^= '');
    ncate+1;
  end;
  ncate+(-1);
  put ncate=;
  nconti= 1;
  do while (scan(conti, nconti) ^= '');
    nconti+1;
  end;
  nconti+(-1);
  put nconti=;

call symput('ncate',left(ncate));
call symput('nconti',left(nconti));

%if &interac=1 %then %do;
cruce2=' ';
do i=1 to ncate;
	do j=1 to nconti;
   	ca=scan(clase,i);
		con=scan(conti,j);
		cruce1=cats(ca,'*',con);
		file "&directorio\inteconti.txt" mod;
		put cruce1;
	end;
end;

cruce2=' ';
do i=1 to ncate-1;
	do j=i+1 to ncate;
   	ca=scan(clase,i);
		con=scan(clase,j);
		if i ne j then cruce1=cats(ca,'*',con);else cruce1=' ';
		file "&directorio\intecategor.txt" mod;
		put cruce1;
	end;
end;
run;
%end;
data union;run;

/* variables de clase solitas */
%if &listclass ne %then %do i=1 %to &ncate;
data _null_;cosa="&listclass";va=scanq(cosa,&i);
call symput ('vari',va);
run;

ods output FitStatistics=ajuste anova=tanova;
proc glmselect data=&archivo ;
class &vari;
model &vardep=&vari /selection=none;
run;

proc print data=tanova;run;

data a;set ajuste (where=(Label1='AIC'));AIC=cvalue1;keep AIC;run;
data b(keep=Fvalue probf);set tanova;if _n_=1 then output;stop;run;
data c;length variable $ 1000;merge a b;variable="&vari";run;
data union;set union c;run;

%end;

/* interacciones de variables de clase */

%if &interac=1 %then %do;

%if &ncate>1 %then %do;

data pr234;
length vari $ 1000;
infile "&directorio\intecategor.txt";
input vari;
run;
data _null_;set pr234 nobs=nume;ko=nume;
call symput('nintecat',left(ko));stop;
run;

%if &listclass ne %then %do i=1 %to &nintecat;
data _null_;ko=&i;
set pr234 point=ko;
var1=scan(vari,1);
var2=scan(vari,2);
lista1=compbl(var1||'  '||var2);
call symput('lista1',left(lista1));
call symput('vari',left(vari));
stop;
run;

ods output FitStatistics=ajuste anova=tanova;
proc glmselect data=&archivo ;
class &lista1;
model &vardep=&vari / selection=none;
run;

data a;set ajuste (where=(Label1='AIC'));
AIC=cvalue1;keep AIC;
data b(keep=Fvalue probf);set tanova;if _n_=1 then output;stop;run;
data c;length variable $ 1000;merge a b;variable="&vari";run;
data union;set union c;run;


%end;
data _null_;if _n_=1 then put 'LISTA CLASE E INTERACCIONES';set union;put variable @@;run;
%end;

%end;

/* variables continuas solitas */
%if &listconti ne %then %do i=1 %to &nconti;
data _null_;cosa="&listconti";va=scanq(cosa,&i);
call symput ('vari',va);
run;

ods output FitStatistics=ajuste anova=tanova;
proc glmselect data=&archivo ;
model &vardep=&vari /selection=none;
run;

data a;set ajuste (where=(Label1='AIC'));AIC=cvalue1;keep AIC;run;
data b(keep=Fvalue probf);set tanova;if _n_=1 then output;stop;run;
data c;length variable $ 1000;merge a b;variable="&vari";run;
data union;set union c;run;
%end;

/* interacciones de variables de clase con variables continuas */
%if &interac=1 %then %do;
data pr235;
length vari $ 1000;
infile "&directorio\inteconti.txt";
input vari;
run;

data _null_;set pr235 nobs=nume;ko=nume;
call symput('ninteconti',left(ko));stop;
run;

%if (&listclass ne) and (&listconti ne) %then %do i=1 %to &ninteconti;
data _null_;ko=&i;
set pr235 point=ko;
var1=scan(vari,1);
var2=scan(vari,2);
call symput('lista1con',left(var1));
call symput('varicon',left(vari));
stop;
run;

ods output FitStatistics=ajuste anova=tanova;
proc glmselect data=&archivo ;
class &lista1con;
model &vardep=&varicon / selection=none;
run;

data a;set ajuste (where=(Label1='AIC'));AIC=cvalue1;keep AIC;
data b(keep=Fvalue probf);set tanova;if _n_=1 then output;stop;run;
data c;length variable $ 1000;merge a b;variable="&varicon";run;
data union;set union c;run;
%end;
%end;
proc printto;run;
data union;set union;if _n_=1 then delete;run;
proc sort data=union;by AIC;
proc print data=union;run;
data _null_;set union;put variable @@;run;
%mend;
