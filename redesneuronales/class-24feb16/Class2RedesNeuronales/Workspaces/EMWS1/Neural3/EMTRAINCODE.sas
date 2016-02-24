*------------------------------------------------------------*;
* Neural3: Create decision matrix;
*------------------------------------------------------------*;
data WORK.hat(label="hat");
  length   hat                                  8
           ;

 hat=-0.999989413;
output;
 hat=0.9999465168;
output;
 hat=-0.00002144809999;
output;
;
run;
proc datasets lib=work nolist;
modify hat(type=PROFIT label=hat);
run;
quit;
data EM_Neural3;
set EMWS1.Ids_DATA(keep=
hat x1 x2);
run;
*------------------------------------------------------------* ;
* Neural3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    hat x1 x2
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural3
dmdbcat=WORK.Neural3_DMDB
maxlevel = 513
;
var %DMDBVar;
target
hat
;
run;
quit;
*------------------------------------------------------------* ;
* Neural3: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    x1 x2
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural3: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural3: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural3: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
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
hat
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=30
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural3_PRELIM_OUTEST
;
save network=EMWS1.Neural3_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural3_outest estiter=1
Outfit=EMWS1.Neural3_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural3_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural3;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural3(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural3_INITIAL;
set EMWS1.Neural3_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
network = EMWS1.Neural3_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural3_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural3\SCORECODE.sas"
group=Neural3
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural3\RESIDUALSCORECODE.sas"
group=Neural3
residual
;
;
score data=EMWS1.Ids_DATA out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural3_OUTKEY;
run;
quit;
data EMWS1.Neural3_OUTFIT;
merge WORK.FIT1;
run;
data EMWS1.Neural3_EMESTIMATE;
set EMWS1.Neural3_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural3;
run;
quit;
