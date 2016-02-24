*------------------------------------------------------------*;
* Neural9: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Median_House_value(label="Median_House_value");
  length   Median_House_value                   8
           ;

 Median_House_value=14999;
output;
 Median_House_value=500001;
output;
 Median_House_value=257500;
output;
;
run;
proc datasets lib=work nolist;
modify Median_House_value(type=PROFIT label=Median_House_value);
run;
quit;
data EM_Neural9;
set EMWS1.Part_TRAIN(keep=
Median_House_value households housing_median_age latitude longitude
median_income population total_bedrooms total_rooms);
run;
*------------------------------------------------------------* ;
* Neural9: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural9: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Median_House_value households housing_median_age latitude longitude
   median_income population total_bedrooms total_rooms
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural9: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural9
dmdbcat=WORK.Neural9_DMDB
maxlevel = 513
;
var %DMDBVar;
target
Median_House_value
;
run;
quit;
*------------------------------------------------------------* ;
* Neural9: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    households housing_median_age latitude longitude median_income population
   total_bedrooms total_rooms
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural9: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural9: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural9: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural9 dmdbcat=WORK.Neural9_DMDB
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
target
Median_House_value
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=40
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural9_PRELIM_OUTEST
;
save network=EMWS1.Neural9_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural9_outest estiter=1
Outfit=EMWS1.Neural9_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural9_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural9;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural9(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural9_INITIAL;
set EMWS1.Neural9_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural9 dmdbcat=WORK.Neural9_DMDB
network = EMWS1.Neural9_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural9_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural9\SCORECODE.sas"
group=Neural9
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural9\RESIDUALSCORECODE.sas"
group=Neural9
residual
;
;
score data=EMWS1.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural9_OUTKEY;
score data=EMWS1.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS1.Neural9_OUTKEY;
run;
quit;
data EMWS1.Neural9_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural9_EMESTIMATE;
set EMWS1.Neural9_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural9;
run;
quit;
