*------------------------------------------------------------*;
* AutoNeural: Create decision matrix;
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
data EM_AutoNeural;
set EMWS3.Part_TRAIN(keep=
Age FEV Height Sex Smoker);
run;
*------------------------------------------------------------* ;
* AutoNeural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Sex(ASC) Smoker(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age FEV Height
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
FEV
;
run;
quit;
*------------------------------------------------------------* ;
* AutoNeural: Inputs intervalo Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    Age Height
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
    Sex Smoker
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval FEV;
connect nominal FEV;
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS3.AutoNeural_HISTORY;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 7 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 7 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=SINE;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Conexión directa;
;
*------------------------------------------------------------*;
connect interval FEV;
connect nominal FEV;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS3.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS3.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=8
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 3 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 3 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
Hidden 2 / id = H1x2_ act=TANH;
connect interval H1x2_;
connect nominal H1x2_;
connect H1x2_ FEV;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS3.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS3.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=8
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
Hidden 2 / id = H1x2_ act=GAUSS;
connect interval H1x2_;
connect nominal H1x2_;
connect H1x2_ FEV;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS3.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS3.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=8
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
Hidden 2 / id = H1x2_ act=SINE;
connect interval H1x2_;
connect nominal H1x2_;
connect H1x2_ FEV;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS3.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : SINE : ))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS3.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=8
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS3.AutoNeural_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Entrenamiento final))";
prelim 8 outest=_anpre pretime=112 preiter=8
tech = Default
inest = EMWS3.AutoNeural_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Entrenamiento final))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=5
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
data EMWS3.AutoNeural_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS3.AutoNeural_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _AVERR_))";
proc print data=EMWS3.AutoNeural_OUTFIT noobs;
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
target FEV / level=INTERVAL id=FEV
;
*------------------------------------------------------------*;
* Capa #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=TANH;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ FEV;
*;
initial inest= EMWS3.AutoNeural_ESTDS bylabel;
train tech=none;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\AutoNeural\SCORECODE.sas"
group=AutoNeural
;
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\AutoNeural\RESIDUALSCORECODE.sas"
group=AutoNeural
residual
;
;
score data=EMWS3.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS3.AutoNeural_OUTKEY;
score data=EMWS3.Part_TEST out=_NULL_
outfit=WORK.FIT2
role=TEST
outkey=EMWS3.AutoNeural_OUTKEY;
run;
data EMWS3.AutoNeural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generar conjunto de datos Trazado de pesos;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS3.AutoNeural_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS3.AutoNeural_WEIGHTS;
by _name_;
run;
data EMWS3.AutoNeural_WEIGHTS;
set EMWS3.AutoNeural_WEIGHTS;
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
