*------------------------------------------------------------*;
* AutoNeural: Create decision matrix;
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
data EM_AutoNeural;
set EMWS2.Part_TRAIN(keep=
BsmtFin_SF_1 Bsmt_Full_Bath Exter_Qual Fireplaces G_Bldg_Type G_Bsmt_Exposure
G_Bsmt_Qual G_Condition_1 G_Condition_2 G_Exterior_1st G_Functional
G_Garage_Qual G_House_Style G_Kitchen_Qual G_MS_SubClass G_Neighborhood
G_Pool_QC G_Roof_Matl G_Sale_Condition Garage_Cars Gr_Liv_Area Land_Contour
Lot_Area Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch
Year_Built);
run;
*------------------------------------------------------------* ;
* AutoNeural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Exter_Qual(ASC) G_Bldg_Type(ASC) G_Bsmt_Exposure(ASC) G_Bsmt_Qual(ASC)
   G_Condition_1(ASC) G_Condition_2(ASC) G_Exterior_1st(ASC) G_Functional(ASC)
   G_Garage_Qual(ASC) G_House_Style(ASC) G_Kitchen_Qual(ASC) G_MS_SubClass(ASC)
   G_Neighborhood(ASC) G_Pool_QC(ASC) G_Roof_Matl(ASC) G_Sale_Condition(ASC)
   Land_Contour(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    BsmtFin_SF_1 Bsmt_Full_Bath Fireplaces Garage_Cars Gr_Liv_Area Lot_Area
   Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch Year_Built
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural
dmdbcat=WORK.AutoNeural_DMDB
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
* AutoNeural: Inputs intervalo Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    BsmtFin_SF_1 Bsmt_Full_Bath Fireplaces Garage_Cars Gr_Liv_Area Lot_Area
   Mas_Vnr_Area Overall_Cond Overall_Qual Screen_Porch Year_Built
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural: Inputs binarios Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural: Inputs nominales Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Exter_Qual G_Bldg_Type G_Bsmt_Exposure G_Bsmt_Qual G_Condition_1 G_Condition_2
   G_Exterior_1st G_Functional G_Garage_Qual G_House_Style G_Kitchen_Qual
   G_MS_SubClass G_Neighborhood G_Pool_QC G_Roof_Matl G_Sale_Condition
   Land_Contour
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural: Inputs ordinales Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
* establecer opciones de impresión;
;
options linesize = 80;
options pagesize = 6000;
options nonumber;
options nocenter;
options nodate;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_autonet_title  , NOQUOTE))";
*;
*------------------------------------------------------------*;
* Autoneuronal: buscar / SINGLE LAYER;
;
*------------------------------------------------------------*;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval SalePrice;
connect nominal SalePrice;
*;
netoptions ranscale = 1;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=1800 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS2.AutoNeural_HISTORY;
length _func_ _status_ _step_ $16;
label _func_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_function_vlabel  , NOQUOTE))";
label _status_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_status_vlabel  , NOQUOTE))";
label _iter_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_iteration_vlabel  , NOQUOTE))";
label _step_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_step_vlabel  , NOQUOTE))";
_func_ = '';
_status_ = '';
_step_ = 'SINGLE LAYER 1';
set
_anfit(where=(_name_ eq 'OVERALL' and _iter_ eq 0))
;
run;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 2 : TANH : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=900 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=898 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=SINE;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 4 : SINE : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 4 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=897 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval SalePrice;
connect nominal SalePrice;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS2.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : TANH : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS2.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=896 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval SalePrice;
connect nominal SalePrice;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS2.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : NORMAL : ))";
prelim 8 outest=_anpre pretime=111 preiter=8
tech = Default
inest = EMWS2.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=895 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval SalePrice;
connect nominal SalePrice;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=SINE;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ SalePrice;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS2.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : SINE : ))";
prelim 8 outest=_anpre pretime=111 preiter=8
tech = Default
inest = EMWS2.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=893 maxiter=8
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval SalePrice;
connect nominal SalePrice;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS2.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Entrenamiento final))";
train estiter=1 outest=_anest outfit=_anfit maxtime=1784 maxiter=5
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
*------------------------------------------------------------*;
* Extraer mejor iteración;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _AVERR_ < _min then do;
_min = _AVERR_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS2.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS2.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS2.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
*------------------------------------------------------------*;
* Red final autoneuronal;
;
*------------------------------------------------------------*;
*;
proc neural data=EM_AutoNeural dmdbcat=WORK.AutoNeural_DMDB
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target SalePrice / level=INTERVAL id=SalePrice
;
*;
initial inest= EMWS2.AutoNeural_ESTDS bylabel;
train tech=none;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\AutoNeural\SCORECODE.sas"
group=AutoNeural
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\AutoNeural\RESIDUALSCORECODE.sas"
group=AutoNeural
residual
;
;
score data=EMWS2.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS2.AutoNeural_OUTKEY;
score data=EMWS2.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS2.AutoNeural_OUTKEY;
run;
data EMWS2.AutoNeural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generar conjunto de datos Trazado de pesos;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS2.AutoNeural_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS2.AutoNeural_WEIGHTS;
by _name_;
run;
data EMWS2.AutoNeural_WEIGHTS;
set EMWS2.AutoNeural_WEIGHTS;
FROM = ktrim(kleft(kscan(_LABEL_, 1, '-->')));
TO = ktrim(kleft(kscan(_LABEL_, 2, '>')));
WEIGHT = COL1;
if (TO eq '') or (FROM eq '') then delete;
label _LABEL_ ="%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel  , NOQUOTE))" FROM = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel  , NOQUOTE))" TO = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel  , NOQUOTE))" WEIGHT =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_weight_vlabel  , NOQUOTE))";
keep FROM TO WEIGHT _LABEL_;
run;
* restablecer opciones de impresión;
;
title10;
options linesize=256;
options pagesize=10000;
options nonumber;
options nocenter;
options nodate;
*;
