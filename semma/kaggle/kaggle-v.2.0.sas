/* Carga los datos SAS en la libreria disco que estan en la carpeta */
libname kaggle 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle';


data union; set kaggle.preditrain kaggle.testalumnos;run;

proc contents data=union;run;

%interacttodo(archivo=union,vardep=price,
listclass= ,listconti=beds baths sqft lot age tax,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\);

/* output interacttodo

tax sqft baths beds age lot

*/


proc standard data=union out=salida_standard mean=0 std=1; var tax sqft baths beds age lot;
run;



data unionlog (drop=i); 
array x{6} tax sqft baths beds age lot; 
array z{6}; set union;logprice=log(price); 
do i=1 to 6;z{i}=log(x{i}+1);end; 
run;


proc glmselect data=unionlog; 
model logprice=z1-z6 tax sqft baths beds age lot /selection=stepwise(select=sbc choose=sbc); 
output out=salida p=predi;
run;

data salida;set salida;if price=. then output;run; 
data ;set salida;
file 'C:\Users\win\Documents\GitHub\ucm\semma\kaggle\Submit-18enero16-02-attemptv.2.0.csv' dlm=',';
if _n_=1 then put 'Id,Prediction';
put id predi;
run;

