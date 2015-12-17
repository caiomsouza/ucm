/*Ejemplo 1 SAS*/

Data ej1;
input edad $ fuma $ cantidad;
datalines;
Jovnofuma Muertoprematuro 50
Jovnofuma Vivoprematuro 315
Jovnofuma Bebemuerto1ano 24
Jovnofuma Bebevivo 4012
Jovfuma Muertoprematuro 9
Jovfuma Vivoprematuro 40
Jovfuma Bebemuerto1ano 6
Jovfuma Bebevivo 459
Maynofuma Muertoprematuro 41
Maynofuma Vivoprematuro 147
Maynofuma Bebemuerto1ano 14
Maynofuma Bebevivo 1594
Mayfuma Muertoprematuro 4
Mayfuma Vivoprematuro 11
Mayfuma Bebemuerto1ano 1
Mayfuma Bebevivo 124
;
proc print; 
run;


proc corresp data=ej1 all chi2p print=both;
tables edad, fuma;
weight cantidad;
run;


/*Ejercicio2*/
data salario;
input cantidad $ x1-x6;
label x1='SMIP<1' x2='SMIP1-2' x=3'SMIP2-3' x4='SMIP3-4' x5='SMIP4-5 ' x6='SMIP>5'
;
datalines;
<25H 150 156 20 2 2 0
25-33H 117 363 207 59 16 10
33-41H 86 235 288 118 44 42
41-49H 57 184 229 122 62 64
49-57H 55 159 164 83 29 47
>57H 19 93 73 19 15 25
<25M 114 86 10 0 0 0
25-33M 124 185 78 26 1 5
33-41M 64 138 117 53 18 10
41-49M 52 84 82 44 13 5
49-57M 48 55 26 21 7 2
>57M 29 29 10 4 4 1
;
proc print; run;

proc corresp data=salario all chi2p print=both;
var x1 x2 x3 x4 x5 x6;
id cantidad;
run;
