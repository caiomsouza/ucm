*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS1.Part_TRAIN(keep=
AERO EXER HEART SEX);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    SEX(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AERO EXER HEART
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
AERO
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
SEX
;
model AERO =
EXER
HEART
SEX
/error=normal
coding=DEVIATION
nodesignprint
;
;
score data=EMWS1.Part_TEST
out=_null_
outfit=EMWS1.Reg_FITTEST
role = TEST
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-17feb16\Class01RedesNeuronales\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-17feb16\Class01RedesNeuronales\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
