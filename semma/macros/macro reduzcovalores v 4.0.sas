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

/*EJEMPLO REDUZCOVALORES */
OPTIONS NOTES;
%reduzcovalores(ARCHIVO=ames,listclass=Alley Bldg_Type BsmtFin_Type_1 BsmtFin_Type_2,directorio=c:); 

