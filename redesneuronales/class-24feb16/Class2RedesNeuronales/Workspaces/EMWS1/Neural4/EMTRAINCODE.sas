*------------------------------------------------------------*;
* Neural4: Create decision matrix;
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
data EM_Neural4;
set EMWS1.Ids_DATA(keep=
hat x1 x2);
run;
*------------------------------------------------------------* ;
* Neural4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    hat x1 x2
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural4
dmdbcat=WORK.Neural4_DMDB
maxlevel = 513
;
var %DMDBVar;
target
hat
;
run;
quit;
*------------------------------------------------------------* ;
* Neural4: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    x1 x2
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural4: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural4: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural4: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural4 dmdbcat=WORK.Neural4_DMDB
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
Hidden=40
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural4_PRELIM_OUTEST
;
save network=EMWS1.Neural4_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural4_outest estiter=1
Outfit=EMWS1.Neural4_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural4_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural4;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural4(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural4_INITIAL;
set EMWS1.Neural4_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selecci�n de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural4 dmdbcat=WORK.Neural4_DMDB
network = EMWS1.Neural4_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural4_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural4\SCORECODE.sas"
group=Neural4
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1\Neural4\RESIDUALSCORECODE.sas"
group=Neural4
residual
;
;
score data=EMWS1.Ids_DATA out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural4_OUTKEY;
run;
quit;
data EMWS1.Neural4_OUTFIT;
merge WORK.FIT1;
run;
data EMWS1.Neural4_EMESTIMATE;
set EMWS1.Neural4_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural4;
run;
quit;