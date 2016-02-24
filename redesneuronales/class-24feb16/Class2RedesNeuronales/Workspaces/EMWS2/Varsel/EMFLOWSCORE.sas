******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_Neighborhood begin----*/
length _NORM7 $ 7;
_NORM7 = put( Neighborhood , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
  when("BLMNGTN" ) G_Neighborhood = 8;
  when("BLUESTE" ) G_Neighborhood = 4;
  when("BRDALE " ) G_Neighborhood = 0;
  when("BRKSIDE" ) G_Neighborhood = 1;
  when("CLEARCR" ) G_Neighborhood = 9;
  when("COLLGCR" ) G_Neighborhood = 8;
  when("CRAWFOR" ) G_Neighborhood = 9;
  when("EDWARDS" ) G_Neighborhood = 2;
  when("GILBERT" ) G_Neighborhood = 7;
  when("GREENS " ) G_Neighborhood = 8;
  when("GRNHILL" ) G_Neighborhood = 11;
  when("IDOTRR " ) G_Neighborhood = 0;
  when("LANDMRK" ) G_Neighborhood = 3;
  when("MEADOWV" ) G_Neighborhood = 0;
  when("MITCHEL" ) G_Neighborhood = 5;
  when("NAMES  " ) G_Neighborhood = 4;
  when("NPKVILL" ) G_Neighborhood = 3;
  when("NWAMES " ) G_Neighborhood = 7;
  when("NORIDGE" ) G_Neighborhood = 13;
  when("NRIDGHT" ) G_Neighborhood = 12;
  when("OLDTOWN" ) G_Neighborhood = 1;
  when("SWISU  " ) G_Neighborhood = 3;
  when("SAWYER " ) G_Neighborhood = 3;
  when("SAWYERW" ) G_Neighborhood = 6;
  when("SOMERST" ) G_Neighborhood = 10;
  when("STONEBR" ) G_Neighborhood = 12;
  when("TIMBER " ) G_Neighborhood = 11;
  when("VEENKER" ) G_Neighborhood = 11;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Neighborhood="Grouped Levels for Neighborhood";
/*----G_Neighborhood end----*/

/*----G_Bsmt_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Bsmt_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
  when("  " ) G_Bsmt_Qual = 0;
  when("EX" ) G_Bsmt_Qual = 3;
  when("FA" ) G_Bsmt_Qual = 0;
  when("GD" ) G_Bsmt_Qual = 2;
  when("NA" ) G_Bsmt_Qual = 0;
  when("PO" ) G_Bsmt_Qual = 0;
  when("TA" ) G_Bsmt_Qual = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Bsmt_Qual="Grouped Levels for Bsmt_Qual";
/*----G_Bsmt_Qual end----*/

/*----G_Kitchen_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Kitchen_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
  when("EX" ) G_Kitchen_Qual = 3;
  when("FA" ) G_Kitchen_Qual = 0;
  when("GD" ) G_Kitchen_Qual = 2;
  when("PO" ) G_Kitchen_Qual = 0;
  when("TA" ) G_Kitchen_Qual = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Kitchen_Qual="Grouped Levels for Kitchen_Qual";
/*----G_Kitchen_Qual end----*/

/*----G_MS_SubClass begin----*/
length _NORM3 $ 3;
_NORM3 = put( MS_SubClass , $3. );
%DMNORMIP( _NORM3 )
drop _NORM3;
select(_NORM3);
  when("020" ) G_MS_SubClass = 6;
  when("030" ) G_MS_SubClass = 0;
  when("040" ) G_MS_SubClass = 4;
  when("045" ) G_MS_SubClass = 1;
  when("050" ) G_MS_SubClass = 3;
  when("060" ) G_MS_SubClass = 8;
  when("070" ) G_MS_SubClass = 4;
  when("075" ) G_MS_SubClass = 7;
  when("080" ) G_MS_SubClass = 5;
  when("085" ) G_MS_SubClass = 4;
  when("090" ) G_MS_SubClass = 3;
  when("120" ) G_MS_SubClass = 7;
  when("150" ) G_MS_SubClass = 4;
  when("160" ) G_MS_SubClass = 3;
  when("180" ) G_MS_SubClass = 1;
  when("190" ) G_MS_SubClass = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_MS_SubClass="Grouped Levels for MS_SubClass";
/*----G_MS_SubClass end----*/

/*----G_Bsmt_Exposure begin----*/
length _NORM2 $ 2;
_NORM2 = put( Bsmt_Exposure , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
  when("  " ) G_Bsmt_Exposure = 2;
  when("AV" ) G_Bsmt_Exposure = 3;
  when("GD" ) G_Bsmt_Exposure = 4;
  when("MN" ) G_Bsmt_Exposure = 2;
  when("NA" ) G_Bsmt_Exposure = 0;
  when("NO" ) G_Bsmt_Exposure = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Bsmt_Exposure="Grouped Levels for Bsmt_Exposure";
/*----G_Bsmt_Exposure end----*/

/*----G_Exterior_1st begin----*/
length _NORM7 $ 7;
_NORM7 = put( Exterior_1st , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
  when("ASBSHNG" ) G_Exterior_1st = 0;
  when("ASPHSHN" ) G_Exterior_1st = 0;
  when("BRKCOMM" ) G_Exterior_1st = 1;
  when("BRKFACE" ) G_Exterior_1st = 5;
  when("CBLOCK " ) G_Exterior_1st = 0;
  when("CEMNTBD" ) G_Exterior_1st = 7;
  when("HDBOARD" ) G_Exterior_1st = 3;
  when("IMSTUCC" ) G_Exterior_1st = 8;
  when("METALSD" ) G_Exterior_1st = 2;
  when("PLYWOOD" ) G_Exterior_1st = 4;
  when("PRECAST" ) G_Exterior_1st = 8;
  when("STONE  " ) G_Exterior_1st = 8;
  when("STUCCO " ) G_Exterior_1st = 1;
  when("VINYLSD" ) G_Exterior_1st = 6;
  when("WD SDNG" ) G_Exterior_1st = 1;
  when("WDSHING" ) G_Exterior_1st = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Exterior_1st="Grouped Levels for Exterior_1st";
/*----G_Exterior_1st end----*/

/*----G_Sale_Condition begin----*/
length _NORM7 $ 7;
_NORM7 = put( Sale_Condition , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
  when("ABNORML" ) G_Sale_Condition = 1;
  when("ADJLAND" ) G_Sale_Condition = 0;
  when("ALLOCA " ) G_Sale_Condition = 2;
  when("FAMILY " ) G_Sale_Condition = 2;
  when("NORMAL " ) G_Sale_Condition = 3;
  when("PARTIAL" ) G_Sale_Condition = 4;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Sale_Condition="Grouped Levels for Sale_Condition";
/*----G_Sale_Condition end----*/

/*----G_Garage_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Garage_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
  when("  " ) G_Garage_Qual = 1;
  when("EX" ) G_Garage_Qual = 3;
  when("FA" ) G_Garage_Qual = 1;
  when("GD" ) G_Garage_Qual = 3;
  when("NA" ) G_Garage_Qual = 0;
  when("PO" ) G_Garage_Qual = 0;
  when("TA" ) G_Garage_Qual = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Garage_Qual="Grouped Levels for Garage_Qual";
/*----G_Garage_Qual end----*/

/*----G_House_Style begin----*/
length _NORM6 $ 6;
_NORM6 = put( House_Style , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
  when("1.5FIN" ) G_House_Style = 1;
  when("1.5UNF" ) G_House_Style = 0;
  when("1STORY" ) G_House_Style = 4;
  when("2.5FIN" ) G_House_Style = 5;
  when("2.5UNF" ) G_House_Style = 4;
  when("2STORY" ) G_House_Style = 5;
  when("SFOYER" ) G_House_Style = 2;
  when("SLVL  " ) G_House_Style = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_House_Style="Grouped Levels for House_Style";
/*----G_House_Style end----*/

/*----G_Condition_1 begin----*/
length _NORM6 $ 6;
_NORM6 = put( Condition_1 , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
  when("ARTERY" ) G_Condition_1 = 0;
  when("FEEDR " ) G_Condition_1 = 1;
  when("NORM  " ) G_Condition_1 = 2;
  when("POSA  " ) G_Condition_1 = 4;
  when("POSN  " ) G_Condition_1 = 4;
  when("RRAE  " ) G_Condition_1 = 1;
  when("RRAN  " ) G_Condition_1 = 2;
  when("RRNE  " ) G_Condition_1 = 1;
  when("RRNN  " ) G_Condition_1 = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Condition_1="Grouped Levels for Condition_1";
/*----G_Condition_1 end----*/

/*----G_Bldg_Type begin----*/
length _NORM6 $ 6;
_NORM6 = put( Bldg_Type , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
  when("1FAM  " ) G_Bldg_Type = 2;
  when("2FMCON" ) G_Bldg_Type = 0;
  when("DUPLEX" ) G_Bldg_Type = 1;
  when("TWNHS " ) G_Bldg_Type = 1;
  when("TWNHSE" ) G_Bldg_Type = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Bldg_Type="Grouped Levels for Bldg_Type";
/*----G_Bldg_Type end----*/

/*----G_Condition_2 begin----*/
length _NORM6 $ 6;
_NORM6 = put( Condition_2 , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
  when("ARTERY" ) G_Condition_2 = 0;
  when("FEEDR " ) G_Condition_2 = 0;
  when("NORM  " ) G_Condition_2 = 1;
  when("POSA  " ) G_Condition_2 = 3;
  when("POSN  " ) G_Condition_2 = 2;
  when("RRAE  " ) G_Condition_2 = 1;
  when("RRAN  " ) G_Condition_2 = 0;
  when("RRNN  " ) G_Condition_2 = 0;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Condition_2="Grouped Levels for Condition_2";
/*----G_Condition_2 end----*/

/*----G_Pool_QC begin----*/
length _NORM2 $ 2;
_NORM2 = put( Pool_QC , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
  when("EX" ) G_Pool_QC = 2;
  when("FA" ) G_Pool_QC = 1;
  when("GD" ) G_Pool_QC = 1;
  when("NA" ) G_Pool_QC = 0;
  when("TA" ) G_Pool_QC = 0;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Pool_QC="Grouped Levels for Pool_QC";
/*----G_Pool_QC end----*/

/*----G_Functional begin----*/
length _NORM4 $ 4;
_NORM4 = put( Functional , $4. );
%DMNORMIP( _NORM4 )
drop _NORM4;
select(_NORM4);
  when("MAJ1" ) G_Functional = 2;
  when("MAJ2" ) G_Functional = 1;
  when("MIN1" ) G_Functional = 2;
  when("MIN2" ) G_Functional = 2;
  when("MOD " ) G_Functional = 2;
  when("SAL " ) G_Functional = 0;
  when("SEV " ) G_Functional = 1;
  when("TYP " ) G_Functional = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Functional="Grouped Levels for Functional";
/*----G_Functional end----*/

/*----G_Roof_Matl begin----*/
length _NORM7 $ 7;
_NORM7 = put( Roof_Matl , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
  when("CLYTILE" ) G_Roof_Matl = 0;
  when("COMPSHG" ) G_Roof_Matl = 0;
  when("MEMBRAN" ) G_Roof_Matl = 1;
  when("METAL  " ) G_Roof_Matl = 0;
  when("ROLL   " ) G_Roof_Matl = 0;
  when("TAR&GRV" ) G_Roof_Matl = 0;
  when("WDSHAKE" ) G_Roof_Matl = 1;
  when("WDSHNGL" ) G_Roof_Matl = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Roof_Matl="Grouped Levels for Roof_Matl";
/*----G_Roof_Matl end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
