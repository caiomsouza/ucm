***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
;
      label S_BsmtFin_SF_1 = 'Standard: BsmtFin_SF_1' ;

      label S_Bsmt_Full_Bath = 'Standard: Bsmt_Full_Bath' ;

      label S_Fireplaces = 'Standard: Fireplaces' ;

      label S_Garage_Cars = 'Standard: Garage_Cars' ;

      label S_Gr_Liv_Area = 'Standard: Gr_Liv_Area' ;

      label S_Lot_Area = 'Standard: Lot_Area' ;

      label S_Mas_Vnr_Area = 'Standard: Mas_Vnr_Area' ;

      label S_Overall_Cond = 'Standard: Overall_Cond' ;

      label S_Overall_Qual = 'Standard: Overall_Qual' ;

      label S_Screen_Porch = 'Standard: Screen_Porch' ;

      label S_Year_Built = 'Standard: Year_Built' ;

      label Exter_QualEx = 'Dummy: Exter_Qual=Ex' ;

      label Exter_QualFa = 'Dummy: Exter_Qual=Fa' ;

      label Exter_QualGd = 'Dummy: Exter_Qual=Gd' ;

      label G_Bldg_Type0 = 'Dummy: G_Bldg_Type=0' ;

      label G_Bldg_Type1 = 'Dummy: G_Bldg_Type=1' ;

      label G_Bldg_Type2 = 'Dummy: G_Bldg_Type=2' ;

      label G_Bsmt_Exposure0 = 'Dummy: G_Bsmt_Exposure=0' ;

      label G_Bsmt_Exposure1 = 'Dummy: G_Bsmt_Exposure=1' ;

      label G_Bsmt_Exposure2 = 'Dummy: G_Bsmt_Exposure=2' ;

      label G_Bsmt_Exposure3 = 'Dummy: G_Bsmt_Exposure=3' ;

      label G_Bsmt_Qual0 = 'Dummy: G_Bsmt_Qual=0' ;

      label G_Bsmt_Qual1 = 'Dummy: G_Bsmt_Qual=1' ;

      label G_Bsmt_Qual2 = 'Dummy: G_Bsmt_Qual=2' ;

      label G_Condition_10 = 'Dummy: G_Condition_1=0' ;

      label G_Condition_11 = 'Dummy: G_Condition_1=1' ;

      label G_Condition_12 = 'Dummy: G_Condition_1=2' ;

      label G_Condition_13 = 'Dummy: G_Condition_1=3' ;

      label G_Condition_20 = 'Dummy: G_Condition_2=0' ;

      label G_Condition_21 = 'Dummy: G_Condition_2=1' ;

      label G_Condition_22 = 'Dummy: G_Condition_2=2' ;

      label G_Exterior_1st0 = 'Dummy: G_Exterior_1st=0' ;

      label G_Exterior_1st1 = 'Dummy: G_Exterior_1st=1' ;

      label G_Exterior_1st2 = 'Dummy: G_Exterior_1st=2' ;

      label G_Exterior_1st3 = 'Dummy: G_Exterior_1st=3' ;

      label G_Exterior_1st4 = 'Dummy: G_Exterior_1st=4' ;

      label G_Exterior_1st5 = 'Dummy: G_Exterior_1st=5' ;

      label G_Exterior_1st6 = 'Dummy: G_Exterior_1st=6' ;

      label G_Exterior_1st7 = 'Dummy: G_Exterior_1st=7' ;

      label G_Functional0 = 'Dummy: G_Functional=0' ;

      label G_Functional1 = 'Dummy: G_Functional=1' ;

      label G_Functional2 = 'Dummy: G_Functional=2' ;

      label G_Garage_Qual0 = 'Dummy: G_Garage_Qual=0' ;

      label G_Garage_Qual1 = 'Dummy: G_Garage_Qual=1' ;

      label G_Garage_Qual2 = 'Dummy: G_Garage_Qual=2' ;

      label G_House_Style0 = 'Dummy: G_House_Style=0' ;

      label G_House_Style1 = 'Dummy: G_House_Style=1' ;

      label G_House_Style2 = 'Dummy: G_House_Style=2' ;

      label G_House_Style3 = 'Dummy: G_House_Style=3' ;

      label G_House_Style4 = 'Dummy: G_House_Style=4' ;

      label G_Kitchen_Qual0 = 'Dummy: G_Kitchen_Qual=0' ;

      label G_Kitchen_Qual1 = 'Dummy: G_Kitchen_Qual=1' ;

      label G_Kitchen_Qual2 = 'Dummy: G_Kitchen_Qual=2' ;

      label G_MS_SubClass0 = 'Dummy: G_MS_SubClass=0' ;

      label G_MS_SubClass1 = 'Dummy: G_MS_SubClass=1' ;

      label G_MS_SubClass2 = 'Dummy: G_MS_SubClass=2' ;

      label G_MS_SubClass3 = 'Dummy: G_MS_SubClass=3' ;

      label G_MS_SubClass4 = 'Dummy: G_MS_SubClass=4' ;

      label G_MS_SubClass5 = 'Dummy: G_MS_SubClass=5' ;

      label G_MS_SubClass6 = 'Dummy: G_MS_SubClass=6' ;

      label G_MS_SubClass7 = 'Dummy: G_MS_SubClass=7' ;

      label G_Neighborhood0 = 'Dummy: G_Neighborhood=0' ;

      label G_Neighborhood1 = 'Dummy: G_Neighborhood=1' ;

      label G_Neighborhood2 = 'Dummy: G_Neighborhood=2' ;

      label G_Neighborhood3 = 'Dummy: G_Neighborhood=3' ;

      label G_Neighborhood4 = 'Dummy: G_Neighborhood=4' ;

      label G_Neighborhood5 = 'Dummy: G_Neighborhood=5' ;

      label G_Neighborhood6 = 'Dummy: G_Neighborhood=6' ;

      label G_Neighborhood7 = 'Dummy: G_Neighborhood=7' ;

      label G_Neighborhood8 = 'Dummy: G_Neighborhood=8' ;

      label G_Neighborhood9 = 'Dummy: G_Neighborhood=9' ;

      label G_Neighborhood10 = 'Dummy: G_Neighborhood=10' ;

      label G_Neighborhood11 = 'Dummy: G_Neighborhood=11' ;

      label G_Neighborhood12 = 'Dummy: G_Neighborhood=12' ;

      label G_Pool_QC0 = 'Dummy: G_Pool_QC=0' ;

      label G_Pool_QC1 = 'Dummy: G_Pool_QC=1' ;

      label G_Roof_Matl0 = 'Dummy: G_Roof_Matl=0' ;

      label G_Roof_Matl1 = 'Dummy: G_Roof_Matl=1' ;

      label G_Sale_Condition0 = 'Dummy: G_Sale_Condition=0' ;

      label G_Sale_Condition1 = 'Dummy: G_Sale_Condition=1' ;

      label G_Sale_Condition2 = 'Dummy: G_Sale_Condition=2' ;

      label G_Sale_Condition3 = 'Dummy: G_Sale_Condition=3' ;

      label Land_ContourBnk = 'Dummy: Land_Contour=Bnk' ;

      label Land_ContourHLS = 'Dummy: Land_Contour=HLS' ;

      label Land_ContourLow = 'Dummy: Land_Contour=Low' ;

      label P_SalePrice = 'Predicted: SalePrice' ;

      label R_SalePrice = 'Residual: SalePrice' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Exter_Qual ;
drop Exter_QualEx Exter_QualFa Exter_QualGd ;
if missing( Exter_Qual ) then do;
   Exter_QualEx = .;
   Exter_QualFa = .;
   Exter_QualGd = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm2 $ 2; drop _dm2 ;
   _dm2 = put( Exter_Qual , $2. );
   %DMNORMIP( _dm2 )
   if _dm2 = 'TA'  then do;
      Exter_QualEx = -1;
      Exter_QualFa = -1;
      Exter_QualGd = -1;
   end;
   else if _dm2 = 'GD'  then do;
      Exter_QualEx = 0;
      Exter_QualFa = 0;
      Exter_QualGd = 1;
   end;
   else if _dm2 = 'EX'  then do;
      Exter_QualEx = 1;
      Exter_QualFa = 0;
      Exter_QualGd = 0;
   end;
   else if _dm2 = 'FA'  then do;
      Exter_QualEx = 0;
      Exter_QualFa = 1;
      Exter_QualGd = 0;
   end;
   else do;
      Exter_QualEx = .;
      Exter_QualFa = .;
      Exter_QualGd = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bldg_Type ;
drop G_Bldg_Type0 G_Bldg_Type1 G_Bldg_Type2 ;
if missing( G_Bldg_Type ) then do;
   G_Bldg_Type0 = .;
   G_Bldg_Type1 = .;
   G_Bldg_Type2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bldg_Type , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Bldg_Type0 = 0;
      G_Bldg_Type1 = 0;
      G_Bldg_Type2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_Bldg_Type0 = -1;
      G_Bldg_Type1 = -1;
      G_Bldg_Type2 = -1;
   end;
   else if _dm12 = '1'  then do;
      G_Bldg_Type0 = 0;
      G_Bldg_Type1 = 1;
      G_Bldg_Type2 = 0;
   end;
   else if _dm12 = '0'  then do;
      G_Bldg_Type0 = 1;
      G_Bldg_Type1 = 0;
      G_Bldg_Type2 = 0;
   end;
   else do;
      G_Bldg_Type0 = .;
      G_Bldg_Type1 = .;
      G_Bldg_Type2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bsmt_Exposure ;
drop G_Bsmt_Exposure0 G_Bsmt_Exposure1 G_Bsmt_Exposure2 G_Bsmt_Exposure3 ;
*** encoding is sparse, initialize to zero;
G_Bsmt_Exposure0 = 0;
G_Bsmt_Exposure1 = 0;
G_Bsmt_Exposure2 = 0;
G_Bsmt_Exposure3 = 0;
if missing( G_Bsmt_Exposure ) then do;
   G_Bsmt_Exposure0 = .;
   G_Bsmt_Exposure1 = .;
   G_Bsmt_Exposure2 = .;
   G_Bsmt_Exposure3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bsmt_Exposure , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_Bsmt_Exposure1 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_Bsmt_Exposure3 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_Bsmt_Exposure0 = -1;
      G_Bsmt_Exposure1 = -1;
      G_Bsmt_Exposure2 = -1;
      G_Bsmt_Exposure3 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_Bsmt_Exposure2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Bsmt_Exposure0 = 1;
   end;
   else do;
      G_Bsmt_Exposure0 = .;
      G_Bsmt_Exposure1 = .;
      G_Bsmt_Exposure2 = .;
      G_Bsmt_Exposure3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bsmt_Qual ;
drop G_Bsmt_Qual0 G_Bsmt_Qual1 G_Bsmt_Qual2 ;
if missing( G_Bsmt_Qual ) then do;
   G_Bsmt_Qual0 = .;
   G_Bsmt_Qual1 = .;
   G_Bsmt_Qual2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bsmt_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_Bsmt_Qual0 = 0;
      G_Bsmt_Qual1 = 1;
      G_Bsmt_Qual2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_Bsmt_Qual0 = 0;
      G_Bsmt_Qual1 = 0;
      G_Bsmt_Qual2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_Bsmt_Qual0 = -1;
      G_Bsmt_Qual1 = -1;
      G_Bsmt_Qual2 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Bsmt_Qual0 = 1;
      G_Bsmt_Qual1 = 0;
      G_Bsmt_Qual2 = 0;
   end;
   else do;
      G_Bsmt_Qual0 = .;
      G_Bsmt_Qual1 = .;
      G_Bsmt_Qual2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Condition_1 ;
drop G_Condition_10 G_Condition_11 G_Condition_12 G_Condition_13 ;
*** encoding is sparse, initialize to zero;
G_Condition_10 = 0;
G_Condition_11 = 0;
G_Condition_12 = 0;
G_Condition_13 = 0;
if missing( G_Condition_1 ) then do;
   G_Condition_10 = .;
   G_Condition_11 = .;
   G_Condition_12 = .;
   G_Condition_13 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Condition_1 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Condition_12 = 1;
   end;
   else if _dm12 = '1'  then do;
      G_Condition_11 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Condition_10 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_Condition_10 = -1;
      G_Condition_11 = -1;
      G_Condition_12 = -1;
      G_Condition_13 = -1;
   end;
   else if _dm12 = '3'  then do;
      G_Condition_13 = 1;
   end;
   else do;
      G_Condition_10 = .;
      G_Condition_11 = .;
      G_Condition_12 = .;
      G_Condition_13 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Condition_2 ;
drop G_Condition_20 G_Condition_21 G_Condition_22 ;
if missing( G_Condition_2 ) then do;
   G_Condition_20 = .;
   G_Condition_21 = .;
   G_Condition_22 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Condition_2 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_Condition_20 = 0;
      G_Condition_21 = 1;
      G_Condition_22 = 0;
   end;
   else if _dm12 = '0'  then do;
      G_Condition_20 = 1;
      G_Condition_21 = 0;
      G_Condition_22 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_Condition_20 = -1;
      G_Condition_21 = -1;
      G_Condition_22 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_Condition_20 = 0;
      G_Condition_21 = 0;
      G_Condition_22 = 1;
   end;
   else do;
      G_Condition_20 = .;
      G_Condition_21 = .;
      G_Condition_22 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Exterior_1st ;
drop G_Exterior_1st0 G_Exterior_1st1 G_Exterior_1st2 G_Exterior_1st3
        G_Exterior_1st4 G_Exterior_1st5 G_Exterior_1st6 G_Exterior_1st7 ;
*** encoding is sparse, initialize to zero;
G_Exterior_1st0 = 0;
G_Exterior_1st1 = 0;
G_Exterior_1st2 = 0;
G_Exterior_1st3 = 0;
G_Exterior_1st4 = 0;
G_Exterior_1st5 = 0;
G_Exterior_1st6 = 0;
G_Exterior_1st7 = 0;
if missing( G_Exterior_1st ) then do;
   G_Exterior_1st0 = .;
   G_Exterior_1st1 = .;
   G_Exterior_1st2 = .;
   G_Exterior_1st3 = .;
   G_Exterior_1st4 = .;
   G_Exterior_1st5 = .;
   G_Exterior_1st6 = .;
   G_Exterior_1st7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Exterior_1st , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_Exterior_1st0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_Exterior_1st1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               G_Exterior_1st2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            G_Exterior_1st3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               G_Exterior_1st4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            G_Exterior_1st5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               G_Exterior_1st6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            G_Exterior_1st7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               G_Exterior_1st0 = -1;
               G_Exterior_1st1 = -1;
               G_Exterior_1st2 = -1;
               G_Exterior_1st3 = -1;
               G_Exterior_1st4 = -1;
               G_Exterior_1st5 = -1;
               G_Exterior_1st6 = -1;
               G_Exterior_1st7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_Exterior_1st0 = .;
      G_Exterior_1st1 = .;
      G_Exterior_1st2 = .;
      G_Exterior_1st3 = .;
      G_Exterior_1st4 = .;
      G_Exterior_1st5 = .;
      G_Exterior_1st6 = .;
      G_Exterior_1st7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Functional ;
drop G_Functional0 G_Functional1 G_Functional2 ;
if missing( G_Functional ) then do;
   G_Functional0 = .;
   G_Functional1 = .;
   G_Functional2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Functional , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      G_Functional0 = -1;
      G_Functional1 = -1;
      G_Functional2 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_Functional0 = 0;
      G_Functional1 = 0;
      G_Functional2 = 1;
   end;
   else if _dm12 = '1'  then do;
      G_Functional0 = 0;
      G_Functional1 = 1;
      G_Functional2 = 0;
   end;
   else if _dm12 = '0'  then do;
      G_Functional0 = 1;
      G_Functional1 = 0;
      G_Functional2 = 0;
   end;
   else do;
      G_Functional0 = .;
      G_Functional1 = .;
      G_Functional2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Garage_Qual ;
drop G_Garage_Qual0 G_Garage_Qual1 G_Garage_Qual2 ;
if missing( G_Garage_Qual ) then do;
   G_Garage_Qual0 = .;
   G_Garage_Qual1 = .;
   G_Garage_Qual2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Garage_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Garage_Qual0 = 0;
      G_Garage_Qual1 = 0;
      G_Garage_Qual2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Garage_Qual0 = 1;
      G_Garage_Qual1 = 0;
      G_Garage_Qual2 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Garage_Qual0 = 0;
      G_Garage_Qual1 = 1;
      G_Garage_Qual2 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_Garage_Qual0 = -1;
      G_Garage_Qual1 = -1;
      G_Garage_Qual2 = -1;
   end;
   else do;
      G_Garage_Qual0 = .;
      G_Garage_Qual1 = .;
      G_Garage_Qual2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_House_Style ;
drop G_House_Style0 G_House_Style1 G_House_Style2 G_House_Style3
        G_House_Style4 ;
*** encoding is sparse, initialize to zero;
G_House_Style0 = 0;
G_House_Style1 = 0;
G_House_Style2 = 0;
G_House_Style3 = 0;
G_House_Style4 = 0;
if missing( G_House_Style ) then do;
   G_House_Style0 = .;
   G_House_Style1 = .;
   G_House_Style2 = .;
   G_House_Style3 = .;
   G_House_Style4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_House_Style , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      G_House_Style4 = 1;
   end;
   else if _dm12 = '5'  then do;
      G_House_Style0 = -1;
      G_House_Style1 = -1;
      G_House_Style2 = -1;
      G_House_Style3 = -1;
      G_House_Style4 = -1;
   end;
   else if _dm12 = '1'  then do;
      G_House_Style1 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_House_Style3 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_House_Style2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_House_Style0 = 1;
   end;
   else do;
      G_House_Style0 = .;
      G_House_Style1 = .;
      G_House_Style2 = .;
      G_House_Style3 = .;
      G_House_Style4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Kitchen_Qual ;
drop G_Kitchen_Qual0 G_Kitchen_Qual1 G_Kitchen_Qual2 ;
if missing( G_Kitchen_Qual ) then do;
   G_Kitchen_Qual0 = .;
   G_Kitchen_Qual1 = .;
   G_Kitchen_Qual2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Kitchen_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_Kitchen_Qual0 = 0;
      G_Kitchen_Qual1 = 1;
      G_Kitchen_Qual2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_Kitchen_Qual0 = 0;
      G_Kitchen_Qual1 = 0;
      G_Kitchen_Qual2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_Kitchen_Qual0 = -1;
      G_Kitchen_Qual1 = -1;
      G_Kitchen_Qual2 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Kitchen_Qual0 = 1;
      G_Kitchen_Qual1 = 0;
      G_Kitchen_Qual2 = 0;
   end;
   else do;
      G_Kitchen_Qual0 = .;
      G_Kitchen_Qual1 = .;
      G_Kitchen_Qual2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_MS_SubClass ;
drop G_MS_SubClass0 G_MS_SubClass1 G_MS_SubClass2 G_MS_SubClass3
        G_MS_SubClass4 G_MS_SubClass5 G_MS_SubClass6 G_MS_SubClass7 ;
*** encoding is sparse, initialize to zero;
G_MS_SubClass0 = 0;
G_MS_SubClass1 = 0;
G_MS_SubClass2 = 0;
G_MS_SubClass3 = 0;
G_MS_SubClass4 = 0;
G_MS_SubClass5 = 0;
G_MS_SubClass6 = 0;
G_MS_SubClass7 = 0;
if missing( G_MS_SubClass ) then do;
   G_MS_SubClass0 = .;
   G_MS_SubClass1 = .;
   G_MS_SubClass2 = .;
   G_MS_SubClass3 = .;
   G_MS_SubClass4 = .;
   G_MS_SubClass5 = .;
   G_MS_SubClass6 = .;
   G_MS_SubClass7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_MS_SubClass , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_MS_SubClass0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_MS_SubClass1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               G_MS_SubClass2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            G_MS_SubClass3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               G_MS_SubClass4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            G_MS_SubClass5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               G_MS_SubClass6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            G_MS_SubClass7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               G_MS_SubClass0 = -1;
               G_MS_SubClass1 = -1;
               G_MS_SubClass2 = -1;
               G_MS_SubClass3 = -1;
               G_MS_SubClass4 = -1;
               G_MS_SubClass5 = -1;
               G_MS_SubClass6 = -1;
               G_MS_SubClass7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_MS_SubClass0 = .;
      G_MS_SubClass1 = .;
      G_MS_SubClass2 = .;
      G_MS_SubClass3 = .;
      G_MS_SubClass4 = .;
      G_MS_SubClass5 = .;
      G_MS_SubClass6 = .;
      G_MS_SubClass7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Neighborhood ;
drop G_Neighborhood0 G_Neighborhood1 G_Neighborhood2 G_Neighborhood3
        G_Neighborhood4 G_Neighborhood5 G_Neighborhood6 G_Neighborhood7
        G_Neighborhood8 G_Neighborhood9 G_Neighborhood10 G_Neighborhood11
        G_Neighborhood12 ;
*** encoding is sparse, initialize to zero;
G_Neighborhood0 = 0;
G_Neighborhood1 = 0;
G_Neighborhood2 = 0;
G_Neighborhood3 = 0;
G_Neighborhood4 = 0;
G_Neighborhood5 = 0;
G_Neighborhood6 = 0;
G_Neighborhood7 = 0;
G_Neighborhood8 = 0;
G_Neighborhood9 = 0;
G_Neighborhood10 = 0;
G_Neighborhood11 = 0;
G_Neighborhood12 = 0;
if missing( G_Neighborhood ) then do;
   G_Neighborhood0 = .;
   G_Neighborhood1 = .;
   G_Neighborhood2 = .;
   G_Neighborhood3 = .;
   G_Neighborhood4 = .;
   G_Neighborhood5 = .;
   G_Neighborhood6 = .;
   G_Neighborhood7 = .;
   G_Neighborhood8 = .;
   G_Neighborhood9 = .;
   G_Neighborhood10 = .;
   G_Neighborhood11 = .;
   G_Neighborhood12 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Neighborhood , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '2'  then do;
      if _dm12 <= '11'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_Neighborhood0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_Neighborhood1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '10'  then do;
               G_Neighborhood10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  G_Neighborhood11 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm12 <= '13'  then do;
            if _dm12 = '12'  then do;
               G_Neighborhood12 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '13'  then do;
                  G_Neighborhood0 = -1;
                  G_Neighborhood1 = -1;
                  G_Neighborhood2 = -1;
                  G_Neighborhood3 = -1;
                  G_Neighborhood4 = -1;
                  G_Neighborhood5 = -1;
                  G_Neighborhood6 = -1;
                  G_Neighborhood7 = -1;
                  G_Neighborhood8 = -1;
                  G_Neighborhood9 = -1;
                  G_Neighborhood10 = -1;
                  G_Neighborhood11 = -1;
                  G_Neighborhood12 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               G_Neighborhood2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 <= '4'  then do;
            if _dm12 = '3'  then do;
               G_Neighborhood3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '4'  then do;
                  G_Neighborhood4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '5'  then do;
               G_Neighborhood5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  G_Neighborhood6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm12 <= '8'  then do;
            if _dm12 = '7'  then do;
               G_Neighborhood7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '8'  then do;
                  G_Neighborhood8 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '9'  then do;
               G_Neighborhood9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_Neighborhood0 = .;
      G_Neighborhood1 = .;
      G_Neighborhood2 = .;
      G_Neighborhood3 = .;
      G_Neighborhood4 = .;
      G_Neighborhood5 = .;
      G_Neighborhood6 = .;
      G_Neighborhood7 = .;
      G_Neighborhood8 = .;
      G_Neighborhood9 = .;
      G_Neighborhood10 = .;
      G_Neighborhood11 = .;
      G_Neighborhood12 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Pool_QC ;
drop G_Pool_QC0 G_Pool_QC1 ;
if missing( G_Pool_QC ) then do;
   G_Pool_QC0 = .;
   G_Pool_QC1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Pool_QC , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      G_Pool_QC0 = 1;
      G_Pool_QC1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Pool_QC0 = 0;
      G_Pool_QC1 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_Pool_QC0 = -1;
      G_Pool_QC1 = -1;
   end;
   else do;
      G_Pool_QC0 = .;
      G_Pool_QC1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Roof_Matl ;
drop G_Roof_Matl0 G_Roof_Matl1 ;
if missing( G_Roof_Matl ) then do;
   G_Roof_Matl0 = .;
   G_Roof_Matl1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Roof_Matl , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      G_Roof_Matl0 = 1;
      G_Roof_Matl1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Roof_Matl0 = 0;
      G_Roof_Matl1 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_Roof_Matl0 = -1;
      G_Roof_Matl1 = -1;
   end;
   else do;
      G_Roof_Matl0 = .;
      G_Roof_Matl1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Sale_Condition ;
drop G_Sale_Condition0 G_Sale_Condition1 G_Sale_Condition2 G_Sale_Condition3 ;
*** encoding is sparse, initialize to zero;
G_Sale_Condition0 = 0;
G_Sale_Condition1 = 0;
G_Sale_Condition2 = 0;
G_Sale_Condition3 = 0;
if missing( G_Sale_Condition ) then do;
   G_Sale_Condition0 = .;
   G_Sale_Condition1 = .;
   G_Sale_Condition2 = .;
   G_Sale_Condition3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Sale_Condition , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      G_Sale_Condition3 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_Sale_Condition0 = -1;
      G_Sale_Condition1 = -1;
      G_Sale_Condition2 = -1;
      G_Sale_Condition3 = -1;
   end;
   else if _dm12 = '1'  then do;
      G_Sale_Condition1 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_Sale_Condition2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Sale_Condition0 = 1;
   end;
   else do;
      G_Sale_Condition0 = .;
      G_Sale_Condition1 = .;
      G_Sale_Condition2 = .;
      G_Sale_Condition3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Land_Contour ;
drop Land_ContourBnk Land_ContourHLS Land_ContourLow ;
if missing( Land_Contour ) then do;
   Land_ContourBnk = .;
   Land_ContourHLS = .;
   Land_ContourLow = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm3 $ 3; drop _dm3 ;
   _dm3 = put( Land_Contour , $3. );
   %DMNORMIP( _dm3 )
   if _dm3 = 'LVL'  then do;
      Land_ContourBnk = -1;
      Land_ContourHLS = -1;
      Land_ContourLow = -1;
   end;
   else if _dm3 = 'BNK'  then do;
      Land_ContourBnk = 1;
      Land_ContourHLS = 0;
      Land_ContourLow = 0;
   end;
   else if _dm3 = 'HLS'  then do;
      Land_ContourBnk = 0;
      Land_ContourHLS = 1;
      Land_ContourLow = 0;
   end;
   else if _dm3 = 'LOW'  then do;
      Land_ContourBnk = 0;
      Land_ContourHLS = 0;
      Land_ContourLow = 1;
   end;
   else do;
      Land_ContourBnk = .;
      Land_ContourHLS = .;
      Land_ContourLow = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   BsmtFin_SF_1 ,
   Bsmt_Full_Bath ,
   Fireplaces ,
   Garage_Cars ,
   Gr_Liv_Area ,
   Lot_Area ,
   Mas_Vnr_Area ,
   Overall_Cond ,
   Overall_Qual ,
   Screen_Porch ,
   Year_Built   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_BsmtFin_SF_1  =    -0.96153100885837 +     0.00221183486145 *
        BsmtFin_SF_1 ;
   S_Bsmt_Full_Bath  =    -0.82459856246941 +     1.91131499377808 *
        Bsmt_Full_Bath ;
   S_Fireplaces  =    -0.92202510509383 +     1.52137851210575 * Fireplaces ;
   S_Garage_Cars  =    -2.28582075826966 +     1.29660557677166 * Garage_Cars
         ;
   S_Gr_Liv_Area  =     -2.9443318831283 +     0.00196143111399 * Gr_Liv_Area
         ;
   S_Lot_Area  =    -1.15195977345199 +     0.00011247944786 * Lot_Area ;
   S_Mas_Vnr_Area  =    -0.56336869431757 +     0.00543163954669 *
        Mas_Vnr_Area ;
   S_Overall_Cond  =    -4.94248904422934 +     0.88960465377045 *
        Overall_Cond ;
   S_Overall_Qual  =    -4.26941504880626 +     0.70136726192243 *
        Overall_Qual ;
   S_Screen_Porch  =    -0.27437495931404 +     0.01800950624229 *
        Screen_Porch ;
   S_Year_Built  =    -64.4030014959742 +     0.03267880084427 * Year_Built ;
END;
ELSE DO;
   IF MISSING( BsmtFin_SF_1 ) THEN S_BsmtFin_SF_1  = . ;
   ELSE S_BsmtFin_SF_1  =    -0.96153100885837 +     0.00221183486145 *
        BsmtFin_SF_1 ;
   IF MISSING( Bsmt_Full_Bath ) THEN S_Bsmt_Full_Bath  = . ;
   ELSE S_Bsmt_Full_Bath  =    -0.82459856246941 +     1.91131499377808 *
        Bsmt_Full_Bath ;
   IF MISSING( Fireplaces ) THEN S_Fireplaces  = . ;
   ELSE S_Fireplaces  =    -0.92202510509383 +     1.52137851210575 *
        Fireplaces ;
   IF MISSING( Garage_Cars ) THEN S_Garage_Cars  = . ;
   ELSE S_Garage_Cars  =    -2.28582075826966 +     1.29660557677166 *
        Garage_Cars ;
   IF MISSING( Gr_Liv_Area ) THEN S_Gr_Liv_Area  = . ;
   ELSE S_Gr_Liv_Area  =     -2.9443318831283 +     0.00196143111399 *
        Gr_Liv_Area ;
   IF MISSING( Lot_Area ) THEN S_Lot_Area  = . ;
   ELSE S_Lot_Area  =    -1.15195977345199 +     0.00011247944786 * Lot_Area ;
   IF MISSING( Mas_Vnr_Area ) THEN S_Mas_Vnr_Area  = . ;
   ELSE S_Mas_Vnr_Area  =    -0.56336869431757 +     0.00543163954669 *
        Mas_Vnr_Area ;
   IF MISSING( Overall_Cond ) THEN S_Overall_Cond  = . ;
   ELSE S_Overall_Cond  =    -4.94248904422934 +     0.88960465377045 *
        Overall_Cond ;
   IF MISSING( Overall_Qual ) THEN S_Overall_Qual  = . ;
   ELSE S_Overall_Qual  =    -4.26941504880626 +     0.70136726192243 *
        Overall_Qual ;
   IF MISSING( Screen_Porch ) THEN S_Screen_Porch  = . ;
   ELSE S_Screen_Porch  =    -0.27437495931404 +     0.01800950624229 *
        Screen_Porch ;
   IF MISSING( Year_Built ) THEN S_Year_Built  = . ;
   ELSE S_Year_Built  =    -64.4030014959742 +     0.03267880084427 *
        Year_Built ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node SalePrice ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =     5227.40266072366 * S_BsmtFin_SF_1
          +     2815.35400676215 * S_Bsmt_Full_Bath  +     2878.70494962383 *
        S_Fireplaces  +     6938.23453955189 * S_Garage_Cars
          +     28239.6982940866 * S_Gr_Liv_Area  +     2786.24100228244 *
        S_Lot_Area  +     3000.67359588753 * S_Mas_Vnr_Area
          +     6621.74170591161 * S_Overall_Cond  +     10523.6289743005 *
        S_Overall_Qual  +     2326.82989522682 * S_Screen_Porch
          +     11477.3099322135 * S_Year_Built ;
   P_SalePrice  = P_SalePrice  +     18323.3908456293 * Exter_QualEx
          +    -3747.81969465115 * Exter_QualFa  +    -5496.78631343448 *
        Exter_QualGd  +     6576.43439152072 * G_Bldg_Type0
          +    -11803.8511310936 * G_Bldg_Type1  +     11069.7326206742 *
        G_Bldg_Type2  +    -12018.5997177456 * G_Bsmt_Exposure0
          +     -5926.3135470005 * G_Bsmt_Exposure1  +    -3993.69337982956 *
        G_Bsmt_Exposure2  +     2465.45051412708 * G_Bsmt_Exposure3
          +    -4179.53826553494 * G_Bsmt_Qual0  +    -6406.37833887382 *
        G_Bsmt_Qual1  +     -6338.7659888788 * G_Bsmt_Qual2
          +    -4194.14166143839 * G_Condition_10  +     -6956.1748211086 *
        G_Condition_11  +     6676.25137890575 * G_Condition_12
          +    -8776.17077926023 * G_Condition_13  +     83434.0253912241 *
        G_Condition_20  +     81683.8185167449 * G_Condition_21
          +    -281269.591889402 * G_Condition_22  +    -9205.18903429622 *
        G_Exterior_1st0  +    -7693.16325850714 * G_Exterior_1st1
          +    -5863.34932983107 * G_Exterior_1st2  +    -6799.85913114806 *
        G_Exterior_1st3  +    -7840.12391954456 * G_Exterior_1st4
          +      12326.518364209 * G_Exterior_1st5  +    -3674.96002700849 *
        G_Exterior_1st6  +     1383.98500851179 * G_Exterior_1st7
          +    -21034.9332616708 * G_Functional0  +     -4876.2611618811 *
        G_Functional1  +     7648.46274249408 * G_Functional2
          +     4641.54799617732 * G_Garage_Qual0  +    -4352.49441075191 *
        G_Garage_Qual1  +    -3345.40185136413 * G_Garage_Qual2
          +     13595.3110119824 * G_House_Style0  +     2383.51337072715 *
        G_House_Style1  +    -5701.26479386345 * G_House_Style2
          +    -10055.6667452586 * G_House_Style3  +     5492.33350057085 *
        G_House_Style4  +    -5905.13878775844 * G_Kitchen_Qual0
          +     -7893.5750174146 * G_Kitchen_Qual1  +    -4678.74346560636 *
        G_Kitchen_Qual2  +     2133.52864045288 * G_MS_SubClass0
          +     -816.65574266161 * G_MS_SubClass1  +    -10240.6572797735 *
        G_MS_SubClass2  +    -548.381333693086 * G_MS_SubClass3
          +     4588.69077527124 * G_MS_SubClass4  +     6232.01490896497 *
        G_MS_SubClass5  +    -63.8259395952615 * G_MS_SubClass6
          +    -2344.29892365506 * G_MS_SubClass7  +    -11388.9625835982 *
        G_Neighborhood0  +    -12384.8369505073 * G_Neighborhood1
          +    -14547.1736664514 * G_Neighborhood2  +    -5696.04671276188 *
        G_Neighborhood3  +    -10819.1412766183 * G_Neighborhood4
          +    -8831.77811685591 * G_Neighborhood5  +    -2932.49112863548 *
        G_Neighborhood6  +    -11107.4711217846 * G_Neighborhood7
          +    -5232.34080321719 * G_Neighborhood8  +     6582.67897057485 *
        G_Neighborhood9  +     13037.4302202394 * G_Neighborhood10
          +    -2533.07973603471 * G_Neighborhood11  +     27656.1246422736 *
        G_Neighborhood12  +    -8795.46637669755 * G_Pool_QC0
          +    -121341.235935077 * G_Pool_QC1  +     -22920.455931956 *
        G_Roof_Matl0  +    -28693.8090176597 * G_Roof_Matl1
          +     12736.0089863779 * G_Sale_Condition0
          +     -14055.776082657 * G_Sale_Condition1
          +    -4929.32298035043 * G_Sale_Condition2
          +    -2106.92934601691 * G_Sale_Condition3
          +    -5081.64428552273 * Land_ContourBnk  +     6900.54210263946 *
        Land_ContourHLS  +    -3234.88904037224 * Land_ContourLow ;
   P_SalePrice  =     128334.198753497 + P_SalePrice ;
END;
ELSE DO;
   P_SalePrice  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_SalePrice  =     180180.371498771;
END;
*** *****************************;
*** Writing the Residuals  of the Node SalePrice ;
*** ******************************;
IF MISSING( SalePrice ) THEN R_SalePrice  = . ;
ELSE R_SalePrice  = SalePrice  - P_SalePrice ;
********************************;
*** End Scoring Code for Neural;
********************************;
drop S_:;
