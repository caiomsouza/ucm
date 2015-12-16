
/*  
Ejemplo de regresion logistica visto en clase en el dia 9 de Dec 2015.
SEMMA

*/

libname semma 'C:\Users\win\Downloads\Tema 6 logistica 2015-16';


proc print data=semma.Saheart (obs=100);
run;

data Saheart;
set semma.Saheart;


/*  List all the variables in the dataset */

proc contents data=Saheart out=sa;
data;set sa;if _n_=1 then put 'LISTA DE VARIABLES CONTINUAS';if type=1 then put name @@;run;


/*  attempt 01 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco; 
output out=sal p=proba1; 
run;

/*  attempt 02 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco obesity; 
output out=sal p=proba1; 
run;

/*  attempt 03 Percent Concordant 71.4 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco obesity adiposity; 
output out=sal p=proba1; 
run;

/*  attempt 04 Percent Concordant 71.8 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco obesity adiposity obesity*adiposity; 
output out=sal p=proba1; 
run;

/*  attempt 05 Percent Concordant  74.6 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco alcohol age obesity adiposity obesity*adiposity; 
output out=sal p=proba1; 
run;

/*  attempt 06 Percent Concordant  74.4 */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco alcohol age obesity adiposity obesity*adiposity alcohol*age; 
output out=sal p=proba1; 
run;


/*  attempt 06 Percent Concordant  74.4 with the prob table /ctable */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco alcohol age obesity adiposity obesity*adiposity alcohol*age /ctable; 
output out=sal p=proba1; 
run;

/*  attempt 06 Percent Concordant  74.4 with the prob table /ctable and predprobs=(I) */
proc logistic data=Saheart; 
class chd; 
model chd(event='1')=tobacco alcohol age obesity adiposity obesity*adiposity alcohol*age /ctable; 
output out=sal p=proba1 predprobs=(I); 
run;


proc print data=sal; run;

proc print data=sal;
var tobacco chd proba1 _into_;
run;







data;
p=exp(-1.19);
p=p/(1+p);
put p=;
run;





data uno; 
input Y X1 X2; 
cards; 
0 1 3
0 2 2
0 3 -1
0 3 -1
1 5 2
1 6 4
1 10 1
1 11 0
;
run; 

proc logistic 
data = uno descending; 
model y = x1 x2; 
run;

proc logistic 
data = uno descending; 
model y = x1 x2 /firth ; 
run;
