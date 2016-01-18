
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


%renombrar(archivo=ames,listaclass=Alley Bldg_Type BsmtFin_Type_1 BsmtFin_Type_2,
listaconti=Bedroom_AbvGr BsmtFin_SF_1 BsmtFin_SF_2 Bsmt_Full_Bath Bsmt_Half_Bath 
,prefijoclass=CLASSNUEVA,prefijoconti=CONT);

proc contents data=ames2;run;
proc print data=diccionario;run;
