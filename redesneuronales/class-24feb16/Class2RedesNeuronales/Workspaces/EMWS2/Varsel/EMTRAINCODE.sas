*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Alley(ASC) Bldg_Type(ASC) BsmtFin_Type_1(ASC) BsmtFin_Type_2(ASC)
   Bsmt_Cond(ASC) Bsmt_Exposure(ASC) Bsmt_Qual(ASC) Central_Air(ASC)
   Condition_1(ASC) Condition_2(ASC) Electrical(ASC) Exter_Cond(ASC)
   Exter_Qual(ASC) Exterior_1st(ASC) Exterior_2nd(ASC) Fence(ASC)
   Fireplace_Qu(ASC) Foundation(ASC) Functional(ASC) Garage_Cond(ASC)
   Garage_Finish(ASC) Garage_Qual(ASC) Garage_Type(ASC) Heating(ASC)
   Heating_QC(ASC) House_Style(ASC) Kitchen_Qual(ASC) Land_Contour(ASC)
   Land_Slope(ASC) Lot_Config(ASC) Lot_Shape(ASC) MS_SubClass(ASC) MS_Zoning(ASC)
   Mas_Vnr_Type(ASC) Misc_Feature(ASC) Neighborhood(ASC) Paved_Drive(ASC)
   Pool_QC(ASC) Roof_Matl(ASC) Roof_Style(ASC) Sale_Condition(ASC) Sale_Type(ASC)
   Street(ASC) Utilities(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Bedroom_AbvGr BsmtFin_SF_1 BsmtFin_SF_2 Bsmt_Full_Bath Bsmt_Half_Bath
   Bsmt_Unf_SF Enclosed_Porch Fireplaces Full_Bath Garage_Area Garage_Cars
   Garage_Yr_Blt Gr_Liv_Area Half_Bath Kitchen_AbvGr Lot_Area Lot_Frontage
   Low_Qual_Fin_SF Mas_Vnr_Area Misc_Val Mo_Sold Open_Porch_SF Order Overall_Cond
   Overall_Qual Pool_Area SalePrice Screen_Porch TotRms_AbvGrd Total_Bsmt_SF
   Wood_Deck_SF Year_Built Year_Remod_Add Yr_Sold _Ssn_Porch _nd_Flr_SF _st_Flr_SF
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\win\AppData\Local\Temp\SAS Temporary Files\_TD4376_PC_\Prc2";
proc dmdb batch data=EMWS2.Ids_DATA
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
SalePrice
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               ALLEY BEDROOM_ABVGR BLDG_TYPE BSMTFIN_SF_1 BSMTFIN_SF_2 BSMTFIN_TYPE_1
              BsmtFin_Type_2 BSMT_COND BSMT_EXPOSURE BSMT_FULL_BATH BSMT_HALF_BATH BSMT_QUAL
              Bsmt_Unf_SF CENTRAL_AIR CONDITION_1 CONDITION_2 ELECTRICAL ENCLOSED_PORCH
              Exter_Cond EXTER_QUAL EXTERIOR_1ST EXTERIOR_2ND FENCE FIREPLACE_QU FIREPLACES
              Foundation FULL_BATH FUNCTIONAL GARAGE_AREA GARAGE_CARS GARAGE_COND
              Garage_Finish GARAGE_QUAL GARAGE_TYPE GARAGE_YR_BLT GR_LIV_AREA HALF_BATH
              Heating HEATING_QC HOUSE_STYLE KITCHEN_ABVGR KITCHEN_QUAL LAND_CONTOUR
              Land_Slope LOT_AREA LOT_CONFIG LOT_FRONTAGE LOT_SHAPE LOW_QUAL_FIN_SF
              MS_SubClass MS_ZONING MAS_VNR_AREA MAS_VNR_TYPE MISC_FEATURE MISC_VAL MO_SOLD
              Neighborhood OPEN_PORCH_SF ORDER OVERALL_COND OVERALL_QUAL PAVED_DRIVE
              Pool_Area POOL_QC ROOF_MATL ROOF_STYLE SALE_CONDITION SALE_TYPE SCREEN_PORCH
              Street TOTRMS_ABVGRD TOTAL_BSMT_SF UTILITIES WOOD_DECK_SF YEAR_BUILT
   Year_Remod_Add YR_SOLD _SSN_PORCH _ND_FLR_SF _ST_FLR_SF
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS2.Varsel_OUTGROUP outest=EMWS2.Varsel_OUTESTDMINE outeffect=EMWS2.Varsel_OUTEFFECT outrsquare =EMWS2.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target SalePrice;
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS2\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS2.Varsel_OUTEFFECT;      proc print data =EMWS2.Varsel_OUTRSQUARE;      */
run;
