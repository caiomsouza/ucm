
/* 

Ejemplo de como trabajar con muestras en SAS.

*/

data uno;
do i=1 to 3000;
y=ranbin(0,1,0.10);
z=rannor(0);
output;
end;
run;

proc sort data=uno;
by y;
run;

proc surveyselect data=uno out=muestra samprate=0.20 seed=12345;
strata y;
run;

proc freq data=muestra; tables y; run;



