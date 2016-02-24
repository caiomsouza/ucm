*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
BsmtFin_SF_1 Bsmt_Full_Bath Exter_Qual Fireplaces G_Bldg_Type G_Bsmt_Exposure
G_Bsmt_Qual G_Condition_1 G_Condition_2 G_Exterior_1st G_Functional
G_Garage_Qual G_House_Style G_Kitchen_Qual G_MS_SubClass G_Neighborhood
G_Pool_QC G_Roof_Matl G_Sale_Condition Garage_Cars Gr_Liv_Area Land_Contour
Lot_Area Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch
Year_Built);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Exter_Qual(ASC) G_Bldg_Type(ASC) G_Bsmt_Exposure(ASC) G_Bsmt_Qual(ASC)
   G_Condition_1(ASC) G_Condition_2(ASC) G_Exterior_1st(ASC) G_Functional(ASC)
   G_Garage_Qual(ASC) G_House_Style(ASC) G_Kitchen_Qual(ASC) G_MS_SubClass(ASC)
   G_Neighborhood(ASC) G_Pool_QC(ASC) G_Roof_Matl(ASC) G_Sale_Condition(ASC)
   Land_Contour(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    BsmtFin_SF_1 Bsmt_Full_Bath Fireplaces Garage_Cars Gr_Liv_Area Lot_Area
   Mas_Vnr_Area Overall_Cond Overall_Qual SalePrice Screen_Porch Year_Built
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
SalePrice
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
outest = EMWS2.Reg_EMESTIMATE
outterms = EMWS2.Reg_OUTTERMS
outmap= EMWS2.Reg_MAPDS namelen=200
;
class
Exter_Qual
G_Bldg_Type
G_Bsmt_Exposure
G_Bsmt_Qual
G_Condition_1
G_Condition_2
G_Exterior_1st
G_Functional
G_Garage_Qual
G_House_Style
G_Kitchen_Qual
G_MS_SubClass
G_Neighborhood
G_Pool_QC
G_Roof_Matl
G_Sale_Condition
Land_Contour
;
model SalePrice =
BsmtFin_SF_1
Bsmt_Full_Bath
Exter_Qual
Fireplaces
G_Bldg_Type
G_Bsmt_Exposure
G_Bsmt_Qual
G_Condition_1
G_Condition_2
G_Exterior_1st
G_Functional
G_Garage_Qual
G_House_Style
G_Kitchen_Qual
G_MS_SubClass
G_Neighborhood
G_Pool_QC
G_Roof_Matl
G_Sale_Condition
Garage_Cars
Gr_Liv_Area
Land_Contour
Lot_Area
Mas_Vnr_Area
Overall_Cond
Overall_Qual
Screen_Porch
Year_Built
/error=normal
coding=DEVIATION
nodesignprint
;
;
score data=EMWS2.Part_TEST
out=_null_
outfit=EMWS2.Reg_FITTEST
role = TEST
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
