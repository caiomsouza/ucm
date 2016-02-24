*------------------------------------------------------------*;
* Neural2: Create decision matrix;
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
data EM_Neural2;
set EMWS1.Ids_DATA(keep=
hat x1 x2);
run;
*------------------------------------------------------------* ;
* Neural2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    hat x1 x2
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural2
dmdbcat=WORK.Neural2_DMDB
maxlevel = 513
;
var %DMDBVar;
target
hat
;
run;
quit;
*------------------------------------------------------------* ;
* Neural2: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    x1 x2
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural2: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural2: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural2: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural2 dmdbcat=WORK.Neural2_DMDB
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
Hidden=15
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural2_PRELIM_OUTEST
;
save network=EMWS1.Neural2_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural2_outest estiter=1
Outfit=EMWS1.Neural2_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural2_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural2;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural2(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural2_INITIAL;
set EMWS1.Neural2_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural2 dmdbcat=WORK.Neural2_DMDB
network = EMWS1.Neural2_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural2_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural2\SCORECODE.sas"
group=Neural2
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural2\RESIDUALSCORECODE.sas"
group=Neural2
residual
;
;
score data=EMWS1.Ids_DATA out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural2_OUTKEY;
run;
quit;
data EMWS1.Neural2_OUTFIT;
merge WORK.FIT1;
run;
data EMWS1.Neural2_EMESTIMATE;
set EMWS1.Neural2_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural2;
run;
quit;
