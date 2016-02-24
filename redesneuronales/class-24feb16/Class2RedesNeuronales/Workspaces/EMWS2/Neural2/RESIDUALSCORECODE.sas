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

      label H101 = 'Hidden: H1=1' ;

      label H102 = 'Hidden: H1=2' ;

      label H103 = 'Hidden: H1=3' ;

      label H104 = 'Hidden: H1=4' ;

      label H105 = 'Hidden: H1=5' ;

      label H106 = 'Hidden: H1=6' ;

      label H107 = 'Hidden: H1=7' ;

      label H108 = 'Hidden: H1=8' ;

      label H109 = 'Hidden: H1=9' ;

      label H110 = 'Hidden: H1=10' ;

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
   H101  =    -0.15863204105948 * S_BsmtFin_SF_1  +    -0.12020000168117 * 
        S_Bsmt_Full_Bath  +    -0.11137074022457 * S_Fireplaces
          +     0.10661080999198 * S_Garage_Cars  +    -0.40072139968362 * 
        S_Gr_Liv_Area  +    -0.14154677846464 * S_Lot_Area
          +    -0.13800928126457 * S_Mas_Vnr_Area  +     0.13230119813681 * 
        S_Overall_Cond  +    -0.11403739455697 * S_Overall_Qual
          +    -0.07101378390031 * S_Screen_Porch  +    -0.13719632704256 * 
        S_Year_Built ;
   H102  =    -0.16819706902059 * S_BsmtFin_SF_1  +    -0.09445168759766 * 
        S_Bsmt_Full_Bath  +     0.08334292058789 * S_Fireplaces
          +     0.18831888656385 * S_Garage_Cars  +     0.04765374592858 * 
        S_Gr_Liv_Area  +    -0.14536473944041 * S_Lot_Area
          +     0.16636688523726 * S_Mas_Vnr_Area  +     0.13449479466259 * 
        S_Overall_Cond  +     0.30275416020204 * S_Overall_Qual
          +     0.26058400494637 * S_Screen_Porch  +    -0.14724287909103 * 
        S_Year_Built ;
   H103  =     0.11905670154396 * S_BsmtFin_SF_1  +    -0.00046783889155 * 
        S_Bsmt_Full_Bath  +     0.01070629833112 * S_Fireplaces
          +     0.13121396892026 * S_Garage_Cars  +     0.22670456398279 * 
        S_Gr_Liv_Area  +    -0.01874899521133 * S_Lot_Area
          +     0.04893865579461 * S_Mas_Vnr_Area  +     0.17651534493573 * 
        S_Overall_Cond  +     0.22810183367662 * S_Overall_Qual
          +     0.05577078013553 * S_Screen_Porch  +      0.2388895439639 * 
        S_Year_Built ;
   H104  =    -0.00949076858067 * S_BsmtFin_SF_1  +     0.16845950092597 * 
        S_Bsmt_Full_Bath  +     0.06641875135622 * S_Fireplaces
          +      0.1630075101235 * S_Garage_Cars  +     0.00243623266354 * 
        S_Gr_Liv_Area  +     0.17416397663424 * S_Lot_Area
          +     0.00015371553808 * S_Mas_Vnr_Area  +    -0.04433412026982 * 
        S_Overall_Cond  +     -0.2050564339017 * S_Overall_Qual
          +    -0.28629085197949 * S_Screen_Porch  +     0.06561587242892 * 
        S_Year_Built ;
   H105  =    -0.27745964444439 * S_BsmtFin_SF_1  +    -0.04802047919614 * 
        S_Bsmt_Full_Bath  +    -0.08511400980503 * S_Fireplaces
          +     0.10241601337257 * S_Garage_Cars  +     0.03903232601059 * 
        S_Gr_Liv_Area  +     0.10441236595679 * S_Lot_Area
          +    -0.05741355197106 * S_Mas_Vnr_Area  +    -0.02114118843528 * 
        S_Overall_Cond  +    -0.00239456446262 * S_Overall_Qual
          +     0.02074170017825 * S_Screen_Porch  +    -0.00171892478662 * 
        S_Year_Built ;
   H106  =    -0.30774973715756 * S_BsmtFin_SF_1  +    -0.06110525812694 * 
        S_Bsmt_Full_Bath  +    -0.08573044058541 * S_Fireplaces
          +     0.09196902752007 * S_Garage_Cars  +    -0.10752754947394 * 
        S_Gr_Liv_Area  +    -0.01901976917986 * S_Lot_Area
          +     0.07177822231863 * S_Mas_Vnr_Area  +     0.23189314289928 * 
        S_Overall_Cond  +     0.05083369643019 * S_Overall_Qual
          +     0.15386739576875 * S_Screen_Porch  +    -0.14546853935208 * 
        S_Year_Built ;
   H107  =    -0.09330962809865 * S_BsmtFin_SF_1  +    -0.10413973605389 * 
        S_Bsmt_Full_Bath  +     0.03079470473152 * S_Fireplaces
          +     0.11942233471677 * S_Garage_Cars  +     0.02238322336542 * 
        S_Gr_Liv_Area  +     -0.0623313346386 * S_Lot_Area
          +    -0.10504679554694 * S_Mas_Vnr_Area  +    -0.03502784586044 * 
        S_Overall_Cond  +    -0.05526005141162 * S_Overall_Qual
          +     0.27707215824348 * S_Screen_Porch  +     0.33963602571139 * 
        S_Year_Built ;
   H108  =     0.08179889616359 * S_BsmtFin_SF_1  +     0.01106210062297 * 
        S_Bsmt_Full_Bath  +    -0.04576368217653 * S_Fireplaces
          +     0.06092183471713 * S_Garage_Cars  +     0.42207752486312 * 
        S_Gr_Liv_Area  +     0.05166219856633 * S_Lot_Area
          +    -0.01113194379448 * S_Mas_Vnr_Area  +     0.06939558821175 * 
        S_Overall_Cond  +     0.07729497566265 * S_Overall_Qual
          +     0.04163382910616 * S_Screen_Porch  +     0.28447054889228 * 
        S_Year_Built ;
   H109  =     0.05955943791541 * S_BsmtFin_SF_1  +      0.1304995312682 * 
        S_Bsmt_Full_Bath  +     0.16684278423968 * S_Fireplaces
          +    -0.03655238214296 * S_Garage_Cars  +     0.64647143661662 * 
        S_Gr_Liv_Area  +     0.44374849713993 * S_Lot_Area
          +    -0.11288976561855 * S_Mas_Vnr_Area  +     0.08979540314881 * 
        S_Overall_Cond  +    -0.07308579792938 * S_Overall_Qual
          +    -0.14864956691227 * S_Screen_Porch  +     0.13354023518086 * 
        S_Year_Built ;
   H110  =    -0.08181835221396 * S_BsmtFin_SF_1  +    -0.08329396748206 * 
        S_Bsmt_Full_Bath  +    -0.16577036019061 * S_Fireplaces
          +    -0.04807023699929 * S_Garage_Cars  +     -0.1980846879696 * 
        S_Gr_Liv_Area  +     -0.2795087326333 * S_Lot_Area
          +    -0.06399568535724 * S_Mas_Vnr_Area  +    -0.20578441035441 * 
        S_Overall_Cond  +    -0.39048376694503 * S_Overall_Qual
          +      0.0324205641156 * S_Screen_Porch  +    -0.13293669665526 * 
        S_Year_Built ;
   H101  = H101  +    -0.24359855066091 * Exter_QualEx
          +     0.06110572767243 * Exter_QualFa  +    -0.04021422647005 * 
        Exter_QualGd  +     0.24826132119231 * G_Bldg_Type0
          +    -0.13416021760434 * G_Bldg_Type1  +     0.14230161149275 * 
        G_Bldg_Type2  +    -0.02337389052381 * G_Bsmt_Exposure0
          +     0.37114127899868 * G_Bsmt_Exposure1  +     0.10335291080426 * 
        G_Bsmt_Exposure2  +    -0.02046505586315 * G_Bsmt_Exposure3
          +     0.08190248703999 * G_Bsmt_Qual0  +     0.12732351028258 * 
        G_Bsmt_Qual1  +     0.18311515176429 * G_Bsmt_Qual2
          +     0.22818362174671 * G_Condition_10  +      0.0033429642431 * 
        G_Condition_11  +     0.02871657833011 * G_Condition_12
          +     0.10653106278318 * G_Condition_13  +    -0.00478625242232 * 
        G_Condition_20  +     0.11329071858061 * G_Condition_21
          +     0.01689408772379 * G_Condition_22  +     0.09186822677705 * 
        G_Exterior_1st0  +      0.2136939766979 * G_Exterior_1st1
          +       0.083314997034 * G_Exterior_1st2  +     0.03827996968916 * 
        G_Exterior_1st3  +    -0.01165095058514 * G_Exterior_1st4
          +    -0.01991830782236 * G_Exterior_1st5  +    -0.05164281689683 * 
        G_Exterior_1st6  +    -0.09658910238141 * G_Exterior_1st7
          +    -0.42135972234055 * G_Functional0  +     -0.2943943172509 * 
        G_Functional1  +      0.0386151469147 * G_Functional2
          +    -0.07461623516313 * G_Garage_Qual0  +    -0.22025699156637 * 
        G_Garage_Qual1  +     0.21304480245025 * G_Garage_Qual2
          +    -0.05823630747693 * G_House_Style0  +     0.06442889256079 * 
        G_House_Style1  +     0.14370756390353 * G_House_Style2
          +    -0.05794695057986 * G_House_Style3  +    -0.04822820439023 * 
        G_House_Style4  +    -0.09723662060798 * G_Kitchen_Qual0
          +     0.25349573734112 * G_Kitchen_Qual1  +     0.17600342343432 * 
        G_Kitchen_Qual2  +    -0.15853646735015 * G_MS_SubClass0
          +    -0.00241895081346 * G_MS_SubClass1  +    -0.00267672945511 * 
        G_MS_SubClass2  +     0.00482752938676 * G_MS_SubClass3
          +    -0.04705812266187 * G_MS_SubClass4  +     0.03046557765161 * 
        G_MS_SubClass5  +      0.1418018194129 * G_MS_SubClass6
          +     0.24414703899731 * G_MS_SubClass7  +    -0.02408510367742 * 
        G_Neighborhood0  +     0.10023461448193 * G_Neighborhood1
          +     0.05676703125664 * G_Neighborhood2  +    -0.04381660367716 * 
        G_Neighborhood3  +     0.08671699121524 * G_Neighborhood4
          +     0.02260477838685 * G_Neighborhood5  +     0.10821226566003 * 
        G_Neighborhood6  +     0.05696049367179 * G_Neighborhood7
          +     -0.0609458355604 * G_Neighborhood8  +     0.23402851079849 * 
        G_Neighborhood9  +    -0.00870433540063 * G_Neighborhood10
          +     0.15894107890661 * G_Neighborhood11  +    -0.14450458799365 * 
        G_Neighborhood12  +     0.36671833509224 * G_Pool_QC0
          +     0.05045527628116 * G_Pool_QC1  +     0.07322124515746 * 
        G_Roof_Matl0  +     0.23517309885199 * G_Roof_Matl1
          +     0.11792267064853 * G_Sale_Condition0
          +     0.03343745570051 * G_Sale_Condition1
          +     0.03883389553432 * G_Sale_Condition2
          +      0.1757178504313 * G_Sale_Condition3
          +    -0.08901913888917 * Land_ContourBnk  +    -0.04070105702152 * 
        Land_ContourHLS  +    -0.10879471109786 * Land_ContourLow ;
   H102  = H102  +     0.15554466709287 * Exter_QualEx
          +    -0.06616059479254 * Exter_QualFa  +     0.00884059004219 * 
        Exter_QualGd  +    -0.04810688575121 * G_Bldg_Type0
          +     0.01445483955895 * G_Bldg_Type1  +     0.15142956226185 * 
        G_Bldg_Type2  +     -0.0965551437883 * G_Bsmt_Exposure0
          +    -0.13397184039347 * G_Bsmt_Exposure1  +     -0.0423308195632 * 
        G_Bsmt_Exposure2  +     0.01640732217501 * G_Bsmt_Exposure3
          +    -0.10105166532377 * G_Bsmt_Qual0  +    -0.10168802610921 * 
        G_Bsmt_Qual1  +     -0.0516438952029 * G_Bsmt_Qual2
          +     0.01521583061239 * G_Condition_10  +     0.04518234908586 * 
        G_Condition_11  +     0.18584614219315 * G_Condition_12
          +     -0.0032920653068 * G_Condition_13  +     0.15261560691489 * 
        G_Condition_20  +     0.00997146570693 * G_Condition_21
          +     0.02646761810529 * G_Condition_22  +     0.21348344666657 * 
        G_Exterior_1st0  +    -0.04825071506303 * G_Exterior_1st1
          +    -0.11945919929622 * G_Exterior_1st2  +     0.11186318974851 * 
        G_Exterior_1st3  +    -0.06244191213828 * G_Exterior_1st4
          +     0.04449760777301 * G_Exterior_1st5  +     0.04788352472973 * 
        G_Exterior_1st6  +    -0.01358967451343 * G_Exterior_1st7
          +    -0.28411285333731 * G_Functional0  +    -0.15881350051213 * 
        G_Functional1  +    -0.10339546791567 * G_Functional2
          +     0.08528357357436 * G_Garage_Qual0  +     0.06353256621502 * 
        G_Garage_Qual1  +    -0.09335696937278 * G_Garage_Qual2
          +    -0.07367360900682 * G_House_Style0  +    -0.01196852584464 * 
        G_House_Style1  +     0.09521266201311 * G_House_Style2
          +    -0.10437342634813 * G_House_Style3  +    -0.12625329859141 * 
        G_House_Style4  +    -0.08222196585917 * G_Kitchen_Qual0
          +     0.00805493911243 * G_Kitchen_Qual1  +     0.18374698916197 * 
        G_Kitchen_Qual2  +      -0.059774430791 * G_MS_SubClass0
          +     0.01536585632572 * G_MS_SubClass1  +    -0.15662802302452 * 
        G_MS_SubClass2  +    -0.21736633001846 * G_MS_SubClass3
          +    -0.13572044538199 * G_MS_SubClass4  +     0.01832764936104 * 
        G_MS_SubClass5  +     0.10049785664394 * G_MS_SubClass6
          +      0.0242635781695 * G_MS_SubClass7  +     0.10898636714091 * 
        G_Neighborhood0  +    -0.14709849844175 * G_Neighborhood1
          +    -0.03775151908715 * G_Neighborhood2  +    -0.02886882118162 * 
        G_Neighborhood3  +     0.08919446660539 * G_Neighborhood4
          +     0.04923212733467 * G_Neighborhood5  +    -0.09890340783202 * 
        G_Neighborhood6  +     0.04285950752079 * G_Neighborhood7
          +     0.03918029342083 * G_Neighborhood8  +    -0.02702563282588 * 
        G_Neighborhood9  +     0.15883233791234 * G_Neighborhood10
          +    -0.05409713488123 * G_Neighborhood11  +    -0.02403233442865 * 
        G_Neighborhood12  +    -0.00534270043255 * G_Pool_QC0
          +    -0.03418441485518 * G_Pool_QC1  +     0.10302714333292 * 
        G_Roof_Matl0  +     0.10809655617227 * G_Roof_Matl1
          +     0.18366865214902 * G_Sale_Condition0
          +     0.19798654018586 * G_Sale_Condition1
          +     0.13267224932994 * G_Sale_Condition2
          +     0.04159364868513 * G_Sale_Condition3
          +    -0.14134604914449 * Land_ContourBnk  +    -0.01370636275811 * 
        Land_ContourHLS  +     0.07660545596747 * Land_ContourLow ;
   H103  = H103  +    -0.00748395602338 * Exter_QualEx
          +    -0.10628507586071 * Exter_QualFa  +     0.06271644433815 * 
        Exter_QualGd  +     0.00205054092994 * G_Bldg_Type0
          +     -0.1163455800457 * G_Bldg_Type1  +     0.26969211529347 * 
        G_Bldg_Type2  +     -0.3229363213158 * G_Bsmt_Exposure0
          +       -0.01632875901 * G_Bsmt_Exposure1  +     0.04606448818321 * 
        G_Bsmt_Exposure2  +     0.08370964130708 * G_Bsmt_Exposure3
          +    -0.03400828495808 * G_Bsmt_Qual0  +     0.00524861870163 * 
        G_Bsmt_Qual1  +     0.20686914971902 * G_Bsmt_Qual2
          +    -0.23101452272489 * G_Condition_10  +    -0.07440030984347 * 
        G_Condition_11  +     -0.0214572531072 * G_Condition_12
          +    -0.01758926498683 * G_Condition_13  +    -0.01556046453188 * 
        G_Condition_20  +     0.25763782742769 * G_Condition_21
          +    -0.13241616092188 * G_Condition_22  +    -0.20325003614683 * 
        G_Exterior_1st0  +     0.11782843635182 * G_Exterior_1st1
          +    -0.06507420865196 * G_Exterior_1st2  +     0.03844411200333 * 
        G_Exterior_1st3  +      0.0477500805007 * G_Exterior_1st4
          +     0.01404134080141 * G_Exterior_1st5  +    -0.02822620401183 * 
        G_Exterior_1st6  +    -0.23018916137537 * G_Exterior_1st7
          +    -0.11819621567321 * G_Functional0  +    -0.00505940299769 * 
        G_Functional1  +     0.15331020953664 * G_Functional2
          +     0.05635462325699 * G_Garage_Qual0  +    -0.13654900781558 * 
        G_Garage_Qual1  +     0.12848783533638 * G_Garage_Qual2
          +    -0.16007343252339 * G_House_Style0  +    -0.01839930999729 * 
        G_House_Style1  +     0.01697877750749 * G_House_Style2
          +     0.11775198217549 * G_House_Style3  +     0.06215981081119 * 
        G_House_Style4  +     0.08875407116336 * G_Kitchen_Qual0
          +      0.0505599860948 * G_Kitchen_Qual1  +     0.00143121394939 * 
        G_Kitchen_Qual2  +    -0.30543925162123 * G_MS_SubClass0
          +    -0.03727207362772 * G_MS_SubClass1  +     0.07203149202238 * 
        G_MS_SubClass2  +     0.10511105138818 * G_MS_SubClass3
          +    -0.08357823302023 * G_MS_SubClass4  +    -0.04722453693312 * 
        G_MS_SubClass5  +     0.02651502939741 * G_MS_SubClass6
          +     0.12122556656411 * G_MS_SubClass7  +    -0.23110571596998 * 
        G_Neighborhood0  +    -0.09872570891176 * G_Neighborhood1
          +    -0.09383751069673 * G_Neighborhood2  +     0.25842391571999 * 
        G_Neighborhood3  +      0.1442950545301 * G_Neighborhood4
          +    -0.04663316585426 * G_Neighborhood5  +     0.02139134335496 * 
        G_Neighborhood6  +    -0.03939084806935 * G_Neighborhood7
          +    -0.06835324590546 * G_Neighborhood8  +     0.07431236013135 * 
        G_Neighborhood9  +    -0.11687857371125 * G_Neighborhood10
          +    -0.07260449288584 * G_Neighborhood11  +     0.01395279141346 * 
        G_Neighborhood12  +     0.12092491775938 * G_Pool_QC0
          +    -0.07333760564431 * G_Pool_QC1  +    -0.30426870821502 * 
        G_Roof_Matl0  +    -0.01923128614134 * G_Roof_Matl1
          +     0.10845993158682 * G_Sale_Condition0
          +     0.02491889778058 * G_Sale_Condition1
          +     0.04845534452845 * G_Sale_Condition2
          +     0.12356025590768 * G_Sale_Condition3
          +      0.0255713235221 * Land_ContourBnk  +    -0.01002294847512 * 
        Land_ContourHLS  +    -0.17937333639963 * Land_ContourLow ;
   H104  = H104  +    -0.04862758154253 * Exter_QualEx
          +     0.15671509000155 * Exter_QualFa  +     0.01180910995062 * 
        Exter_QualGd  +    -0.00310816232379 * G_Bldg_Type0
          +     0.09210149107846 * G_Bldg_Type1  +    -0.13151963546546 * 
        G_Bldg_Type2  +     0.07395441044909 * G_Bsmt_Exposure0
          +    -0.10649610737157 * G_Bsmt_Exposure1  +    -0.10004129057304 * 
        G_Bsmt_Exposure2  +    -0.09473397651458 * G_Bsmt_Exposure3
          +     0.11007704646464 * G_Bsmt_Qual0  +     0.06241876698077 * 
        G_Bsmt_Qual1  +    -0.16824653540931 * G_Bsmt_Qual2
          +     -0.0853126415274 * G_Condition_10  +    -0.02086070985559 * 
        G_Condition_11  +    -0.34203032223896 * G_Condition_12
          +    -0.13882505469769 * G_Condition_13  +     0.02593429086451 * 
        G_Condition_20  +    -0.09050706034955 * G_Condition_21
          +     0.01674529162822 * G_Condition_22  +     0.02034072504033 * 
        G_Exterior_1st0  +    -0.12806705005969 * G_Exterior_1st1
          +    -0.11452237284106 * G_Exterior_1st2  +    -0.04459343956444 * 
        G_Exterior_1st3  +     0.04090145180126 * G_Exterior_1st4
          +    -0.05526916052292 * G_Exterior_1st5  +    -0.09037897318327 * 
        G_Exterior_1st6  +      0.0193006149433 * G_Exterior_1st7
          +     0.13112394822431 * G_Functional0  +     0.14753628801321 * 
        G_Functional1  +     0.08521851444505 * G_Functional2
          +     0.15181309019055 * G_Garage_Qual0  +    -0.05651431789934 * 
        G_Garage_Qual1  +    -0.24250742323869 * G_Garage_Qual2
          +     0.08260986780836 * G_House_Style0  +    -0.09949407944923 * 
        G_House_Style1  +    -0.16980675866975 * G_House_Style2
          +     0.00474113552812 * G_House_Style3  +    -0.01893869636685 * 
        G_House_Style4  +    -0.10999785286826 * G_Kitchen_Qual0
          +    -0.14385335902417 * G_Kitchen_Qual1  +     0.04845153574265 * 
        G_Kitchen_Qual2  +    -0.17599533728081 * G_MS_SubClass0
          +    -0.02710362397284 * G_MS_SubClass1  +    -0.11157911226696 * 
        G_MS_SubClass2  +    -0.04801699428247 * G_MS_SubClass3
          +     0.09279959056636 * G_MS_SubClass4  +     0.07732473657636 * 
        G_MS_SubClass5  +     0.04534105021864 * G_MS_SubClass6
          +     0.07212555228408 * G_MS_SubClass7  +     0.09298806123208 * 
        G_Neighborhood0  +     0.07868074832743 * G_Neighborhood1
          +     0.16669837426573 * G_Neighborhood2  +     -0.0417099042993 * 
        G_Neighborhood3  +    -0.02813485417355 * G_Neighborhood4
          +    -0.04265303005183 * G_Neighborhood5  +     0.13404325425015 * 
        G_Neighborhood6  +    -0.06094777598727 * G_Neighborhood7
          +      0.0698994685975 * G_Neighborhood8  +     0.09143065975807 * 
        G_Neighborhood9  +     0.09632077191451 * G_Neighborhood10
          +    -0.16042026153274 * G_Neighborhood11  +    -0.16538032674665 * 
        G_Neighborhood12  +    -0.30220652851807 * G_Pool_QC0
          +    -0.00317261209159 * G_Pool_QC1  +    -0.17233965141304 * 
        G_Roof_Matl0  +     0.06517274463337 * G_Roof_Matl1
          +    -0.06149851738663 * G_Sale_Condition0
          +     0.02808738888435 * G_Sale_Condition1
          +    -0.18789562760306 * G_Sale_Condition2
          +    -0.32587205489857 * G_Sale_Condition3
          +     0.06821501512084 * Land_ContourBnk  +     0.11768512722295 * 
        Land_ContourHLS  +     0.20024117953787 * Land_ContourLow ;
   H105  = H105  +     0.16008128657689 * Exter_QualEx
          +     -0.0790466423638 * Exter_QualFa  +    -0.11354095986749 * 
        Exter_QualGd  +      0.0124849178511 * G_Bldg_Type0
          +     -0.2005829428658 * G_Bldg_Type1  +      0.0146359525352 * 
        G_Bldg_Type2  +     0.02573386945142 * G_Bsmt_Exposure0
          +    -0.03823198954636 * G_Bsmt_Exposure1  +    -0.08913744924569 * 
        G_Bsmt_Exposure2  +     0.07808930865257 * G_Bsmt_Exposure3
          +    -0.01802654885495 * G_Bsmt_Qual0  +     0.04700214364944 * 
        G_Bsmt_Qual1  +    -0.03696626425416 * G_Bsmt_Qual2
          +    -0.19056489253796 * G_Condition_10  +    -0.22234943555054 * 
        G_Condition_11  +     0.19540311937451 * G_Condition_12
          +     0.18577593964164 * G_Condition_13  +     0.18263842641766 * 
        G_Condition_20  +    -0.06792152855649 * G_Condition_21
          +    -0.14868471051725 * G_Condition_22  +      0.0058639171794 * 
        G_Exterior_1st0  +     -0.0324426353922 * G_Exterior_1st1
          +    -0.05461114918453 * G_Exterior_1st2  +     0.15458780829013 * 
        G_Exterior_1st3  +    -0.08461105541049 * G_Exterior_1st4
          +    -0.05651913156997 * G_Exterior_1st5  +     0.15048781692048 * 
        G_Exterior_1st6  +    -0.14628141798624 * G_Exterior_1st7
          +     -0.0237538538443 * G_Functional0  +     0.12154774296455 * 
        G_Functional1  +    -0.06362290966181 * G_Functional2
          +     0.18829290803886 * G_Garage_Qual0  +     0.18370581687577 * 
        G_Garage_Qual1  +     -0.0939303873883 * G_Garage_Qual2
          +    -0.07198906100654 * G_House_Style0  +    -0.20428390577461 * 
        G_House_Style1  +    -0.06463140780037 * G_House_Style2
          +     0.03065352495152 * G_House_Style3  +     0.08722528597523 * 
        G_House_Style4  +    -0.09165240030373 * G_Kitchen_Qual0
          +    -0.07130277395723 * G_Kitchen_Qual1  +     0.01279478476254 * 
        G_Kitchen_Qual2  +     0.03824122929447 * G_MS_SubClass0
          +    -0.02704483619017 * G_MS_SubClass1  +     0.05923500620342 * 
        G_MS_SubClass2  +    -0.28877132517065 * G_MS_SubClass3
          +     0.13387498529602 * G_MS_SubClass4  +     0.14047199863592 * 
        G_MS_SubClass5  +    -0.16131789678847 * G_MS_SubClass6
          +     0.03273655734626 * G_MS_SubClass7  +    -0.13432493272072 * 
        G_Neighborhood0  +    -0.02960871572253 * G_Neighborhood1
          +    -0.13697973058452 * G_Neighborhood2  +    -0.04985257441245 * 
        G_Neighborhood3  +     0.09223645163044 * G_Neighborhood4
          +    -0.01552031418291 * G_Neighborhood5  +     0.09926864123339 * 
        G_Neighborhood6  +     0.05141687680487 * G_Neighborhood7
          +    -0.16231383802595 * G_Neighborhood8  +     0.04515678352336 * 
        G_Neighborhood9  +    -0.08149992525426 * G_Neighborhood10
          +      0.0016837423902 * G_Neighborhood11  +     -0.0645929273952 * 
        G_Neighborhood12  +    -0.07218275196843 * G_Pool_QC0
          +    -0.13783998628435 * G_Pool_QC1  +     0.04688430699272 * 
        G_Roof_Matl0  +     0.07159723320303 * G_Roof_Matl1
          +    -0.13345000726667 * G_Sale_Condition0
          +    -0.08224752412731 * G_Sale_Condition1
          +      0.0250219313725 * G_Sale_Condition2
          +    -0.09815893149488 * G_Sale_Condition3
          +     0.13093415649988 * Land_ContourBnk  +     0.20149928906159 * 
        Land_ContourHLS  +     0.02505746679909 * Land_ContourLow ;
   H106  = H106  +    -0.08165098240634 * Exter_QualEx
          +    -0.06184432831562 * Exter_QualFa  +     0.00482801646256 * 
        Exter_QualGd  +     0.03804211926532 * G_Bldg_Type0
          +     0.05587457536592 * G_Bldg_Type1  +     0.35464012695255 * 
        G_Bldg_Type2  +     0.12328956802334 * G_Bsmt_Exposure0
          +    -0.14605762433174 * G_Bsmt_Exposure1  +    -0.08126074001048 * 
        G_Bsmt_Exposure2  +     0.07621773945372 * G_Bsmt_Exposure3
          +    -0.05846018316063 * G_Bsmt_Qual0  +    -0.07908988973195 * 
        G_Bsmt_Qual1  +     0.08316423799783 * G_Bsmt_Qual2
          +    -0.13344964994757 * G_Condition_10  +     0.08470861494334 * 
        G_Condition_11  +     0.54362868020714 * G_Condition_12
          +     0.03474028393473 * G_Condition_13  +    -0.03019842133159 * 
        G_Condition_20  +     0.48740967143951 * G_Condition_21
          +    -0.20570237950044 * G_Condition_22  +     0.20501064873692 * 
        G_Exterior_1st0  +     0.09599548134869 * G_Exterior_1st1
          +    -0.07951913754069 * G_Exterior_1st2  +     0.03268185602663 * 
        G_Exterior_1st3  +     0.05241601374039 * G_Exterior_1st4
          +     0.10063551577447 * G_Exterior_1st5  +     0.19756133166237 * 
        G_Exterior_1st6  +    -0.17801438093191 * G_Exterior_1st7
          +    -0.13422899477216 * G_Functional0  +    -0.43736090237289 * 
        G_Functional1  +    -0.18508474569489 * G_Functional2
          +     0.07965471111443 * G_Garage_Qual0  +    -0.00799312435832 * 
        G_Garage_Qual1  +      0.2078868137217 * G_Garage_Qual2
          +    -0.06138152228862 * G_House_Style0  +     0.02569872130789 * 
        G_House_Style1  +    -0.02741309113331 * G_House_Style2
          +    -0.04565590872681 * G_House_Style3  +     0.26772066927465 * 
        G_House_Style4  +    -0.11785415299678 * G_Kitchen_Qual0
          +     -0.0341065563973 * G_Kitchen_Qual1  +     0.09071580588409 * 
        G_Kitchen_Qual2  +    -0.15968692813432 * G_MS_SubClass0
          +    -0.08753196200807 * G_MS_SubClass1  +     0.02811580539043 * 
        G_MS_SubClass2  +     0.12134275296107 * G_MS_SubClass3
          +     0.14456218864012 * G_MS_SubClass4  +    -0.01329156353299 * 
        G_MS_SubClass5  +     0.16553761960475 * G_MS_SubClass6
          +    -0.00867493847191 * G_MS_SubClass7  +    -0.14977719100946 * 
        G_Neighborhood0  +     0.03934687290619 * G_Neighborhood1
          +    -0.16421257674241 * G_Neighborhood2  +    -0.17982093937048 * 
        G_Neighborhood3  +    -0.12208838664144 * G_Neighborhood4
          +     0.09393562793548 * G_Neighborhood5  +    -0.03376924191536 * 
        G_Neighborhood6  +    -0.13456327976793 * G_Neighborhood7
          +     -0.0706172446029 * G_Neighborhood8  +     0.08769706502581 * 
        G_Neighborhood9  +    -0.16134295447565 * G_Neighborhood10
          +     -0.1053320753272 * G_Neighborhood11  +     0.14707336012663 * 
        G_Neighborhood12  +     0.21515482405422 * G_Pool_QC0
          +      -0.050585909164 * G_Pool_QC1  +      0.2825902742033 * 
        G_Roof_Matl0  +    -0.24089198297695 * G_Roof_Matl1
          +     0.09185570449944 * G_Sale_Condition0
          +     0.01881671911955 * G_Sale_Condition1
          +    -0.02646568378558 * G_Sale_Condition2
          +     0.27584946741559 * G_Sale_Condition3
          +    -0.28381497587004 * Land_ContourBnk  +    -0.29852367500239 * 
        Land_ContourHLS  +    -0.27734220847845 * Land_ContourLow ;
   H107  = H107  +     0.18165162955854 * Exter_QualEx
          +     0.03839845859522 * Exter_QualFa  +    -0.16420977914568 * 
        Exter_QualGd  +      0.1818280105831 * G_Bldg_Type0
          +     0.03475213337686 * G_Bldg_Type1  +    -0.18169698122514 * 
        G_Bldg_Type2  +     0.37161307299993 * G_Bsmt_Exposure0
          +    -0.04799431292792 * G_Bsmt_Exposure1  +    -0.13637144348324 * 
        G_Bsmt_Exposure2  +    -0.05455041056444 * G_Bsmt_Exposure3
          +    -0.15093957334012 * G_Bsmt_Qual0  +     0.08018048760601 * 
        G_Bsmt_Qual1  +    -0.06549860840197 * G_Bsmt_Qual2
          +     0.14306021074766 * G_Condition_10  +    -0.12794021805833 * 
        G_Condition_11  +    -0.07243290717301 * G_Condition_12
          +    -0.02392176953012 * G_Condition_13  +     0.02843762910608 * 
        G_Condition_20  +    -0.23231173868102 * G_Condition_21
          +    -0.04144674667781 * G_Condition_22  +     0.04642814698586 * 
        G_Exterior_1st0  +    -0.11671872812773 * G_Exterior_1st1
          +     0.05146706013675 * G_Exterior_1st2  +    -0.22279325538644 * 
        G_Exterior_1st3  +    -0.02318553639844 * G_Exterior_1st4
          +    -0.01532907588078 * G_Exterior_1st5  +     0.14803975226016 * 
        G_Exterior_1st6  +    -0.00294529182322 * G_Exterior_1st7
          +      0.0291449259482 * G_Functional0  +    -0.00280342125773 * 
        G_Functional1  +     0.01547805467311 * G_Functional2
          +     -0.0417023227354 * G_Garage_Qual0  +     0.12339027631353 * 
        G_Garage_Qual1  +     0.07551450119637 * G_Garage_Qual2
          +     0.03595960252181 * G_House_Style0  +    -0.05611362385162 * 
        G_House_Style1  +     0.00760472581993 * G_House_Style2
          +     0.01721791621288 * G_House_Style3  +    -0.05322476503817 * 
        G_House_Style4  +     0.04250382765059 * G_Kitchen_Qual0
          +    -0.06325595678023 * G_Kitchen_Qual1  +    -0.02639883278423 * 
        G_Kitchen_Qual2  +     -0.0028748563324 * G_MS_SubClass0
          +      0.0171841895442 * G_MS_SubClass1  +     0.13819703489799 * 
        G_MS_SubClass2  +    -0.15425715002967 * G_MS_SubClass3
          +    -0.04037893805007 * G_MS_SubClass4  +     0.11462505368452 * 
        G_MS_SubClass5  +     0.03791564641861 * G_MS_SubClass6
          +     0.04318124088698 * G_MS_SubClass7  +     0.05901790904725 * 
        G_Neighborhood0  +     0.05159139685796 * G_Neighborhood1
          +    -0.07307474054672 * G_Neighborhood2  +    -0.07435818142311 * 
        G_Neighborhood3  +      0.1164306364701 * G_Neighborhood4
          +     0.07422299603858 * G_Neighborhood5  +     0.10315093640294 * 
        G_Neighborhood6  +     0.09651622604808 * G_Neighborhood7
          +     0.02123849926358 * G_Neighborhood8  +     0.01654628832421 * 
        G_Neighborhood9  +     0.08293413512052 * G_Neighborhood10
          +      0.1297051697114 * G_Neighborhood11  +    -0.04242704201652 * 
        G_Neighborhood12  +    -0.17947433209238 * G_Pool_QC0
          +     0.17782473196123 * G_Pool_QC1  +     0.10076327683807 * 
        G_Roof_Matl0  +     0.07244230371893 * G_Roof_Matl1
          +     -0.1533018734672 * G_Sale_Condition0
          +    -0.03167192116853 * G_Sale_Condition1
          +    -0.13204355113535 * G_Sale_Condition2
          +    -0.07669179484684 * G_Sale_Condition3
          +    -0.10281757373146 * Land_ContourBnk  +     0.10894047552136 * 
        Land_ContourHLS  +     0.04710235587213 * Land_ContourLow ;
   H108  = H108  +     0.07075968301622 * Exter_QualEx
          +     0.09185808286473 * Exter_QualFa  +    -0.09126178164339 * 
        Exter_QualGd  +    -0.16473452163754 * G_Bldg_Type0
          +    -0.15449369971115 * G_Bldg_Type1  +     0.10795164070001 * 
        G_Bldg_Type2  +     0.02470098659153 * G_Bsmt_Exposure0
          +     0.05866565152587 * G_Bsmt_Exposure1  +     0.05092285518565 * 
        G_Bsmt_Exposure2  +     0.08734729135417 * G_Bsmt_Exposure3
          +     0.11621948561729 * G_Bsmt_Qual0  +    -0.05583042846262 * 
        G_Bsmt_Qual1  +    -0.10358194299466 * G_Bsmt_Qual2
          +    -0.11576713204103 * G_Condition_10  +    -0.07571324067198 * 
        G_Condition_11  +     0.08929103452095 * G_Condition_12
          +    -0.11228193348457 * G_Condition_13  +    -0.05382829893076 * 
        G_Condition_20  +    -0.15486019412324 * G_Condition_21
          +    -0.16760923965827 * G_Condition_22  +    -0.06011876621198 * 
        G_Exterior_1st0  +    -0.07333373942896 * G_Exterior_1st1
          +    -0.00646188473669 * G_Exterior_1st2  +    -0.09314773195952 * 
        G_Exterior_1st3  +    -0.07085470499557 * G_Exterior_1st4
          +      0.3387772444392 * G_Exterior_1st5  +    -0.03720021033326 * 
        G_Exterior_1st6  +      0.0384581585025 * G_Exterior_1st7
          +     0.04252331531837 * G_Functional0  +     0.04321338166361 * 
        G_Functional1  +    -0.15972307501845 * G_Functional2
          +     0.01739789725515 * G_Garage_Qual0  +     0.06008697723912 * 
        G_Garage_Qual1  +    -0.00185989948272 * G_Garage_Qual2
          +     0.02621755086914 * G_House_Style0  +     0.03901865323929 * 
        G_House_Style1  +    -0.07526418304148 * G_House_Style2
          +    -0.15097853808882 * G_House_Style3  +     0.08841566890577 * 
        G_House_Style4  +    -0.01510868143655 * G_Kitchen_Qual0
          +    -0.10367954675957 * G_Kitchen_Qual1  +      0.0348857283144 * 
        G_Kitchen_Qual2  +     0.05604840227036 * G_MS_SubClass0
          +     0.24541657693802 * G_MS_SubClass1  +     0.05575641869055 * 
        G_MS_SubClass2  +    -0.20276018550847 * G_MS_SubClass3
          +     0.15469954063611 * G_MS_SubClass4  +    -0.04574216762438 * 
        G_MS_SubClass5  +     -0.0226892046711 * G_MS_SubClass6
          +      0.0551758926814 * G_MS_SubClass7  +    -0.06272908891128 * 
        G_Neighborhood0  +    -0.06264124214355 * G_Neighborhood1
          +    -0.07351452939971 * G_Neighborhood2  +    -0.21666613760004 * 
        G_Neighborhood3  +    -0.24663843124089 * G_Neighborhood4
          +    -0.02079127291363 * G_Neighborhood5  +     0.01377501895638 * 
        G_Neighborhood6  +    -0.10025327555458 * G_Neighborhood7
          +     0.00466974403547 * G_Neighborhood8  +     0.12087986329376 * 
        G_Neighborhood9  +     0.27840044540842 * G_Neighborhood10
          +    -0.00484634804347 * G_Neighborhood11  +     0.19455314139453 * 
        G_Neighborhood12  +    -0.25156711849406 * G_Pool_QC0
          +    -0.16702432844695 * G_Pool_QC1  +    -0.15437686726832 * 
        G_Roof_Matl0  +    -0.12595320091682 * G_Roof_Matl1
          +    -0.05724703777419 * G_Sale_Condition0
          +    -0.26095643216733 * G_Sale_Condition1
          +     0.00878116737098 * G_Sale_Condition2
          +      0.0963743411515 * G_Sale_Condition3
          +    -0.07566975883052 * Land_ContourBnk  +     0.13200185069312 * 
        Land_ContourHLS  +    -0.11059372784598 * Land_ContourLow ;
   H109  = H109  +     0.08895853491598 * Exter_QualEx
          +    -0.15347072663248 * Exter_QualFa  +     0.00961427470584 * 
        Exter_QualGd  +     0.09558306999738 * G_Bldg_Type0
          +     0.18354824144522 * G_Bldg_Type1  +     0.21275699867381 * 
        G_Bldg_Type2  +    -0.06163095632762 * G_Bsmt_Exposure0
          +     0.09868280712902 * G_Bsmt_Exposure1  +    -0.12343966120824 * 
        G_Bsmt_Exposure2  +    -0.00501387207073 * G_Bsmt_Exposure3
          +    -0.19410785993734 * G_Bsmt_Qual0  +     0.11489123556896 * 
        G_Bsmt_Qual1  +      0.1503784736761 * G_Bsmt_Qual2
          +     0.10726914078411 * G_Condition_10  +    -0.10230380579985 * 
        G_Condition_11  +    -0.03316794471352 * G_Condition_12
          +     0.00908013681737 * G_Condition_13  +     0.00890402077938 * 
        G_Condition_20  +     -0.0231864813626 * G_Condition_21
          +    -0.12530660504008 * G_Condition_22  +    -0.03778963987229 * 
        G_Exterior_1st0  +    -0.09369384491178 * G_Exterior_1st1
          +     0.09477907975574 * G_Exterior_1st2  +    -0.08338422439428 * 
        G_Exterior_1st3  +    -0.14570404075063 * G_Exterior_1st4
          +     0.21557319733377 * G_Exterior_1st5  +     0.01788676610209 * 
        G_Exterior_1st6  +     0.00056564193091 * G_Exterior_1st7
          +    -0.16495259844231 * G_Functional0  +    -0.09027735861025 * 
        G_Functional1  +    -0.03601186849388 * G_Functional2
          +    -0.14404057608532 * G_Garage_Qual0  +     0.03939910625069 * 
        G_Garage_Qual1  +    -0.27072269863435 * G_Garage_Qual2
          +     0.05115803765671 * G_House_Style0  +     0.07054378421172 * 
        G_House_Style1  +     0.08043338034006 * G_House_Style2
          +     0.01162993245204 * G_House_Style3  +     0.07407823487359 * 
        G_House_Style4  +     -0.1040342217193 * G_Kitchen_Qual0
          +     0.07101638865655 * G_Kitchen_Qual1  +     0.19359259562791 * 
        G_Kitchen_Qual2  +    -0.02940306073703 * G_MS_SubClass0
          +    -0.07628474218993 * G_MS_SubClass1  +     0.04468887595992 * 
        G_MS_SubClass2  +     0.07836277355863 * G_MS_SubClass3
          +      0.0369020930314 * G_MS_SubClass4  +     0.06051227550122 * 
        G_MS_SubClass5  +      -0.104236144556 * G_MS_SubClass6
          +    -0.11784628446336 * G_MS_SubClass7  +    -0.18966731771712 * 
        G_Neighborhood0  +    -0.09235059910542 * G_Neighborhood1
          +    -0.08114146761484 * G_Neighborhood2  +    -0.10470805131981 * 
        G_Neighborhood3  +    -0.01527879003405 * G_Neighborhood4
          +     0.07548730835114 * G_Neighborhood5  +     0.05988432516785 * 
        G_Neighborhood6  +     0.22411773402516 * G_Neighborhood7
          +     0.08110409929881 * G_Neighborhood8  +     0.19183369743814 * 
        G_Neighborhood9  +    -0.01306991454103 * G_Neighborhood10
          +     0.05446013141181 * G_Neighborhood11  +      0.0509159716369 * 
        G_Neighborhood12  +    -0.07521336552319 * G_Pool_QC0
          +     0.01737586881788 * G_Pool_QC1  +    -0.15676058792098 * 
        G_Roof_Matl0  +     0.04572667357446 * G_Roof_Matl1
          +     0.15746593284893 * G_Sale_Condition0
          +    -0.14390486341454 * G_Sale_Condition1
          +     0.00059663608179 * G_Sale_Condition2
          +    -0.11974819459891 * G_Sale_Condition3
          +     0.06629786374937 * Land_ContourBnk  +    -0.03364630368924 * 
        Land_ContourHLS  +     0.15079721367494 * Land_ContourLow ;
   H110  = H110  +     0.03823738060935 * Exter_QualEx
          +    -0.28274989334836 * Exter_QualFa  +     -0.0838123109296 * 
        Exter_QualGd  +    -0.02085074589394 * G_Bldg_Type0
          +      -0.022998539033 * G_Bldg_Type1  +    -0.02548318563026 * 
        G_Bldg_Type2  +     0.08775181125908 * G_Bsmt_Exposure0
          +     0.34877332303107 * G_Bsmt_Exposure1  +      0.0986029630795 * 
        G_Bsmt_Exposure2  +     0.21789182894428 * G_Bsmt_Exposure3
          +    -0.09702312876756 * G_Bsmt_Qual0  +    -0.13474825468262 * 
        G_Bsmt_Qual1  +     0.01613562024467 * G_Bsmt_Qual2
          +     0.09560877029668 * G_Condition_10  +     0.14801143189353 * 
        G_Condition_11  +    -0.10793104097427 * G_Condition_12
          +     0.02622746276783 * G_Condition_13  +     0.04080892279213 * 
        G_Condition_20  +    -0.01842597474338 * G_Condition_21
          +      0.0219310138362 * G_Condition_22  +    -0.16789280197565 * 
        G_Exterior_1st0  +     0.12515595152948 * G_Exterior_1st1
          +     0.02393635055586 * G_Exterior_1st2  +     0.18091024008531 * 
        G_Exterior_1st3  +     0.01297716798022 * G_Exterior_1st4
          +     0.15129122540958 * G_Exterior_1st5  +    -0.02087430895201 * 
        G_Exterior_1st6  +     0.03066502129225 * G_Exterior_1st7
          +    -0.08445718331832 * G_Functional0  +    -0.07933455219849 * 
        G_Functional1  +       0.201512767344 * G_Functional2
          +    -0.01262998481915 * G_Garage_Qual0  +    -0.02370165496095 * 
        G_Garage_Qual1  +     0.04361670677428 * G_Garage_Qual2
          +    -0.04158271736521 * G_House_Style0  +     0.10337796344999 * 
        G_House_Style1  +     0.06777061073242 * G_House_Style2
          +    -0.21937838783177 * G_House_Style3  +    -0.05274559611737 * 
        G_House_Style4  +    -0.12015340983381 * G_Kitchen_Qual0
          +     0.07775385041331 * G_Kitchen_Qual1  +     0.20311225454988 * 
        G_Kitchen_Qual2  +    -0.07639705575255 * G_MS_SubClass0
          +    -0.16245068946963 * G_MS_SubClass1  +     0.08200601812474 * 
        G_MS_SubClass2  +    -0.02206406094287 * G_MS_SubClass3
          +    -0.20335502999028 * G_MS_SubClass4  +     0.06231009176525 * 
        G_MS_SubClass5  +     0.19193789302746 * G_MS_SubClass6
          +    -0.05249124918289 * G_MS_SubClass7  +     -0.1598358956656 * 
        G_Neighborhood0  +    -0.06123505021261 * G_Neighborhood1
          +     -0.0306441373452 * G_Neighborhood2  +     0.06813789617153 * 
        G_Neighborhood3  +     0.18304175030102 * G_Neighborhood4
          +    -0.07267841932707 * G_Neighborhood5  +     0.10196420151892 * 
        G_Neighborhood6  +     0.29221206915839 * G_Neighborhood7
          +     0.03700244254832 * G_Neighborhood8  +    -0.02424244826016 * 
        G_Neighborhood9  +    -0.07374529997329 * G_Neighborhood10
          +     0.10977414532286 * G_Neighborhood11  +    -0.13940126047735 * 
        G_Neighborhood12  +     0.15347572124192 * G_Pool_QC0
          +     0.16480001346972 * G_Pool_QC1  +     0.01355432933731 * 
        G_Roof_Matl0  +     0.07497987477858 * G_Roof_Matl1
          +     0.20905678509742 * G_Sale_Condition0
          +     0.13474519519355 * G_Sale_Condition1
          +     0.17005865321676 * G_Sale_Condition2
          +    -0.07481994942923 * G_Sale_Condition3
          +    -0.18211134074586 * Land_ContourBnk  +    -0.11320138979705 * 
        Land_ContourHLS  +     0.00563675603008 * Land_ContourLow ;
   H101  =     0.85598261585807 + H101 ;
   H102  =    -0.81841271384325 + H102 ;
   H103  =     -0.1557875972913 + H103 ;
   H104  =    -0.38889490126567 + H104 ;
   H105  =     1.67957916261646 + H105 ;
   H106  =     0.37188092199888 + H106 ;
   H107  =    -0.88751922963942 + H107 ;
   H108  =    -0.60823433772686 + H108 ;
   H109  =     0.26399605102643 + H109 ;
   H110  =     0.96373949949366 + H110 ;
   H101  = TANH(H101 );
   H102  = TANH(H102 );
   H103  = TANH(H103 );
   H104  = TANH(H104 );
   H105  = TANH(H105 );
   H106  = TANH(H106 );
   H107  = TANH(H107 );
   H108  = TANH(H108 );
   H109  = TANH(H109 );
   H110  = TANH(H110 );
END;
ELSE DO;
   H101  = .;
   H102  = .;
   H103  = .;
   H104  = .;
   H105  = .;
   H106  = .;
   H107  = .;
   H108  = .;
   H109  = .;
   H110  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =    -31653.3315208954 * H101  +     5998.48981999413 * H102
          +     28941.9895887065 * H103  +    -46328.5701068266 * H104
          +      2070.3297298072 * H105  +     56705.0976169053 * H106
          +     2490.96830275613 * H107  +     84113.3235327981 * H108
          +     18202.1679938258 * H109  +    -42252.0761915549 * H110 ;
   P_SalePrice  =     179495.153186422 + P_SalePrice ;
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
