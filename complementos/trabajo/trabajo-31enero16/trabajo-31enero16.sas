
/*
El archivo \DatosPaises.xlsx" (que podeis descargar del campus) contie-
ne informacion sobre 7 variables socioeconomicas de 133 paises. Seleccionar
aleatoriamente una muestra de 100 paises con el procedimiento
surveyselect
de la siguiente forma:

*/



proc surveyselect data=paises method=srs n=100 out=sample_paises;
run;

/*

Para la muestra obtenida, realizar un Analisis Cluster incluyendo SOLO
las variables demograficas (Pobl Natalidad EsperanzaVida Mortalidad
), que debe incluir como minimo:

*/


