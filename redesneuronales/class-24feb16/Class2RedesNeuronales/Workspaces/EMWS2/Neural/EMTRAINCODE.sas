*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.SalePrice(label="SalePrice");
  length   SalePrice                            8
           ;

  label    SalePrice="SalePrice"
           ;
 SalePrice=12789;
output;
 SalePrice=755000;
output;
 SalePrice=383894.5;
output;
;
run;
proc datasets lib=work nolist;
modify SalePrice(type=PROFIT label=SalePrice);
run;
quit;
data EM_Neural;
set EMWS2.Part_TRAIN(keep=
BsmtFin_SF_1 Bsmt_Full_Bath Exter_Qual Fireplaces G_Bldg_Type G_Bsmt_Exposure
G_Bsmt_Qual G_Condition_1 G_Condition_2 G_Exterior_1st G_Functional
G_Garage_Qual G_House_Style G_Kitchen_Qual G_MS_SubClass G_Neighborhood
G_Pool_QC G_Roof_Matl G_Sale_Condition Garage_Cars Gr_Liv_Area Land_Contour
Lot_Area Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch
Year_Built);
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Exter_Qual(ASC) G_Bldg_Type(ASC) G_Bsmt_Exposure(ASC) G_Bsmt_Qual(ASC)
   G_Condition_1(ASC) G_Condition_2(ASC) G_Exterior_1st(ASC) G_Functional(ASC)
   G_Garage_Qual(ASC) G_House_Style(ASC) G_Kitchen_Qual(ASC) G_MS_SubClass(ASC)
   G_Neighborhood(ASC) G_Pool_QC(ASC) G_Roof_Matl(ASC) G_Sale_Condition(ASC)
   Land_Contour(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    BsmtFin_SF_1 Bsmt_Full_Bath Fireplaces Garage_Cars Gr_Liv_Area Lot_Area
   Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch Year_Built
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
SalePrice
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    BsmtFin_SF_1 Bsmt_Full_Bath Fireplaces Garage_Cars Gr_Liv_Area Lot_Area
   Mas_Vnr_Area Overall_Cond Overall_Qual Screen_Porch Year_Built
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
    Exter_Qual G_Bldg_Type G_Bsmt_Exposure G_Bsmt_Qual G_Condition_1 G_Condition_2
   G_Exterior_1st G_Functional G_Garage_Qual G_House_Style G_Kitchen_Qual
   G_MS_SubClass G_Neighborhood G_Pool_QC G_Roof_Matl G_Sale_Condition
   Land_Contour
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
SalePrice
/ level=interval id=intervalTargets
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS2.Neural_PRELIM_OUTEST
;
save network=EMWS2.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS2.Neural_outest estiter=1
Outfit=EMWS2.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS2.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _AVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS2.Neural_INITIAL;
set EMWS2.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selecci�n de modelo de red neuronal;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
network = EMWS2.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS2.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS2.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS2.Neural_OUTKEY;
score data=EMWS2.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS2.Neural_OUTKEY;
run;
quit;
data EMWS2.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS2.Neural_EMESTIMATE;
set EMWS2.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
