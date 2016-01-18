
/*******************************************************************
/* MACRO VALIDACIÓN CRUZADA PARA REGRESIÓN NORMAL 
CON CORRECCIÓN DE VARIANZA Y SPAGHETTI OPCIONAL

%macro cruzada(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,spaghetti=0);

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

%macro cruzada(archivo=,vardepen=,conti=,categor=,ngrupos=,sinicio=,sfinal=,spaghetti=0,porcenpasta=0);
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


/* EJEMPLO */

data uno;
do i=1 to 10000;
	x1=rannor(i)*10+5;
	x2=rannor(i)*10+5;
	x3=rannor(i)*10+5;
	x4=rannor(i)*10+5;
	x5=ranbin(i,1,0.5);
	epsilon=rannor(i)*6000;
	z1=x1**2;
	z2=x2**3;
	z3=x2**2;
	y=2*log(abs(z2))+3*z3+100*x1+100*x3+100*x4+epsilon;
	y=y/10000;
output;
end;
run;


/* EJEMPLO PARA BOXPLOT: VARIAS SEMILLAS */

options nonotes;
%cruzada(archivo=uno,vardepen=y,
conti= x1 x3 x4 z3 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13355,spaghetti=0);
data final1;set final;modelo=1;run;

%cruzada(archivo=uno,vardepen=y,
conti= z3 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13355,spaghetti=0);
data final2;set final;modelo=2;run;

%cruzada(archivo=uno,vardepen=y,
conti= x1 x3 x4 z3 z2 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13355,spaghetti=0);
data final3;set final;modelo=3;run;

options notes;

data union;set final1 final2 final3;run;



axis1 order=(0 to 1.5 by 0.10);
title 'ERROR DE PREDICCIÓN. LA VARIANZA REPRESENTA LO QUE VARÍA EL ERROR PROMEDIO EN UN ARCHIVO DE TAMAÑO N';
title2 'EJES CON MISMA ESCALA';
proc boxplot data=union;plot media*modelo /vaxis=axis1;run;
title 'ERROR DE PREDICCIÓN. LA VARIANZA REPRESENTA 
LO QUE VARÍA EL ERROR INDIVIDUAL DE UNA OBS. A OTRA';
title2 'EJES CON MISMA ESCALA';
proc boxplot data=union;plot mediacorr*modelo /vaxis=axis1;run;

title 'ERROR DE PREDICCIÓN. LA VARIANZA REPRESENTA LO QUE VARÍA EL ERROR PROMEDIO EN UN ARCHIVO DE TAMAÑO N';
title2 'EJES CON ESCALA PROPIA';
proc boxplot data=union;plot media*modelo ;run;
title 'ERROR DE PREDICCIÓN. LA VARIANZA REPRESENTA 
LO QUE VARÍA EL ERROR INDIVIDUAL DE UNA OBS. A OTRA';
title2 'EJES CON ESCALA PROPIA';
proc boxplot data=union;plot mediacorr*modelo ;run;


/* EJEMPLO PARA GRAFICO SPAGHETTI: UNA SEMILLA */

%cruzada(archivo=uno,vardepen=y,
conti= x1 x3 x4 z3 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13345,spaghetti=1);
data unotod1;set unotod;modelo=1;run;

%cruzada(archivo=uno,vardepen=y,
conti= x5 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13345,spaghetti=1);
data unotod2;set unotod;modelo=2;run;

%cruzada(archivo=uno,vardepen=y,
conti= x1 x3 x4 z3 z2 ,
categor=,
ngrupos=4,sinicio=13345,sfinal=13345,spaghetti=1);
data unotod3;set unotod;modelo=3;run;


data unitodos;set unotod1 unotod2 unotod3;run;

proc sort data=unitodos;by id;run;


/* ESTO ES OPCIONAL, SE TOMA UNA MUESTRA DE LAS OBSERVACIONES PARA QUE TARDE MENOS;
proc freq data=unotod;tables id /out=salf;run;
proc surveyselect data=salf out=salfm method=srs sampsize=200 seed=12346;run;
proc sort data=salfm;by id;
data muestra;merge salfm(in=ins) unitodos;by id;if ins then output;run;

*/ 
title ' ';
symbol1 i=join v=circle c=black repeat=60 ;/* REPEAT CORRESPONDE AL NUMERO DE OBSERVACIONES DE Y QUE SE PRESENTA; TARDA MENOS SI SE PONEN MENOS*/
proc gplot data=unitodos;plot resi2*modelo=id /nolegend;run;

symbol1 i=join v=circle c=black repeat=200 ;/* REPEAT CORRESPONDE AL NUMERO DE OBSERVACIONES DE Y QUE SE PRESENTA; TARDA MENOS SI SE PONEN MENOS*/
proc gplot data=muestra;plot resi2*modelo=id /nolegend;run;
proc contents data=unitodos;Run;
proc print data=unitodos;Run;
