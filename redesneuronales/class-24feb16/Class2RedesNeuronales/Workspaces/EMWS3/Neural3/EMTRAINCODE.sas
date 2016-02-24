*------------------------------------------------------------*;
* Neural3: Create decision matrix;
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
data EM_Neural3;
set EMWS3.Part_TRAIN(keep=
Age FEV Height Sex Smoker);
run;
*------------------------------------------------------------* ;
* Neural3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Sex(ASC) Smoker(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age FEV Height
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural3
dmdbcat=WORK.Neural3_DMDB
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
* Neural3: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    Age Height
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
    Sex Smoker
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
input %NOMINPUTS / level=nominal id=nom
;
target
FEV
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=20
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS3.Neural3_PRELIM_OUTEST
;
save network=EMWS3.Neural3_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS3.Neural3_outest estiter=1
Outfit=EMWS3.Neural3_OUTFIT
;
run;
quit;
proc sort data=EMWS3.Neural3_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural3;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural3(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS3.Neural3_INITIAL;
set EMWS3.Neural3_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selección de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
network = EMWS3.Neural3_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS3.Neural3_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Neural3\SCORECODE.sas"
group=Neural3
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Neural3\RESIDUALSCORECODE.sas"
group=Neural3
residual
;
;
score data=EMWS3.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS3.Neural3_OUTKEY;
score data=EMWS3.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS3.Neural3_OUTKEY;
run;
quit;
data EMWS3.Neural3_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS3.Neural3_EMESTIMATE;
set EMWS3.Neural3_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural3;
run;
quit;
