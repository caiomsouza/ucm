
libname semma 'C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16';

data uno; set semma.saheart; run;

/* EJEMPLO SENCILLO */

%calcular(archivo=uno,vardepen=chd,conti=tobacco ,categor=famhist,corte=0.5 ,porcaptura=0.3); 


/* EJEMPLO CON DATOS TEST

data a;set uno;if _n_<=300;data b;set uno;if _n_>300;run;

%calcular(archivo=a,test=1,archivotest=b,vardepen=chd,conti=tobacco ,categor=famhist,corte=0.5 ,porcaptura=0.3); */

