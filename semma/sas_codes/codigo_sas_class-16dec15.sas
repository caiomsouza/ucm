
libname semma 'C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16';

data uno; set semma.saheart; run;

/* EJEMPLO SENCILLO */

/* chd = variable objetivo */

%calcular(archivo=uno,vardepen=chd,
conti=tobacco famhist ldl age,
categor=famhist,corte=0.35 ,porcaptura=0.3); 


/* EJEMPLO CON DATOS TEST */

data a;set uno;if _n_<=300;data b;set uno;if _n_>300;run;

%calcular(archivo=a,test=1,archivotest=b,vardepen=chd,conti=tobacco famhist ldl age,categor=famhist,corte=0.35 ,porcaptura=0.3);


/*EJEMPLO SOBRE DATOS TOTALES */
%corteoptimo(archivo=uno,vardepen=chd,conti=tobacco famhist ldl age ,categor=famhist,corteinicio=0.2,cortefin=0.8,incremento=0.05, porcaptura=0.3,directorio=c:); 


/*EJEMPLO SOBRE ARCHIVOS TEST */
%corteoptimo(archivo=a,test=1,archivotest=b,vardepen=chd,conti=tobacco famhist ldl age , categor=famhist,corteinicio=0.2,cortefin=0.8,incremento=0.05,porcaptura=0.3,directorio=c:);



