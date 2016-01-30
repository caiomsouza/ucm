/* Ejemplo de Submission 

Supongamos que el modelo que consideramos mejor es con solo la variable tax

1) Se unen los datos train y test (en test la variable price es missing)
2) Se aplica el modelo de regresión sobre el archivo de unión
3) Nos quedamos en el archivo de predicciones con solo las observaciones de test
4) Creamos un archivo de texto con el formato requerido

*/


/* Carga los datos SAS en la libreria disco que estan en la carpeta */
libname discoc 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle';


data union_original; set discoc.preditrain discoc.testalumnos;run;


data union;set discoc.preditrain discoc.testalumnos;run;




proc standard data=union out=salida_standard mean=0 std=1; var age baths beds lot sqft tax;
run;

data union; set union; 
	logatax=log(tax);
	expotax=tax**2;
run; 


proc contents data=union;run;


%interacttodo(archivo=union_original,vardep=price,
listclass= ,listconti=beds baths sqft lot age tax,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);


/* output interacttodo

tax sqft baths beds age lot

*/

proc glmselect data=union_original;
	model price=tax sqft baths beds age lot /selection=stepwise;
	output out=salida p=predi;
run;






/* tentativa 1

proc glm data=union;
	model price=tax;
	output out=salida p=predi;
run;

*/


/* tentativa 2

proc glmselect data=union;
	model price=tax baths sqft lot beds  
    /selection=stepwise;
run;


proc glm data=union;
	model price=tax sqft lot beds;
	output out=salida p=predi;
run;

*/


/* tentativa 3

proc glmselect data=union;
	model price=tax baths sqft lot beds age  
    /selection=stepwise;
run;


proc glm data=union;
	model price=tax sqft lot beds age;
	output out=salida p=predi;
run;

*/

/* tentativa 4 */

proc glmselect data=union;
	model price=tax baths sqft lot beds age baths*sqft  
    /selection=stepwise;
run;


proc glm data=union;
	model price=tax sqft lot beds age baths*sqft;
	output out=salida p=predi;
run;


proc standard data=union out=salida_standard mean=0 std=1; var age baths beds expotax logatax lot sqft tax;
run;


proc glm data=salida_standard;
	model price=tax sqft lot beds age baths*sqft;
	output out=salida p=predi;
run;


/* Root MSE = 322073.3 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax;
	output out=salida p=predi;
run;

/* Root MSE = 277083.1 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax sqft*baths*beds;
	output out=salida p=predi;
run;


/* Root MSE = 276136.2 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax sqft*baths*beds baths*beds;
	output out=salida p=predi;
run;

/* Root MSE = 275788.7 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 270471.2 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 266037.5 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 262561.7 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 261627.0 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;


/* Root MSE = 258763.9 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 192165.0 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 187934.9 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;


/* Root MSE = 220054.5 */
proc glm data=salida_standard;
	model price=age baths beds lot sqft tax beds*lot*sqft*tax age*baths*beds*lot*sqft*tax lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds;
	output out=salida p=predi;
run;


/* Root MSE = 273431.8 */
proc glm data=salida_standard;
	model price=lot sqft tax tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;



proc logistic data=salida descending;
model price=age baths beds expotax logatax lot sqft tax /selection=stepwise;
output out=salida predprobs=(I);
run;
proc print data=salida;run;


proc logistic data=salida descending;
model price=age baths beds expotax logatax lot sqft tax /selection=stepwise;
output out=salida predprobs=(I);
run;



data union; set union; 
	logatax=log(tax);
	expotax=tax**2;
	logsqft=log(sqft);
	expqft=sqft**2;
run; 

proc standard data=union out=salida_standard mean=0 std=1; var age baths beds expotax logatax logsqft expqft lot sqft tax;
run;



/* Root MSE = 178287.1 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 155063.2 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax logsqft expqft logsqft*expqft beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;

/* Root MSE = 155035.0 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax logsqft expqft logsqft*expqft*expotax*logatax logsqft*expqft beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;


data union; set union; 
	logatax=log(tax);
	expotax=tax**2;
	logsqft=log(sqft);
	expqft=sqft**2;
	logage=log(age);
	expage=age**2;
	logbaths=log(baths);
	expbaths=baths**2;
	logbeds=log(beds);
	expbeds=beds**2;
run; 

proc standard data=union out=salida_standard mean=0 std=1; var age baths beds expotax logatax logsqft expqft lot sqft tax logage expage logbaths expbaths logbeds expbeds;
run;

	



/* Root MSE = 128982.9 */
proc glm data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax logsqft expqft logage expage logbaths expbaths logbeds expbeds logsqft*expqft*logage*expage*logbaths*expbaths*logbeds*expbeds logsqft*expqft*expotax*logatax logsqft*expqft beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax;
	output out=salida p=predi;
run;




/* Root MSE = 337201.5 */
proc glmselect data=salida_standard;
	model price=age baths beds expotax logatax lot sqft tax logsqft expqft logsqft*expqft beds*expotax*logatax*lot*sqft*tax age*baths*beds*expotax*logatax*lot*sqft*tax expotax*logatax*lot*sqft*tax age*baths*beds*sqft tax*lot*sqft tax*lot age*lot tax*sqft sqft*baths*beds baths*beds expotax*logatax /selection=stepwise;
	output out=salida p=predi;
run;



/* EJEMPLO CON DATOS TEST */

data a;set salida;if _n_<=300;
data b;set salida;if _n_>300;run;

%calcular(archivo=a,test=1,archivotest=b,
vardepen=,
conti=age baths beds expotax logatax lot sqft tax age,
categor=usage,
corte=0.5 ,porcaptura=0.3); 

%interacttodo(archivo=union_original,vardep=price,
listclass=usage,listconti=age baths beds lot sqft tax age,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);


%nombresmodbien(archivo=salida_standard,depen=price,
modelo=age baths beds expotax logatax lot sqft tax age
,listclass=usage,
listconti=age baths beds expotax logatax lot sqft tax age,
corte=90,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);




data salida;set salida;if price=. then output;run; 
data ;set salida;
file 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle\Submit-18enero16-01-attempt.csv' dlm=',';
if _n_=1 then put 'Id,Prediction';
put id predi;
run;

