*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS3.Part_TRAIN(keep=
Age FEV Height Sex Smoker);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Sex(ASC) Smoker(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age FEV Height
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
FEV
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
outest = EMWS3.Reg_EMESTIMATE
outterms = EMWS3.Reg_OUTTERMS
outmap= EMWS3.Reg_MAPDS namelen=200
;
class
Sex
Smoker
;
model FEV =
Age
Height
Sex
Smoker
/error=normal
coding=DEVIATION
nodesignprint
;
;
score data=EMWS3.Part_TEST
out=_null_
outfit=EMWS3.Reg_FITTEST
role = TEST
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
