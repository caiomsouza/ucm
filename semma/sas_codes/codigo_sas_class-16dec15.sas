
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
%corteoptimo(archivo=uno,vardepen=chd,conti=tobacco famhist ldl age ,categor=famhist,corteinicio=0.2,cortefin=0.8,incremento=0.05, porcaptura=0.3,directorio=C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16\output-macros); 


/*EJEMPLO SOBRE ARCHIVOS TEST */
%corteoptimo(archivo=a,test=1,archivotest=b,vardepen=chd,conti=tobacco famhist ldl age , categor=famhist,corteinicio=0.2,cortefin=0.8,incremento=0.05,porcaptura=0.3,directorio=C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16\output-macros);

/* EJEMPLO */
%cruzadalogistica(archivo=uno,vardepen=chd,conti=tobacco tobacco*famhist,categor=famhist,ngrupos=4,sinicio=12345,sfinal=12347, objetivos=capturados tasafallos sensi especif Youden AUC,corte=0.5,porcaptura=0.2,directorio=C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16\output-macros);

/* proc print data=final;run; */


%cruzadalogistica(archivo=uno,vardepen=chd,conti=tobacco tobacco*famhist,categor=famhist,ngrupos=4,sinicio=12345,sfinal=12347, objetivos=capturados tasafallos sensi especif Youden AUC,corte=0.5,porcaptura=0.2,directorio=C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16\output-macros);

data final1;set final;modelo=1;

%cruzadalogistica(archivo=uno,vardepen=chd,conti=tobacco famhist ldl age,categor=famhist,ngrupos=4,sinicio=12345,sfinal=12347, objetivos=capturados tasafallos sensi especif Youden AUC,corte=0.5,porcaptura=0.2,directorio=C:\Users\win\Documents\Bitbucket\ucm\TECNICAS_Y_METODOLOGIA_DE_LA_MINERIA_DE_DATOS_SEMMA\Tema 6 logistica 2015-16\output-macros);

data final2;set final;modelo=2;

data union; set final1 final2;
proc boxplot data=union;
plot tasafallos*modelo;
run;
proc boxplot data=union;
plot AUC*modelo;
run;



