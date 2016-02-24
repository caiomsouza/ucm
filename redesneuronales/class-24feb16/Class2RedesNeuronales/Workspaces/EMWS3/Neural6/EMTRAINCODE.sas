*------------------------------------------------------------*;
* Neural6: Create decision matrix;
*------------------------------------------------------------*;
data WORK.FEV(label="FEV");
  length   FEV                                  8
           ;

 FEV=0.791;
output;
 FEV=5.793;
output;
 FEV=3.292;
output;
;
run;
proc datasets lib=work nolist;
modify FEV(type=PROFIT label=FEV);
run;
quit;
data EM_Neural6;
set EMWS3.Varsel_TRAIN(keep=
Age FEV Height Sex);
run;
*------------------------------------------------------------* ;
* Neural6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Sex(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age FEV Height
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural6
dmdbcat=WORK.Neural6_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
FEV
;
run;
quit;
*------------------------------------------------------------* ;
* Neural6: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    Age Height
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural6: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural6: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Sex
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural6: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Entrenamiento de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural6 dmdbcat=WORK.Neural6_DMDB
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
FEV
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS3.Neural6_PRELIM_OUTEST
;
save network=EMWS3.Neural6_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS3.Neural6_outest estiter=1
Outfit=EMWS3.Neural6_OUTFIT
;
run;
quit;
proc sort data=EMWS3.Neural6_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural6;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural6(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS3.Neural6_INITIAL;
set EMWS3.Neural6_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural6 dmdbcat=WORK.Neural6_DMDB
network = EMWS3.Neural6_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS3.Neural6_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Neural6\SCORECODE.sas"
group=Neural6
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Neural6\RESIDUALSCORECODE.sas"
group=Neural6
residual
;
;
score data=EMWS3.Varsel_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS3.Neural6_OUTKEY;
score data=EMWS3.Varsel_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS3.Neural6_OUTKEY;
run;
quit;
data EMWS3.Neural6_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS3.Neural6_EMESTIMATE;
set EMWS3.Neural6_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural6;
run;
quit;
