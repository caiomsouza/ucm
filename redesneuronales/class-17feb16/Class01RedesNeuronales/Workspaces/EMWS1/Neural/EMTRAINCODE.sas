*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.AERO(label="AERO");
  length   AERO                                 8
           ;

 AERO=13.6;
output;
 AERO=70.6;
output;
 AERO=42.1;
output;
;
run;
proc datasets lib=work nolist;
modify AERO(type=PROFIT label=AERO);
run;
quit;
data EM_Neural;
set EMWS1.Part_TRAIN(keep=
AERO EXER HEART SEX);
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    SEX(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AERO EXER HEART
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
AERO
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    EXER HEART
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    SEX
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %NOMINPUTS / level=nominal id=nom
;
target
AERO
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=6
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural_PRELIM_OUTEST
;
save network=EMWS1.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural_outest estiter=1
Outfit=EMWS1.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural_INITIAL;
set EMWS1.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
network = EMWS1.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-17feb16\Class01RedesNeuronales\Workspaces\EMWS1\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-17feb16\Class01RedesNeuronales\Workspaces\EMWS1\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS1.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural_OUTKEY;
score data=EMWS1.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS1.Neural_OUTKEY;
run;
quit;
data EMWS1.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural_EMESTIMATE;
set EMWS1.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
