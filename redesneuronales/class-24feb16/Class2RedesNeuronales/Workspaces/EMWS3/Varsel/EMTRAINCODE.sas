*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Sex(ASC) Smoker(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age FEV Height
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\win\AppData\Local\Temp\SAS Temporary Files\_TD4652_PC_\Prc2";
proc dmdb batch data=EMWS3.Part_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
FEV
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    AGE HEIGHT SEX SMOKER
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS3.Varsel_OUTGROUP outest=EMWS3.Varsel_OUTESTDMINE outeffect=EMWS3.Varsel_OUTEFFECT outrsquare =EMWS3.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target FEV;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS3.Varsel_OUTEFFECT;      proc print data =EMWS3.Varsel_OUTRSQUARE;      */
run;
