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

/* LA MACRO RANDOMSELECTlog REALIZA UN MÉTODO STEPWISE 
REPETIDAS VECES CON DIFERENTES ARCHIVOS TRAIN.

LA SALIDA INCLUYE UNA TABLA DE FRECUENCIAS 
DE LOS MODELOS QUE APARECEN SELECCIONADOS EN LOS DIFERENTES 
ARCHIVOS TRAIN

LOS MODELOS QUE SALEN MÁS VECES SON POSIBLES CANDIDATOS A PROBAR 
CON VALIDACIÓN CRUZADA

listclass=lista de variables de clase ATENCIÓN, EN ESTA LISTA SOLO PONER VARIABLES 
			QUE SE VAYAN A USAR (BIEN COMO EFECTOS PRINCIPALES O INTERACCIONES)
vardepen=variable dependiente
modelo=modelo
sinicio=semilla inicio
sfinal=semilla final
fracciontrain=fracción de datos train
directorio=directorio para archivos basura

EL ARCHIVO QUE CONTIENE LOS EFECTOS SE LLAMA SALEFEC. 
SE INCLUYE EN EL LOG EL LISTADO PARA PODER COPIAR Y PEGAR 
(A VECES LA VENTANA OUTPUT ESTÁ LIMITADA)

*/

%macro randomselectlog(data=,listclass=,vardepen=,modelo=,sinicio=,sfinal=,fracciontrain=,directorio=);
options nocenter linesize=256;
proc printto print="&directorio\kk.txt";run;
data;file "&directorio\cosa2.txt" ;run;
%do semilla=&sinicio %to &sfinal;
proc surveyselect data=&data rate=&fracciontrain out=sal1234 seed=&semilla;run;

%if &listclass ne %then %do;
ods output type3=parametros;
proc logistic data=sal1234;
	class &listclass;
    model &vardepen= &modelo/ selection=stepwise;
run;   
data parametros;length effect $20. modelo $ 20000;retain modelo " ";set parametros end=fin;effect=cat(' ',effect);
if _n_ ne 1 then modelo=catt(modelo,' ',effect);if fin then do;variable=modelo;output;end;
run;
%end;
%else %do;
ods output  Logistic.ParameterEstimates=parametros;
proc logistic data=sal1234;
	  model &vardepen= &modelo/ selection=stepwise;
run;   
%end;
ods graphics off;   
ods html close;   
data;file "&directorio\cosa2.txt" mod;set parametros;
%if &listclass ne %then %do; put variable @@;%end;
%else %do; if _n_ ne 1 then put variable @@;%end;
run;
%end;
proc printto ;run;
data todos;
infile "&directorio\cosa2.txt";
length efecto $ 400;
input efecto @@;
if efecto ne 'Intercept' then output;
run;
proc freq data=todos;tables efecto /out=sal;run;
proc sort data=sal;by descending count;
proc print data=sal;run;

data todos;
infile "&directorio\cosa2.txt";
length efecto $ 200;
input efecto $ &&;
run;
proc freq data=todos;tables efecto /out=sal;run;
proc sort data=sal;by descending count;
proc print data=sal;run;
data;set sal;put efecto;run;
%mend;

/* Ejemplos 

%randomselectlog(data=german,listclass=foreign marital telephon depends history purpose other housing job property ,
vardepen=bad,
modelo=age amount checking coapp duration employed existcr installp resident savings 
foreign marital telephon depends history purpose other housing job property ,
sinicio=12345,sfinal=12380,fracciontrain=0.8);


%randomselectlog(data=german,listclass=,
vardepen=bad,
modelo=age amount checking coapp duration employed existcr installp resident savings,
sinicio=12345,sfinal=12380,fracciontrain=0.8);


%randomselectlog(data=german,listclass=marital history,
vardepen=bad,
modelo=age amount checking coapp duration employed marital*history existcr installp resident savings,
sinicio=12345,sfinal=12380,fracciontrain=0.8);

*/


/* *****************************************************************************
MACRO INTERACTTODOLOG
*****************************************************************************

%macro interacttodolog(archivo=,vardep=,listclass=,listconti=,interac=1,directorio=c:);

La macro INTERACTTODOLOG calcula un listado de interacciones entre: 

* variables categóricas hasta orden 2
* variables continuas y categóricas (hasta orden 2)

Y además presenta un listado de las variables e interacciones por orden de pvalor
consideradas individualmente en un proc LOGISTIC.

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

*/

%macro interacttodolog(archivo=,vardep=,listclass=,listconti=,interac=1,directorio=c:);
proc printto print="&directorio\kaka.txt";run;
data _null_;
file "&directorio\inteconti.txt";
put ' ';
file "&directorio\intecategor.txt";
put ' ';
run;

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

ods output Globaltests=global association=asoc;
ods output Fitstatistics=Fitstatistics;
proc logistic data=&archivo;
class &vari;
model &vardep=&vari;
run;

data c (keep=variable percentconcord AIC Chisq ProbChisq);length variable $ 1000;
set global;set asoc;set fitstatistics;
AIC=InterceptandCovariates;percentconcord=cvalue1;
variable="&vari";
if _n_=1 then output;
run;

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

ods output Globaltests=global association=asoc;
ods output Fitstatistics=Fitstatistics;
proc logistic data=&archivo;
class &lista1;
model &vardep=&vari;
run;

data c (keep=variable percentconcord AIC Chisq ProbChisq);length variable $ 1000;
set global;set asoc;set fitstatistics;
AIC=InterceptandCovariates;percentconcord=cvalue1;
variable="&vari";
if _n_=1 then output;
run;

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

ods output Globaltests=global association=asoc;
ods output Fitstatistics=Fitstatistics;
proc logistic data=&archivo;
model &vardep=&vari;
run;

data c (keep=variable percentconcord AIC Chisq ProbChisq);length variable $ 1000;
set global;set asoc;set fitstatistics;
AIC=InterceptandCovariates;percentconcord=cvalue1;
variable="&vari";
if _n_=1 then output;
run;

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

ods output Globaltests=global association=asoc;
ods output Fitstatistics=Fitstatistics;
proc logistic data=&archivo;
class &lista1con;
model &vardep=&varicon;
run;

data c (keep=variable percentconcord AIC Chisq ProbChisq);length variable $ 1000;
set global;set asoc;set fitstatistics;
AIC=InterceptandCovariates;percentconcord=cvalue1;
variable="&varicon";
if _n_=1 then output;
run;

data union;set union c;run;

%end;
%end;
proc printto;run;
data union;set union;if _n_=1 then delete;run;
proc sort data=union;by AIC;
proc print data=union;run;
data _null_;set union;put variable @@;run;
%mend;



/* MACRO CRUZADA CON CORTE PARA UN MODELO DADO

SE TRATA DE CICLAR LA MACRO CRUZADA LOGISTICA PARA ESTUDIAR EL PUNTO DE CORTE ÓPTIMO SEGÚN QUÉ CRITERIO 

*******************************************************************
SE REQUIERE HABER COMPILADO LA MACROS CRUZADALOGISTICA 
*******************************************************************

***********
SALIDA
***********
El archivo llamado final

*/


%macro cruzadacorte(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,objetivos=,
corteinicio=,cortefin=,incremento=,porcaptura=0,directorio=c:);
data _null_;
co1=&corteinicio*1000;
co2=&cortefin*1000;
incre=&incremento*1000;
call symput('co1',left(co1));
call symput('co2',left(co2));
call symput('incre',left(incre));
run;
data todos;run;
proc printto print="&directorio\outp.txt" log="&directorio\log.txt";run;/*SE PUEDE QUITAR EL PROC PRINTTO POR SI ACASO HAY PROBLEMAS*/
%do icor=&co1 %to &co2 %by &incre;
data _null_;cor=&icor/1000;call symput('cor',left(cor));run;
%cruzadalogistica(archivo=&archivo,vardepen=&vardepen,conti=&conti,categor=&categor,
ngrupos=&ngrupos,sinicio=&sinicio,sfinal=&sfinal,objetivos=&objetivos,corte=&cor,porcaptura=&porcaptura,directorio=&directorio);
 data final&icor;set final;corte=&cor;run;
%end;
data union;set %do icor=&co1 %to &co2 %by &incre; final&icor %end;;;;
proc print data=union;run;
proc boxplot data=union;plot (&objetivos)*corte;run;
%mend;

/* EJEMPLO 

%cruzadacorte
(archivo=uno,
vardepen=chd,
conti=tobacco tobacco*famhist,
categor=famhist,
ngrupos=4,sinicio=12345,sfinal=12345,
objetivos=capturados tasafallos Youden,
corteinicio=0.3,cortefin=0.7,incremento=0.10,
porcaptura=0.2,directorio=c:);

*/

/* MACRO CORTEOPTIMO

SE TRATA DE CICLAR LA MACRO CALCULAR PARA ESTUDIAR EL PUNTO DE CORTE ÓPTIMO SEGÚN QUÉ CRITERIO 

HAY VARIAS OPCIONES:

1) CON LOS DATOS TOTALES 
2) CON DATOS TEST
3) EN VALIDACIÓN CRUZADA (AUNQUE ESTO MEJOR ESTUDIARLO GRÁFICAMENTE)

*******************************************************************
SE REQUIERE HABER COMPILADO LA MACROS CALCULAR 
*******************************************************************

*/

%macro corteoptimo(archivo=,test=0,archivotest=,vardepen=,conti=,categor=,corteinicio=,cortefin=,incremento=,porcaptura=0,directorio=);
data _null_;
co1=&corteinicio*1000;
co2=&cortefin*1000;
incre=&incremento*1000;
call symput('co1',left(co1));
call symput('co2',left(co2));
call symput('incre',left(incre));
run;
data todos;run;
proc printto print="&directorio\outp.txt" log="&directorio\log.txt";run;/*SE PUEDE QUITAR EL PROC PRINTTO POR SI ACASO HAY PROBLEMAS*/
%do i=&co1 %to &co2 %by &incre;
data _null_;cor=&i/1000;call symput('cor',left(cor));run;
%calcular(archivo=&archivo,test=&test,archivotest=&archivotest,vardepen=&vardepen,conti=&conti,categor=&categor,corte=&cor,porcaptura=&porcaptura);
data estadisticos;set estadisticos;corte=&cor;
data todos;set todos estadisticos;run;
%end;
proc printto;run;
data todos;set todos;if _n_=1 then delete;run;
proc print data=todos;
var corte tasaciertos AUC ncapturados capturados ntot sensi especif precision Youden F_M Mcc porcenFN porcenFP porcenVN porcenVP ;
run;
data tot (keep=max1-max13 cor1-cor13);
array x{13}
tasaciertos AUC capturados sensi especif precision Youden F_M Mcc porcenFN porcenFP porcenVN porcenVP ;
array max{13};
array cor{13};
retain max1-max13 0;
retain cor1-cor13 0;
set todos nobs=nume;
do i=1 to 13;
 if x{i}>max{i} then do;max{i}=x{i};cor{i}=corte;end;
end;
if _n_=nume then output;
run;
proc transpose data=tot out=t1 prefix=ka;var max1-max13;run;
proc transpose data=tot out=t2 prefix=ko;var cor1-cor13;run;
proc transpose data=todos out=t3 ;var tasaciertos AUC capturados sensi especif precision 
Youden F_M Mcc porcenFN porcenFP porcenVN porcenVP ;
data t3;set t3;estadistico=_name_;keep estadistico;run;
data t1;set t1;maximo=ka1;keep maximo;run;
data t2;set t2;corte=ko1;keep corte;run;
data fin;merge t1 t2 t3;if estadistico='AUC' then corte=.;run;
proc print data=fin;var estadistico maximo corte;run;
%mend;

/*EJEMPLO SOBRE DATOS TOTALES

%corteoptimo(archivo=uno,
vardepen=chd,
conti=tobacco ,
categor=famhist,
corteinicio=0.2,cortefin=0.8,incremento=0.05,
porcaptura=0.3,directorio=c:);
*/

/*EJEMPLO SOBRE ARCHIVOS TEST

%corteoptimo(archivo=a,test=1,archivotest=b,
vardepen=chd,
conti=tobacco ,
categor=famhist,
corteinicio=0.2,cortefin=0.8,incremento=0.05,
porcaptura=0.3,directorio=c:);

*/
/* VALIDACIÓN CRUZADA LOGÍSTICA PARA VARIABLES DEPENDIENTES BINARIAS 

*********************************************************************************
								PARÁMETROS
*********************************************************************************

BÁSICOS

archivo=		archivo de datos
vardepen=		variable dependiente binaria 
categor=		lista de variables independientes categóricas
conti=			TODO EL MODELO: lista de variables independientes continuas Y TODAS LAS INTERACCIONES Y CATEGORICAS
ngrupos=		número de grupos validación cruzada
sinicio=		semilla inicial para repetición
sfinal=			semilla final para repetición
objetivos (LISTA)=tasafallos sensi especif porcenVN porcenFN porcenVP porcenFP precision tasaciertos  Youden  AUC 
				 MCC F_M capturados
porcaptura=		0 si no se quiere calcular como objetivo la captura
				porcaptura si se quiere poner como objetivo el porcentaje de unos en los porcaptura% primeras observaciones
directorio= 	directorio para archivos basura
**************************************
SALIDA
**************************************
Archivo final . 
Las variables objetivo corresponden a la media de cada objetivo de la lista en todas las pruebas de validación cruzada
*/

%macro cruzadalogistica(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,objetivos=,corte=0.5,porcaptura=0,directorio=c:);
data final;run;
/* contar objetivos */
data _null_;length clase $ 300;
clase="&objetivos";
  nobje= 1;
  do while (scanq(clase, nobje) ^= '');
    nobje+1;
  end;
  nobje+(-1);
  call symput('nobje',left(nobje));
run;
proc printto print="&directorio\outp.txt" log="&directorio\log.txt";run;/*SE PUEDE QUITAR EL PROC PRINTTO POR SI ACASO HAY PROBLEMAS*/
/* Bucle semillas */
%do semilla=&sinicio %to &sfinal;
	data dos;set &archivo;u=ranuni(&semilla);
	proc sort data=dos;by u;run;
	data dos ;
	retain grupo 1;
	set dos nobs=nume;
	if _n_>grupo*nume/&ngrupos then grupo=grupo+1;
	run;
	data fantasma;run;
	%do exclu=1 %to &ngrupos;
		data tres;set dos;if grupo ne &exclu then vardep=&vardepen;
		ods output ROCAssociation=roca;
		proc logistic data=tres ;/*<<<<<******SE PUEDE QUITAR EL NOPRINT */
		%if (&categor ne) %then %do;class &categor;model vardep=&conti;%end;
		%else %do;model vardep=&conti;%end;
		output out=sal p=predi;roc;run;
		data sal2;set sal;pro=1-predi;if pro>&corte then pre11=1; else pre11=0;
		if grupo=&exclu then output;run;
		proc freq data=sal2;tables pre11*&vardepen/out=sal3;run;
		data estadisticos (drop=count percent pre11 &vardepen); 
		retain vp vn fp fn suma 0; 
		if _n_=1 then set roca; 
		set sal3 nobs=nume; 
		suma=suma+count; 
		if pre11=0 and &vardepen=0 then vn=count; 
		if pre11=0 and &vardepen=1 then fn=count; 
		if pre11=1 and &vardepen=0 then fp=count; 
		if pre11=1 and &vardepen=1 then vp=count; 
		if _n_=nume then do; 
		porcenVN=vn/suma; 
		porcenFN=FN/suma; 
		porcenVP=VP/suma; 
		porcenFP=FP/suma; 
		sensi=vp/(vp+fn); 
		especif=vn/(vn+fp); 
		tasafallos=1-(vp+vn)/suma; 
		tasaciertos=1-tasafallos; 
		precision=vp/(vp+fp); 
		F_M=2*Sensi*Precision/(Sensi+Precision); 
		Mcc=VP*VN-FP*FN;be=(VP+FP)*(VP+FN)*(VN+FP)*(VN+FN);be=sqrt(be);
		MCC=MCC/be;
		Youden=especif+sensi-1;
		AUC=Area;
		output; 
		end; 
		run; 

		%if &porcaptura ne 0 %then %do;
		proc sort data=sal2;by descending pre11;
		data sal4;retain suma1 0;set sal2 nobs=nume;
			if &vardepen=1 then suma1=suma1+1;
			if _n_=int(&porcaptura*nume) then do;ncapturados=suma1;capturados=suma1/_n_;ntot=_n_;output;
			stop;end;
		run;
		data estadisticos;set estadisticos;if _n_=1 then set sal4;run;
		%end;

data estadisticos;set estadisticos;
keep AUC F_M Mcc Youden ncapturados ntot capturados especif fn fp porcenFN porcenFP porcenVN porcenVP precision
sensi tasaciertos tasafallos vn vp;
run;	
	data fantasma;set fantasma estadisticos;run;
	%end;
	proc means data=fantasma sum noprint;var &objetivos;
	output out=sumaresi sum=suma mean=media1-media&nobje;
	run;
	data sumaresi;set sumaresi;semilla=&semilla;
	data final (keep=suma media1-media&nobje semilla);set final sumaresi;if suma=. then delete;run;
	/* renombrar objetivos para entender mejor */
%end;
	data _null_;
	file "&directorio\kk.txt";
	put 'data final;set final;array media{'"&nobje" '};';
	%do i=1 %to &nobje;
 	%let vari=%qscan(&objetivos,&i);
	put "&vari" '=media{'"&i"'};'; 
	%end;
	put 'drop suma media1-media'"&nobje"';output;run;';
	run;

	%include "&directorio\kk.txt";
	proc printto;run;
	proc print data=final;run;
%mend;

options mprint=0;

/* EJEMPLO 

%cruzadalogistica(archivo=uno,
vardepen=chd,
conti=tobacco tobacco*famhist,
categor=famhist,
ngrupos=4,sinicio=12345,sfinal=12347,
objetivos=capturados tasafallos sensi especif Youden AUC,
corte=0.5,porcaptura=0.2,directorio=c:);

*/




/* CALCULO DE ESTADÍSTICOS LOGÍSTICA PARA VARIABLES DEPENDIENTES BINARIAS 

*********************************************************************************
								PARÁMETROS
*********************************************************************************

BÁSICOS

archivo=		archivo de datos
test=1 			si hay archivo de datos test
archivotest		archivo de datos test si procede
vardepen=		variable dependiente binaria 
categor=		lista de variables independientes categóricas
conti=			TODO EL MODELO: lista de variables independientes continuas Y TODAS LAS INTERACCIONES Y TODAS LAS INTERACCIONES Y CATEGORICAS
objetivo=		tasafallos,sensi,especif,porcenVN,porcenFN,porcenVP,porcenFP,precision,tasaciertos, Youden, AUC,
				MCC,F_M,capturados
porcaptura=		0 si no se quiere calcular como objetivo la captura
				porcaptura si se quiere poner como objetivo el porcentaje de unos en los porcaptura% primeras observaciones
*/


%macro calcular(archivo=,test=0,archivotest=,vardepen=,conti=,categor=,corte=,porcaptura=0);
%if &test=1 %then %do;data union;set &archivo &archivotest(in=vie);vardep=&vardepen;if vie=1 then vardep=.;run;%end;
%else %do;data union;set &archivo;vardep=&vardepen;run;%end;

		ods output ROCAssociation=roca;

		proc logistic data=union;
		%if (&categor ne) %then %do;class &categor;model vardep=&conti &categor ;%end;
		%else %do;model vardep=&conti;%end;
		output out=sal p=predi;roc;run;
		data roca;set roca;if rocmodel='Model' then output;run;

		data sal2;set sal;pro=1-predi;if pro>&corte then pre11=1; else pre11=0;
		 output;run;

		%if &test=1 %then %do;proc freq data=sal2;tables pre11*&vardepen/out=sal3;
								where vardep=.;
								run;
								%end;
		%else %do;proc freq data=sal2;tables pre11*&vardepen/out=sal3;
								run;
								%end;
		data estadisticos (drop=count percent pre11 &vardepen);
		if _n_=1 then set roca; 
		retain vp vn fp fn suma 0; 
		set sal3 nobs=nume; 
		suma=suma+count; 
		if pre11=0 and &vardepen=0 then vn=count; 
		if pre11=0 and &vardepen=1 then fn=count; 
		if pre11=1 and &vardepen=0 then fp=count; 
		if pre11=1 and &vardepen=1 then vp=count; 
		if _n_=nume then do; 
		porcenVN=vn/suma; 
		porcenFN=FN/suma; 
		porcenVP=VP/suma; 
		porcenFP=FP/suma; 
		sensi=vp/(vp+fn); 
		especif=vn/(vn+fp); 
		tasafallos=1-(vp+vn)/suma; 
		tasaciertos=1-tasafallos; 
		precision=vp/(vp+fp); 
		F_M=2*Sensi*Precision/(Sensi+Precision);
		Mcc=VP*VN-FP*FN;be=(VP+FP)*(VP+FN)*(VN+FP)*(VN+FN);be=sqrt(be);
		MCC=MCC/be;
		Youden=especif+sensi-1;
		AUC=Area;
		output; 
		end; 
		run; 
		%if &test=1 %then %do;data sal2;set sal2;if vardep=.;run; %end;
		%if &porcaptura ne 0 %then %do;
		proc sort data=sal2;by descending pre11;
		data sal4;retain suma1 0;set sal2 nobs=nume;
			if &vardepen=1 then suma1=suma1+1;
			if _n_=int(&porcaptura*nume) then do;ncapturados=suma1;capturados=suma1/_n_;ntot=_n_;output;
			stop;end;
		run;
		data estadisticos;set estadisticos;if _n_=1 then set sal4;run;
		%end;
data estadisticos;set estadisticos;
keep AUC F_M Mcc Youden ncapturados ntot capturados especif fn fp porcenFN porcenFP porcenVN porcenVP precision
sensi tasaciertos tasafallos vn vp;
run;
proc print data=estadisticos;run;
%mend;

/* EJEMPLO SENCILLO

%calcular(archivo=uno,
vardepen=chd,
conti=tobacco ,
categor=famhist,
corte=0.5 ,porcaptura=0.3);

*/

/* EJEMPLO CON DATOS TEST

data a;set uno;if _n_<=300;
data b;set uno;if _n_>300;run;

%calcular(archivo=a,test=1,archivotest=b,
vardepen=chd,
conti=tobacco ,
categor=famhist,
corte=0.5 ,porcaptura=0.3); */











