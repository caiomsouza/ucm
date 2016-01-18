libname disco 'C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\wages';
proc print data=disco.wages;run;

data wages;set disco.wages;run;

%cruzada(archivo=wages,vardepen=wage, 
listconti=education experience age, 
listclass= south sex union race occupation sector marr, 
ngrupos=4,sinicio=12345,sfinal=12355); 
data final1;set final;modelo=1; 

%cruzada(archivo=wages,vardepen=wage, 
listconti=education age, 
listclass= south sex union race occupation marr, 
ngrupos=4,sinicio=12345,sfinal=12355); 
data final2;set final;modelo=2; 

ods graphics off;
data union;set final1 final2; 
proc boxplot data=union;plot media*modelo;run; 

%AgruparCategorias(archivo=wages,vardep=wage,vardeptipo=I,listclass=education,
criterio=PROBF,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\wages;

data wages; set archivofinal;run;

%cruzada(archivo=wages,vardepen=wage, 
listconti= education_G experience age,
listclass=south sex union race occupation sector marr, 
ngrupos=4,sinicio=12345,sfinal=12355); 
data final3;set final;modelo=3;

ods graphics off;
data union;set final1 final2 final3; 
proc boxplot data=union;plot media*modelo;run; 

OPTIONS SPOOL;
%interacttodo(archivo=wages,vardep=wage,
listclass=south sex union race occupation sector marr,listconti=education experience age ,
interac=1,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\wages);

/*occupation*education_G occupation*education union*occupation sex*occupation sex*education_G
occupation*age sector*education_G south*education_G sex*education union*education_G
marr*education_G occupation*sector race*education_G education_G occupation union*education
occupation*marr south*occupation race*occupation sector*education south*education marr*education
education race*education occupation*experience sex*age sex*marr south*sex sex*experience
sex*union sex*race sex south*age union*age south*union race*age sex*sector age marr*age
union*race union*marr south*marr sector*age union south union*sector south*race union*experience
south*experience south*sector race*experience marr race experience race*marr marr*experience
sector*marr sector*experience sector race*sector*/

ods output  SelectedEffects=efectos;proc glmselect data=wages;
class occupation union south sex sector marr race;
model wage=occupation*education_G occupation*education union*occupation sex*occupation sex*education_G
occupation*age sector*education_G south*education_G sex*education union*education_G
marr*education_G occupation*sector race*education_G education_G occupation union*education
occupation*marr south*occupation race*occupation sector*education south*education marr*education
education race*education occupation*experience sex*age sex*marr south*sex sex*experience
sex*union sex*race sex south*age union*age south*union race*age sex*sector age marr*age
union*race union*marr south*marr sector*age union south union*sector south*race union*experience
south*experience south*sector race*experience marr race experience race*marr marr*experience
sector*marr sector*experience sector race*sector
/selection=stepwise(select=sl choose=sbc);
data;set efectos;put effects @@;run; 

/*Intercept education*OCCUPATION education_G*SOUTH education_G*UNION EDUCATION*UNION AGE*SEX
 */

%cruzada(archivo=wages,vardepen=wage,
listconti= education*OCCUPATION education_G*SOUTH education_G*UNION EDUCATION*UNION AGE*SEX,
listclass= occupation sex south union,
ngrupos=4,sinicio=12345,sfinal=12375);
data final4;set final;modelo=4;

ods graphics off;
data union;set final1 final2 final3 final4; 
proc boxplot data=union;plot media*modelo;run; 

ods output  SelectedEffects=efectos;proc glmselect data=wages;
class occupation union south sex sector marr race;
model wage=occupation*education_G occupation*education union*occupation sex*occupation sex*education_G
occupation*age sector*education_G south*education_G sex*education union*education_G
marr*education_G occupation*sector race*education_G education_G occupation union*education
occupation*marr south*occupation race*occupation sector*education south*education marr*education
education race*education occupation*experience sex*age sex*marr south*sex sex*experience
sex*union sex*race sex south*age union*age south*union race*age sex*sector age marr*age
union*race union*marr south*marr sector*age union south union*sector south*race union*experience
south*experience south*sector race*experience marr race experience race*marr marr*experience
sector*marr sector*experience sector race*sector
/selection=stepwise(select=aic choose=aic);
data;set efectos;put effects @@;run; 

/* Intercept education*OCCUPATION education_G*SEX education_G*SECTOR education_G*SOUTH education_G*
UNION EDUCATION*UNION AGE*SEX SECTOR */

%cruzada(archivo=wages,vardepen=wage,
listconti= education*OCCUPATION education_G*SEX education_G*SECTOR education_G*SOUTH education_G*
UNION EDUCATION*UNION AGE*SEX SECTOR,
listclass= occupation sex south union sector,
ngrupos=4,sinicio=12345,sfinal=12375);
data final5;set final;modelo=5;

ods graphics off;
data union;set final1 final2 final3 final4 final5; 
proc boxplot data=union;plot media*modelo;run; 

proc glm data=wages;
class occupation sex south union sector;
model wage=education*OCCUPATION education_G*SEX education_G*SECTOR education_G*SOUTH education_G*
UNION EDUCATION*UNION AGE*SEX SECTOR/solution;
run; /* 18 parametros */

/*REFINAMIENTO DE LAS VARIABLE */

/* (6)
PRUEBAS CON LA MACRO NOMBRESMODBIEN 
METO TODOS LOS EFECTOS PERO IGUALMENTE SE PUEDEN CONSIDERAR SOLAMENTE LOS DE LOS MODELOS ANTERIORES

METEMOS CORTE=30 PORQUE QUEREMOS MODELOS MÁS SENCILLOS (CON EL RIESGO DE MAYOR ERROR)
*/

/*
options nonotes nosource;
*/

%nombresmodbien(archivo=wages,
depen=wage,
modelo=occupation*education union*occupation sex*occupation occupation*age sex*education
occupation*sector occupation union*education occupation*marr south*occupation race*occupation
sector*education south*education marr*education education race*education occupation*experience
sex*age sex*marr south*sex sex*experience sex*union sex*race sex south*age union*age south*union
race*age sex*sector age marr*age union*race union*marr south*marr sector*age union south
union*sector south*race union*experience south*experience south*sector race*experience marr race
experience race*marr marr*experience sector*marr sector*experience sector race*sector,
listclass=south sex union race occupation sector marr,
listconti=education experience age wage,
corte=30,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\wages);


%nombresmodbien(archivo=wages,depen=wage,
modelo=occupation*education union*occupation sex*occupation occupation*age sex*education
,
listclass= occupation union sex sector marr south race,
listconti= education experience age,
corte=30,directorio=C:\Users\win\Documents\GitHub\ucm\semma\trabajo2\wages);

