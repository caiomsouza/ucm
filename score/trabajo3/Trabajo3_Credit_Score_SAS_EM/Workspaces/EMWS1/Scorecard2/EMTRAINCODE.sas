*------------------------------------------------------------*;
* Scorecard2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.DEFAULT;
  length   DEFAULT                          $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1.00"
           DECISION2="0.00"
           ;
  format   COUNT 10.
           ;
DEFAULT="1.00"; COUNT=104; DATAPRIOR=0.10462776659959; TRAINPRIOR=0.10462776659959; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
DEFAULT="0.00"; COUNT=890; DATAPRIOR=0.8953722334004; TRAINPRIOR=0.8953722334004; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify DEFAULT(type=PROFIT label=DEFAULT);
label DECISION1= '1.00';
label DECISION2= '0.00';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.IGN2_TRAIN(keep=
DEFAULT WOE_ACTIVE WOE_AGE WOE_AVGEXP WOE_CUR_ADD WOE_INCOME _FREQ_ );
run;
*------------------------------------------------------------* ;
* Scorecard2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DEFAULT(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Scorecard2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    WOE_ACTIVE WOE_AGE WOE_AVGEXP WOE_CUR_ADD WOE_INCOME _FREQ_
%mend DMDBVar;
*------------------------------------------------------------*;
* Scorecard2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Scorecard2_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
DEFAULT
;
freq
_FREQ_
;
run;
quit;
*------------------------------------------------------------*;
* Scorecard2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Scorecard2_DMDB
outest = EMWS1.Scorecard2_EMESTIMATE
outterms = EMWS1.Scorecard2_OUTTERMS
outmap= EMWS1.Scorecard2_MAPDS namelen=200
;
class
DEFAULT
;
freq
_FREQ_
;
model DEFAULT =
WOE_AGE
WOE_INCOME
WOE_ACTIVE
WOE_AVGEXP
WOE_CUR_ADD
/error=binomial link=LOGIT
coding=GLM
nodesignprint
;
nloptions
maxtime = 604800
;
code file="C:\Users\win\Documents\GitHub\ucm\score\trabajo3\Trabajo3_Credit_Score_SAS_EM\Workspaces\EMWS1\Scorecard2\EMPUBLISHSCORE.sas"
group=Scorecard2
;
code file="C:\Users\win\Documents\GitHub\ucm\score\trabajo3\Trabajo3_Credit_Score_SAS_EM\Workspaces\EMWS1\Scorecard2\EMFLOWSCORE.sas"
group=Scorecard2
residual
;
run;
quit;
%let note = %sysfunc(sasmsg(sashelp.credit, transformmodel_note, NOQUOTE, Scorecard2));
*------------------------------------------------------------*;
* &note;
*------------------------------------------------------------*;
%let EM_DEC_DECMETA = EMWS1.Ids_DEFAULT_DM;
%let EM_DEC_DECDATA = EMWS1.Ids_DEFAULT_DD;
%let note = %sysfunc(sasmsg(sashelp.credit, loadmacros_note, NOQUOTE, Scorecard2));
*------------------------------------------------------------*;
* &note;
*------------------------------------------------------------*;
/* retrieve target variable information */
%targetInformation;
%priorInformation;
/* retrieve parameter estimates */
%getParameterEstimates(tempImportEst, &EM_USER_PARAMESTIMATES);
/* verify that all required variables exist */
%verifyParameters(&EM_USER_PARAMVERIFICATION, &EM_USER_MAPPINGTABLE);
%calcGroupEventRates
/* generate scorecard data */
%generateScoreCard;
/* build export datasets */
%buildExportDatasets;
/* generate scorecode */
%generateScoreCode(Scorecard2);
/* apply scorecode */
%applyScoreCode;
/* generate analysis charts and plots */
%generateAnalysis;
/* generate binScoreCode */
%generateBinScoreCode(%nrbquote(C:\Users\win\Documents\GitHub\ucm\score\trabajo3\Trabajo3_Credit_Score_SAS_EM\Workspaces\EMWS1\Scorecard2\BINSCOREFILE.sas));