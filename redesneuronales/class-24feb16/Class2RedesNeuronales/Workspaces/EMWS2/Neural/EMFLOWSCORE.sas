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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
*** Writing the Node intvl ;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.27098664007972 * S_BsmtFin_SF_1  +    -0.24565111141512 *
        S_Bsmt_Full_Bath  +     0.10303123930667 * S_Fireplaces
          +    -0.31302718706494 * S_Garage_Cars  +     0.20576789874513 *
        S_Gr_Liv_Area  +      0.0685941138018 * S_Lot_Area
          +    -0.11939259436048 * S_Mas_Vnr_Area  +     0.28597541288236 *
        S_Overall_Cond  +     0.14523817251923 * S_Overall_Qual
          +    -0.01114661503234 * S_Screen_Porch  +     0.70420649114232 *
        S_Year_Built ;
   H12  =     0.10746310972958 * S_BsmtFin_SF_1  +     0.01601310400161 *
        S_Bsmt_Full_Bath  +     0.04138551645451 * S_Fireplaces
          +     0.01794709280637 * S_Garage_Cars  +     0.36661517956416 *
        S_Gr_Liv_Area  +     0.07234591528742 * S_Lot_Area
          +     0.00471368353233 * S_Mas_Vnr_Area  +     0.13342304292606 *
        S_Overall_Cond  +     0.12640517068271 * S_Overall_Qual
          +     0.02250747788176 * S_Screen_Porch  +     0.24677142789632 *
        S_Year_Built ;
   H13  =     0.02537344402086 * S_BsmtFin_SF_1  +     0.01591192261312 *
        S_Bsmt_Full_Bath  +     0.02893583972823 * S_Fireplaces
          +      0.0627428034689 * S_Garage_Cars  +      0.3018559724153 *
        S_Gr_Liv_Area  +    -0.04944422127604 * S_Lot_Area
          +    -0.00815773340884 * S_Mas_Vnr_Area  +      0.1003983361941 *
        S_Overall_Cond  +     0.03000015864879 * S_Overall_Qual
          +     0.01909806183114 * S_Screen_Porch  +     0.14251742257067 *
        S_Year_Built ;
   H11  = H11  +    -0.07731184228798 * Exter_QualEx
          +    -0.67604618244105 * Exter_QualFa  +     0.32739405621291 *
        Exter_QualGd  +     0.17352158857136 * G_Bldg_Type0
          +     0.89327196869613 * G_Bldg_Type1  +     0.06920202000215 *
        G_Bldg_Type2  +    -0.19681778523867 * G_Bsmt_Exposure0
          +     0.01722066544733 * G_Bsmt_Exposure1  +     0.21530303148744 *
        G_Bsmt_Exposure2  +    -0.27328794449229 * G_Bsmt_Exposure3
          +    -0.24128623234384 * G_Bsmt_Qual0  +     0.73410989009211 *
        G_Bsmt_Qual1  +      0.1013370728555 * G_Bsmt_Qual2
          +     0.55173382124357 * G_Condition_10  +    -0.09883551536567 *
        G_Condition_11  +     0.02711124545933 * G_Condition_12
          +     0.19139383381082 * G_Condition_13  +      -0.173069022499 *
        G_Condition_20  +    -1.14735203497676 * G_Condition_21
          +     0.34881992315133 * G_Condition_22  +     -0.3649467544858 *
        G_Exterior_1st0  +    -0.71009166203725 * G_Exterior_1st1
          +    -0.37888732198759 * G_Exterior_1st2  +    -0.25054037897822 *
        G_Exterior_1st3  +    -0.99150932611365 * G_Exterior_1st4
          +    -0.06322306569102 * G_Exterior_1st5  +     0.04044597297954 *
        G_Exterior_1st6  +     0.35577101278321 * G_Exterior_1st7
          +      0.0924329004242 * G_Functional0  +     0.26388793576455 *
        G_Functional1  +    -0.29345740996646 * G_Functional2
          +    -0.81109971493573 * G_Garage_Qual0  +     0.28157204887452 *
        G_Garage_Qual1  +     0.04251432118308 * G_Garage_Qual2
          +     0.05959388510386 * G_House_Style0  +    -0.22580676088702 *
        G_House_Style1  +    -0.08391523035278 * G_House_Style2
          +     0.28634279185107 * G_House_Style3  +    -0.28919728049484 *
        G_House_Style4  +    -0.58631007358678 * G_Kitchen_Qual0
          +    -0.26807751210672 * G_Kitchen_Qual1  +     0.45560148550336 *
        G_Kitchen_Qual2  +    -0.35839966949769 * G_MS_SubClass0
          +      0.0034851476378 * G_MS_SubClass1  +    -0.16477326519012 *
        G_MS_SubClass2  +     0.25485901616679 * G_MS_SubClass3
          +    -0.07523338778647 * G_MS_SubClass4  +     0.22956886694145 *
        G_MS_SubClass5  +       0.483968493965 * G_MS_SubClass6
          +    -0.39907854421871 * G_MS_SubClass7  +    -0.83910472010297 *
        G_Neighborhood0  +     0.85108779840761 * G_Neighborhood1
          +     0.15198575753925 * G_Neighborhood2  +     0.35782806658138 *
        G_Neighborhood3  +     0.29830486586406 * G_Neighborhood4
          +     0.10655174938515 * G_Neighborhood5  +    -0.25153908808155 *
        G_Neighborhood6  +     0.01419305503747 * G_Neighborhood7
          +    -0.21115102542647 * G_Neighborhood8  +      0.2000108665718 *
        G_Neighborhood9  +    -0.18153037957405 * G_Neighborhood10
          +     0.01545277024934 * G_Neighborhood11  +    -0.64958072551108 *
        G_Neighborhood12  +      -0.295935654015 * G_Pool_QC0
          +     1.13128140576044 * G_Pool_QC1  +     0.22539572572403 *
        G_Roof_Matl0  +     0.84982798614963 * G_Roof_Matl1
          +     0.17197330548307 * G_Sale_Condition0
          +    -0.19498586499217 * G_Sale_Condition1
          +     -0.1825529179884 * G_Sale_Condition2
          +    -0.22431503765384 * G_Sale_Condition3
          +    -0.01787156449452 * Land_ContourBnk  +    -0.16454799101257 *
        Land_ContourHLS  +      0.6869770783205 * Land_ContourLow ;
   H12  = H12  +     0.29518532422946 * Exter_QualEx
          +     -0.4407150660543 * Exter_QualFa  +     0.05129645627468 *
        Exter_QualGd  +    -1.46728239692537 * G_Bldg_Type0
          +     0.46020062652217 * G_Bldg_Type1  +     0.60956696737365 *
        G_Bldg_Type2  +    -0.23959134694739 * G_Bsmt_Exposure0
          +     0.01711894127856 * G_Bsmt_Exposure1  +     0.02161190003756 *
        G_Bsmt_Exposure2  +     0.07577303145662 * G_Bsmt_Exposure3
          +     0.23198721474812 * G_Bsmt_Qual0  +    -0.04141047322624 *
        G_Bsmt_Qual1  +    -0.08273810430862 * G_Bsmt_Qual2
          +    -0.21494261915173 * G_Condition_10  +     0.04524851205274 *
        G_Condition_11  +     0.26797591536575 * G_Condition_12
          +    -0.25996786992755 * G_Condition_13  +    -0.67729409022087 *
        G_Condition_20  +    -0.37173362092669 * G_Condition_21
          +     0.20750677184822 * G_Condition_22  +    -0.46447785317521 *
        G_Exterior_1st0  +    -0.13607844883345 * G_Exterior_1st1
          +     -0.0069163463012 * G_Exterior_1st2  +      -0.150702191414 *
        G_Exterior_1st3  +    -0.16290805486799 * G_Exterior_1st4
          +       0.172251912541 * G_Exterior_1st5  +    -0.02420418887257 *
        G_Exterior_1st6  +     0.00321538724891 * G_Exterior_1st7
          +      0.4942979394424 * G_Functional0  +     0.18519651441775 *
        G_Functional1  +     -0.4624214913049 * G_Functional2
          +    -0.22362145456044 * G_Garage_Qual0  +     0.02694494984209 *
        G_Garage_Qual1  +     0.11281651696307 * G_Garage_Qual2
          +     0.41645206014061 * G_House_Style0  +    -0.03607943228182 *
        G_House_Style1  +    -0.16807181286191 * G_House_Style2
          +     0.03754029486388 * G_House_Style3  +    -0.23679484494849 *
        G_House_Style4  +    -0.09676961981782 * G_Kitchen_Qual0
          +     -0.0403574926688 * G_Kitchen_Qual1  +     0.02396956121618 *
        G_Kitchen_Qual2  +     0.54566706315873 * G_MS_SubClass0
          +    -0.08035369573794 * G_MS_SubClass1  +    -1.51701555540044 *
        G_MS_SubClass2  +     0.06016224820969 * G_MS_SubClass3
          +     0.28663909731251 * G_MS_SubClass4  +    -0.02276518852812 *
        G_MS_SubClass5  +     0.36482675815498 * G_MS_SubClass6
          +       0.425096005522 * G_MS_SubClass7  +    -0.07338296668835 *
        G_Neighborhood0  +     0.07250934403312 * G_Neighborhood1
          +     0.06599821925506 * G_Neighborhood2  +    -0.68434286300993 *
        G_Neighborhood3  +    -0.19235044048543 * G_Neighborhood4
          +     0.14294767998782 * G_Neighborhood5  +     0.08215516336045 *
        G_Neighborhood6  +    -0.09636439955823 * G_Neighborhood7
          +     0.08205074389742 * G_Neighborhood8  +     0.04466501290317 *
        G_Neighborhood9  +     0.31111711275951 * G_Neighborhood10
          +    -0.08226813269039 * G_Neighborhood11  +     0.24259055480882 *
        G_Neighborhood12  +     -0.1369098142541 * G_Pool_QC0
          +     0.28074517655609 * G_Pool_QC1  +    -0.01691289967522 *
        G_Roof_Matl0  +    -0.05346902512781 * G_Roof_Matl1
          +     0.13453921967277 * G_Sale_Condition0
          +    -0.29857102782539 * G_Sale_Condition1
          +    -0.06139812619686 * G_Sale_Condition2
          +     0.00503740751209 * G_Sale_Condition3
          +    -0.06882725773331 * Land_ContourBnk  +     0.11594123480771 *
        Land_ContourHLS  +    -0.00109826363072 * Land_ContourLow ;
   H13  = H13  +    -0.53439711184461 * Exter_QualEx
          +     0.18396944352839 * Exter_QualFa  +     0.21780886022538 *
        Exter_QualGd  +     0.12410783218091 * G_Bldg_Type0
          +    -0.15040757354053 * G_Bldg_Type1  +     0.04408441920054 *
        G_Bldg_Type2  +    -0.17030439583376 * G_Bsmt_Exposure0
          +    -0.04417891286448 * G_Bsmt_Exposure1  +      -0.007282289261 *
        G_Bsmt_Exposure2  +    -0.01538911955684 * G_Bsmt_Exposure3
          +    -0.15490707986553 * G_Bsmt_Qual0  +    -0.06508900978204 *
        G_Bsmt_Qual1  +     -0.0298218229847 * G_Bsmt_Qual2
          +    -0.06795200997914 * G_Condition_10  +    -0.12250887725657 *
        G_Condition_11  +    -0.02979320426244 * G_Condition_12
          +    -0.27551690244438 * G_Condition_13  +     0.21036224198317 *
        G_Condition_20  +    -0.11469659944612 * G_Condition_21
          +    -0.01356542851821 * G_Condition_22  +    -0.19398803949361 *
        G_Exterior_1st0  +    -0.23584954459197 * G_Exterior_1st1
          +    -0.25984659922383 * G_Exterior_1st2  +    -0.23187254901315 *
        G_Exterior_1st3  +    -0.25701161474387 * G_Exterior_1st4
          +    -0.21540101909186 * G_Exterior_1st5  +    -0.24255841357312 *
        G_Exterior_1st6  +    -0.38303762305958 * G_Exterior_1st7
          +    -0.32731460728317 * G_Functional0  +    -0.33180251755002 *
        G_Functional1  +     0.34413128153617 * G_Functional2
          +    -0.02832516960569 * G_Garage_Qual0  +    -0.09333595900542 *
        G_Garage_Qual1  +    -0.07106700808006 * G_Garage_Qual2
          +      0.0644325942182 * G_House_Style0  +    -0.02190929298109 *
        G_House_Style1  +      0.0888309931892 * G_House_Style2
          +    -0.16043326346018 * G_House_Style3  +      0.1377765123027 *
        G_House_Style4  +    -0.09576780018454 * G_Kitchen_Qual0
          +    -0.07172875140639 * G_Kitchen_Qual1  +     0.01192827618415 *
        G_Kitchen_Qual2  +    -0.15111430570235 * G_MS_SubClass0
          +    -0.02752550340404 * G_MS_SubClass1  +    -0.03879219204008 *
        G_MS_SubClass2  +     0.02054504693568 * G_MS_SubClass3
          +     -0.0239106219325 * G_MS_SubClass4  +     0.23174726826903 *
        G_MS_SubClass5  +    -0.11796255074191 * G_MS_SubClass6
          +    -0.11920331064323 * G_MS_SubClass7  +    -0.21199130747826 *
        G_Neighborhood0  +    -0.19539221017687 * G_Neighborhood1
          +    -0.23261757939516 * G_Neighborhood2  +     0.06349964188592 *
        G_Neighborhood3  +    -0.03012480831468 * G_Neighborhood4
          +    -0.17005916828581 * G_Neighborhood5  +    -0.07799419455097 *
        G_Neighborhood6  +     0.07446782367594 * G_Neighborhood7
          +     -0.2202383370501 * G_Neighborhood8  +     0.20212816299676 *
        G_Neighborhood9  +    -0.32009108085205 * G_Neighborhood10
          +     0.77379121016626 * G_Neighborhood11  +    -0.12084454782514 *
        G_Neighborhood12  +     0.15268313281949 * G_Pool_QC0
          +      0.2917509850599 * G_Pool_QC1  +    -0.12816222573948 *
        G_Roof_Matl0  +     0.01047484271892 * G_Roof_Matl1
          +     0.23355179830617 * G_Sale_Condition0
          +    -0.07894762205571 * G_Sale_Condition1
          +    -0.02736824622126 * G_Sale_Condition2
          +     0.00917675073051 * G_Sale_Condition3
          +     0.00849877131715 * Land_ContourBnk  +    -0.03036916906912 *
        Land_ContourHLS  +     0.02908959400325 * Land_ContourLow ;
   H11  =    -1.35437410272684 + H11 ;
   H12  =    -1.34873128392253 + H12 ;
   H13  =     0.92787627923538 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =    -55558.8317039812 * H11  +      141020.29651853 * H12
          +      74108.315831922 * H13 ;
   P_SalePrice  =     178474.440363569 + P_SalePrice ;
END;
ELSE DO;
   P_SalePrice  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_SalePrice  =     180180.371498771;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( SalePrice ) THEN R_SalePrice  = . ;
ELSE R_SalePrice  = SalePrice  - P_SalePrice ;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
drop S_:;
