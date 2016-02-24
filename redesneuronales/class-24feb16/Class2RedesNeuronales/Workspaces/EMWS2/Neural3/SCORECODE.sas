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

      label H111 = 'Hidden: H1=11' ;

      label H112 = 'Hidden: H1=12' ;

      label H113 = 'Hidden: H1=13' ;

      label H114 = 'Hidden: H1=14' ;

      label H115 = 'Hidden: H1=15' ;

      label H116 = 'Hidden: H1=16' ;

      label H117 = 'Hidden: H1=17' ;

      label H118 = 'Hidden: H1=18' ;

      label H119 = 'Hidden: H1=19' ;

      label H120 = 'Hidden: H1=20' ;

      label P_SalePrice = 'Predicted: SalePrice' ;

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
   H101  =    -0.24855145920508 * S_BsmtFin_SF_1  +    -0.10078316140643 * 
        S_Bsmt_Full_Bath  +     0.07945575803058 * S_Fireplaces
          +      0.1208074742975 * S_Garage_Cars  +     0.09496182761897 * 
        S_Gr_Liv_Area  +    -0.03066237703679 * S_Lot_Area
          +     0.08980152234204 * S_Mas_Vnr_Area  +    -0.11585379093482 * 
        S_Overall_Cond  +      0.0939332374869 * S_Overall_Qual
          +    -0.02640839922092 * S_Screen_Porch  +     0.04598571469774 * 
        S_Year_Built ;
   H102  =     0.09821398559492 * S_BsmtFin_SF_1  +     0.12294308391796 * 
        S_Bsmt_Full_Bath  +     -0.1894142527779 * S_Fireplaces
          +      -0.127766051734 * S_Garage_Cars  +     0.03268481844015 * 
        S_Gr_Liv_Area  +     0.12460669185021 * S_Lot_Area
          +     0.02834198138061 * S_Mas_Vnr_Area  +    -0.03185930406542 * 
        S_Overall_Cond  +     -0.2100304628314 * S_Overall_Qual
          +      0.2511110333705 * S_Screen_Porch  +    -0.10797254245757 * 
        S_Year_Built ;
   H103  =      0.1990398012693 * S_BsmtFin_SF_1  +    -0.34943083443684 * 
        S_Bsmt_Full_Bath  +     -0.1336172215381 * S_Fireplaces
          +     0.31744992172332 * S_Garage_Cars  +     0.52200754942777 * 
        S_Gr_Liv_Area  +     0.30248505521885 * S_Lot_Area
          +    -0.00915709875637 * S_Mas_Vnr_Area  +     0.03215317988552 * 
        S_Overall_Cond  +     0.02200498665942 * S_Overall_Qual
          +    -0.38024384444396 * S_Screen_Porch  +     0.20594735815784 * 
        S_Year_Built ;
   H104  =     0.17525753104959 * S_BsmtFin_SF_1  +      0.0411072028163 * 
        S_Bsmt_Full_Bath  +     0.00191886912622 * S_Fireplaces
          +    -0.17955958938973 * S_Garage_Cars  +     0.13692732268203 * 
        S_Gr_Liv_Area  +     0.04338496779791 * S_Lot_Area
          +     0.18969381004162 * S_Mas_Vnr_Area  +    -0.19903212822814 * 
        S_Overall_Cond  +     0.18867938436779 * S_Overall_Qual
          +     0.04770026713262 * S_Screen_Porch  +    -0.24436722260696 * 
        S_Year_Built ;
   H105  =     0.40598131220278 * S_BsmtFin_SF_1  +     0.09956413986868 * 
        S_Bsmt_Full_Bath  +    -0.15579136105896 * S_Fireplaces
          +    -0.27601720429326 * S_Garage_Cars  +     0.14757901779011 * 
        S_Gr_Liv_Area  +     0.22561932244779 * S_Lot_Area
          +    -0.20449513644101 * S_Mas_Vnr_Area  +      0.2225734735983 * 
        S_Overall_Cond  +     -0.0696854683579 * S_Overall_Qual
          +    -0.14986895366648 * S_Screen_Porch  +    -0.07454761564865 * 
        S_Year_Built ;
   H106  =     0.31570793457893 * S_BsmtFin_SF_1  +    -0.00226035178109 * 
        S_Bsmt_Full_Bath  +     0.09339529052741 * S_Fireplaces
          +     0.13830781404494 * S_Garage_Cars  +     0.56255293483634 * 
        S_Gr_Liv_Area  +     0.38890755284156 * S_Lot_Area
          +    -0.00699045229753 * S_Mas_Vnr_Area  +     0.23242311949145 * 
        S_Overall_Cond  +     0.37920031241789 * S_Overall_Qual
          +     0.11353554210145 * S_Screen_Porch  +     0.01604567315145 * 
        S_Year_Built ;
   H107  =    -0.23565447774828 * S_BsmtFin_SF_1  +     -0.1155343983832 * 
        S_Bsmt_Full_Bath  +     0.18196239253188 * S_Fireplaces
          +     0.05313612044544 * S_Garage_Cars  +    -0.18830077012524 * 
        S_Gr_Liv_Area  +    -0.10717247875134 * S_Lot_Area
          +    -0.01175006374305 * S_Mas_Vnr_Area  +    -0.29399178512153 * 
        S_Overall_Cond  +    -0.13865951125466 * S_Overall_Qual
          +    -0.09814553664328 * S_Screen_Porch  +    -0.05906614612446 * 
        S_Year_Built ;
   H108  =    -0.18005011872809 * S_BsmtFin_SF_1  +     0.12848056007766 * 
        S_Bsmt_Full_Bath  +     0.15278685376139 * S_Fireplaces
          +     0.07003262418291 * S_Garage_Cars  +     0.07261480854531 * 
        S_Gr_Liv_Area  +    -0.00994224247809 * S_Lot_Area
          +      0.4284923450636 * S_Mas_Vnr_Area  +    -0.01580682734224 * 
        S_Overall_Cond  +     0.07247820460388 * S_Overall_Qual
          +     0.02251323403824 * S_Screen_Porch  +    -0.02028191184557 * 
        S_Year_Built ;
   H109  =     0.17132778084011 * S_BsmtFin_SF_1  +    -0.11373628224915 * 
        S_Bsmt_Full_Bath  +     0.16100398682161 * S_Fireplaces
          +    -0.11105456843258 * S_Garage_Cars  +    -0.14189495495801 * 
        S_Gr_Liv_Area  +     -0.0122605168463 * S_Lot_Area
          +    -0.00015801744022 * S_Mas_Vnr_Area  +    -0.09936680361163 * 
        S_Overall_Cond  +     0.02386428582603 * S_Overall_Qual
          +    -0.26601704721202 * S_Screen_Porch  +    -0.21897091253961 * 
        S_Year_Built ;
   H110  =     0.03111425859517 * S_BsmtFin_SF_1  +     0.16494682931531 * 
        S_Bsmt_Full_Bath  +    -0.11922928714276 * S_Fireplaces
          +    -0.11981619794624 * S_Garage_Cars  +     0.29963212237996 * 
        S_Gr_Liv_Area  +     0.21243736820315 * S_Lot_Area
          +     -0.0231356712174 * S_Mas_Vnr_Area  +     0.16517212438333 * 
        S_Overall_Cond  +    -0.04692543162115 * S_Overall_Qual
          +     0.08043727588698 * S_Screen_Porch  +     0.24694379716828 * 
        S_Year_Built ;
   H111  =     0.05072290164743 * S_BsmtFin_SF_1  +    -0.06384546190164 * 
        S_Bsmt_Full_Bath  +     0.04316897730589 * S_Fireplaces
          +     -0.0486640875923 * S_Garage_Cars  +     0.04855197886919 * 
        S_Gr_Liv_Area  +     0.13014188656431 * S_Lot_Area
          +     -0.1501192151466 * S_Mas_Vnr_Area  +     0.25837487447471 * 
        S_Overall_Cond  +    -0.01044736914558 * S_Overall_Qual
          +    -0.16100550423888 * S_Screen_Porch  +     0.25765518943315 * 
        S_Year_Built ;
   H112  =    -0.18475508511368 * S_BsmtFin_SF_1  +     0.13323777260591 * 
        S_Bsmt_Full_Bath  +    -0.08982564811531 * S_Fireplaces
          +    -0.16241529465484 * S_Garage_Cars  +    -0.23104163230346 * 
        S_Gr_Liv_Area  +    -0.13011402757253 * S_Lot_Area
          +    -0.01902340850599 * S_Mas_Vnr_Area  +    -0.08432377165073 * 
        S_Overall_Cond  +     0.04873979719345 * S_Overall_Qual
          +     0.07747228595195 * S_Screen_Porch  +    -0.16357762528399 * 
        S_Year_Built ;
   H113  =    -0.26202633820917 * S_BsmtFin_SF_1  +     0.00424753523416 * 
        S_Bsmt_Full_Bath  +     0.25823154976733 * S_Fireplaces
          +     0.41270227322022 * S_Garage_Cars  +    -0.11240826967657 * 
        S_Gr_Liv_Area  +     -0.2454951853971 * S_Lot_Area
          +    -0.05298624049652 * S_Mas_Vnr_Area  +     -0.1315909247583 * 
        S_Overall_Cond  +     0.27760614498119 * S_Overall_Qual
          +     0.13231656018623 * S_Screen_Porch  +     0.19532449966873 * 
        S_Year_Built ;
   H114  =    -0.21988787812752 * S_BsmtFin_SF_1  +     0.07016581673153 * 
        S_Bsmt_Full_Bath  +     0.07033672893314 * S_Fireplaces
          +     0.05508067779789 * S_Garage_Cars  +    -0.40139702563101 * 
        S_Gr_Liv_Area  +    -0.26155170579241 * S_Lot_Area
          +    -0.03462898038433 * S_Mas_Vnr_Area  +     0.13365071318368 * 
        S_Overall_Cond  +    -0.00971727002566 * S_Overall_Qual
          +    -0.12427136026025 * S_Screen_Porch  +     0.15811832739391 * 
        S_Year_Built ;
   H115  =     0.19663852572898 * S_BsmtFin_SF_1  +     0.01370045918199 * 
        S_Bsmt_Full_Bath  +     -0.1045547266453 * S_Fireplaces
          +    -0.13403988987211 * S_Garage_Cars  +     0.04192636515132 * 
        S_Gr_Liv_Area  +     0.27038330826083 * S_Lot_Area
          +    -0.07942832289863 * S_Mas_Vnr_Area  +     0.14318302755991 * 
        S_Overall_Cond  +    -0.16271560777796 * S_Overall_Qual
          +     0.14930302383372 * S_Screen_Porch  +    -0.16815547391505 * 
        S_Year_Built ;
   H116  =     0.01385010468763 * S_BsmtFin_SF_1  +     0.17776877801967 * 
        S_Bsmt_Full_Bath  +    -0.11022982822187 * S_Fireplaces
          +    -0.05845847515182 * S_Garage_Cars  +     0.46445694281851 * 
        S_Gr_Liv_Area  +      0.0322067129066 * S_Lot_Area
          +    -0.02262582390297 * S_Mas_Vnr_Area  +     0.17676843181491 * 
        S_Overall_Cond  +     0.38703716872837 * S_Overall_Qual
          +     0.00306840047048 * S_Screen_Porch  +     0.07676743735771 * 
        S_Year_Built ;
   H117  =     0.05311429416039 * S_BsmtFin_SF_1  +    -0.14636215435945 * 
        S_Bsmt_Full_Bath  +    -0.20505849057426 * S_Fireplaces
          +     0.39968411230522 * S_Garage_Cars  +     0.72640280511672 * 
        S_Gr_Liv_Area  +     0.38814348185426 * S_Lot_Area
          +     0.03767433023066 * S_Mas_Vnr_Area  +    -0.01791428383799 * 
        S_Overall_Cond  +     0.21679943501894 * S_Overall_Qual
          +     0.19955260149602 * S_Screen_Porch  +     0.14188648516592 * 
        S_Year_Built ;
   H118  =    -0.05454252095488 * S_BsmtFin_SF_1  +    -0.18359634977855 * 
        S_Bsmt_Full_Bath  +     0.05108210575757 * S_Fireplaces
          +    -0.03753002969754 * S_Garage_Cars  +     0.08286946948584 * 
        S_Gr_Liv_Area  +    -0.26160394831601 * S_Lot_Area
          +    -0.05472186858327 * S_Mas_Vnr_Area  +    -0.20638714576819 * 
        S_Overall_Cond  +     0.13948786685793 * S_Overall_Qual
          +     0.30323050863283 * S_Screen_Porch  +    -0.07560557068408 * 
        S_Year_Built ;
   H119  =     0.15658152606927 * S_BsmtFin_SF_1  +    -0.12412128794947 * 
        S_Bsmt_Full_Bath  +    -0.21961447606639 * S_Fireplaces
          +    -0.07353337696637 * S_Garage_Cars  +    -0.08250074299339 * 
        S_Gr_Liv_Area  +    -0.00788038689627 * S_Lot_Area
          +    -0.11663956928667 * S_Mas_Vnr_Area  +     0.34914352973838 * 
        S_Overall_Cond  +     -0.0401010281115 * S_Overall_Qual
          +     0.08507529014486 * S_Screen_Porch  +       0.210763266486 * 
        S_Year_Built ;
   H120  =     0.30595556717906 * S_BsmtFin_SF_1  +     0.06148933609658 * 
        S_Bsmt_Full_Bath  +    -0.28097115574868 * S_Fireplaces
          +    -0.09698081851342 * S_Garage_Cars  +    -0.01230198557303 * 
        S_Gr_Liv_Area  +    -0.01596303946678 * S_Lot_Area
          +    -0.00171367725011 * S_Mas_Vnr_Area  +    -0.05826590039377 * 
        S_Overall_Cond  +    -0.10656425486212 * S_Overall_Qual
          +    -0.13439310560831 * S_Screen_Porch  +     0.06723489896866 * 
        S_Year_Built ;
   H101  = H101  +     -0.1438545448681 * Exter_QualEx
          +     0.06021040927472 * Exter_QualFa  +     0.19988382029958 * 
        Exter_QualGd  +     0.08075076065215 * G_Bldg_Type0
          +    -0.27043551511995 * G_Bldg_Type1  +     0.29836949894032 * 
        G_Bldg_Type2  +     0.05495381351136 * G_Bsmt_Exposure0
          +     0.11171681404218 * G_Bsmt_Exposure1  +    -0.10977387826438 * 
        G_Bsmt_Exposure2  +    -0.06758774531316 * G_Bsmt_Exposure3
          +    -0.15423393667206 * G_Bsmt_Qual0  +    -0.10536531253833 * 
        G_Bsmt_Qual1  +     0.14734387868675 * G_Bsmt_Qual2
          +     0.08008096981647 * G_Condition_10  +    -0.10660103564014 * 
        G_Condition_11  +    -0.06986556066869 * G_Condition_12
          +     0.03871057257477 * G_Condition_13  +     0.12108844151367 * 
        G_Condition_20  +     0.25586910683778 * G_Condition_21
          +     0.12309437457628 * G_Condition_22  +     0.05520426117725 * 
        G_Exterior_1st0  +     0.01796926531929 * G_Exterior_1st1
          +     0.15084133109246 * G_Exterior_1st2  +     0.11371658784885 * 
        G_Exterior_1st3  +    -0.21896225923153 * G_Exterior_1st4
          +     0.10583228564253 * G_Exterior_1st5  +    -0.04195731808662 * 
        G_Exterior_1st6  +     0.02835593177932 * G_Exterior_1st7
          +     -0.0970106644475 * G_Functional0  +     0.07136618064182 * 
        G_Functional1  +     0.04367644317239 * G_Functional2
          +    -0.17505020321138 * G_Garage_Qual0  +    -0.03295349620606 * 
        G_Garage_Qual1  +     0.01473130042037 * G_Garage_Qual2
          +    -0.05736939534969 * G_House_Style0  +     0.04972662506291 * 
        G_House_Style1  +     0.03109690121371 * G_House_Style2
          +    -0.14342754785448 * G_House_Style3  +    -0.04814206768118 * 
        G_House_Style4  +    -0.02179139086775 * G_Kitchen_Qual0
          +     0.14771881188404 * G_Kitchen_Qual1  +     0.10596274419645 * 
        G_Kitchen_Qual2  +     0.13701430747489 * G_MS_SubClass0
          +     0.10184289815912 * G_MS_SubClass1  +     0.16831554565432 * 
        G_MS_SubClass2  +     0.04978150528284 * G_MS_SubClass3
          +     0.01239370326875 * G_MS_SubClass4  +     0.10230263094189 * 
        G_MS_SubClass5  +     0.05310370661763 * G_MS_SubClass6
          +     0.00654860365962 * G_MS_SubClass7  +    -0.04728149689511 * 
        G_Neighborhood0  +    -0.11354588847298 * G_Neighborhood1
          +    -0.05055099238639 * G_Neighborhood2  +    -0.10414806667869 * 
        G_Neighborhood3  +    -0.01516167535165 * G_Neighborhood4
          +    -0.13542799543698 * G_Neighborhood5  +    -0.08106288389754 * 
        G_Neighborhood6  +     -0.0549456681341 * G_Neighborhood7
          +    -0.02773196429181 * G_Neighborhood8  +     0.03189343961152 * 
        G_Neighborhood9  +     0.00276492988063 * G_Neighborhood10
          +    -0.04842482613962 * G_Neighborhood11  +    -0.08957805752379 * 
        G_Neighborhood12  +      0.0657683365811 * G_Pool_QC0
          +    -0.08726064106902 * G_Pool_QC1  +    -0.06216117909849 * 
        G_Roof_Matl0  +    -0.04534351702229 * G_Roof_Matl1
          +     0.23966693600626 * G_Sale_Condition0
          +    -0.19249578264179 * G_Sale_Condition1
          +    -0.14095656386432 * G_Sale_Condition2
          +     0.12216846046908 * G_Sale_Condition3
          +    -0.09030649764893 * Land_ContourBnk  +    -0.06048735397557 * 
        Land_ContourHLS  +     0.08157075590116 * Land_ContourLow ;
   H102  = H102  +    -0.09128499615068 * Exter_QualEx
          +    -0.16824215896909 * Exter_QualFa  +    -0.06351637449219 * 
        Exter_QualGd  +    -0.08733451102824 * G_Bldg_Type0
          +     0.09986092237974 * G_Bldg_Type1  +     -0.0078598566817 * 
        G_Bldg_Type2  +     0.10204558179973 * G_Bsmt_Exposure0
          +     0.22480515382759 * G_Bsmt_Exposure1  +     0.07619066870605 * 
        G_Bsmt_Exposure2  +     0.09293871304667 * G_Bsmt_Exposure3
          +     0.28229783180744 * G_Bsmt_Qual0  +    -0.10334045120173 * 
        G_Bsmt_Qual1  +    -0.04112478412699 * G_Bsmt_Qual2
          +     0.00752280503581 * G_Condition_10  +    -0.09325402796397 * 
        G_Condition_11  +    -0.33304632796754 * G_Condition_12
          +    -0.05729019497275 * G_Condition_13  +     0.09152005570425 * 
        G_Condition_20  +        -0.2415640079 * G_Condition_21
          +      0.0575694212363 * G_Condition_22  +    -0.11830401600633 * 
        G_Exterior_1st0  +     0.10192092570743 * G_Exterior_1st1
          +    -0.05951536127009 * G_Exterior_1st2  +     -0.1544887883369 * 
        G_Exterior_1st3  +    -0.02885239785438 * G_Exterior_1st4
          +    -0.12399086606839 * G_Exterior_1st5  +    -0.12161926253838 * 
        G_Exterior_1st6  +     0.03757336455358 * G_Exterior_1st7
          +     0.05541550965103 * G_Functional0  +     -0.1146422731856 * 
        G_Functional1  +    -0.08616807403822 * G_Functional2
          +      0.0608402494265 * G_Garage_Qual0  +    -0.20371408844478 * 
        G_Garage_Qual1  +    -0.17702075960023 * G_Garage_Qual2
          +    -0.11902093194853 * G_House_Style0  +    -0.20144985544533 * 
        G_House_Style1  +     0.14880651905333 * G_House_Style2
          +    -0.24756546899739 * G_House_Style3  +    -0.02879711024823 * 
        G_House_Style4  +      0.3537372427843 * G_Kitchen_Qual0
          +    -0.01778347580566 * G_Kitchen_Qual1  +    -0.00358665489966 * 
        G_Kitchen_Qual2  +    -0.13824847657963 * G_MS_SubClass0
          +     0.04768420477512 * G_MS_SubClass1  +     0.02405142265725 * 
        G_MS_SubClass2  +    -0.12506460400019 * G_MS_SubClass3
          +     0.01122001883968 * G_MS_SubClass4  +    -0.01170517713234 * 
        G_MS_SubClass5  +    -0.05259770628173 * G_MS_SubClass6
          +     0.02658546792883 * G_MS_SubClass7  +     0.31148113146649 * 
        G_Neighborhood0  +     0.15900646338328 * G_Neighborhood1
          +     0.28743343467354 * G_Neighborhood2  +     0.18514457232917 * 
        G_Neighborhood3  +     0.02295199766441 * G_Neighborhood4
          +     0.11844503866114 * G_Neighborhood5  +     0.18944850154012 * 
        G_Neighborhood6  +     0.11511557731539 * G_Neighborhood7
          +     0.38486276550882 * G_Neighborhood8  +     0.01380319718445 * 
        G_Neighborhood9  +     0.02173916137098 * G_Neighborhood10
          +     0.07627267504414 * G_Neighborhood11  +     0.06985865006924 * 
        G_Neighborhood12  +     0.00589038965031 * G_Pool_QC0
          +     0.21034588795211 * G_Pool_QC1  +    -0.00378450825008 * 
        G_Roof_Matl0  +    -0.04052744517385 * G_Roof_Matl1
          +    -0.09064305629457 * G_Sale_Condition0
          +    -0.11770894692438 * G_Sale_Condition1
          +    -0.00430338634872 * G_Sale_Condition2
          +    -0.02381609036178 * G_Sale_Condition3
          +     0.14087876976212 * Land_ContourBnk  +     0.00401876282271 * 
        Land_ContourHLS  +      0.0527679083847 * Land_ContourLow ;
   H103  = H103  +    -0.18726611216857 * Exter_QualEx
          +     0.08187936597033 * Exter_QualFa  +     0.42018035599593 * 
        Exter_QualGd  +     0.05079744468144 * G_Bldg_Type0
          +    -0.14505365319769 * G_Bldg_Type1  +    -0.24981320429309 * 
        G_Bldg_Type2  +     0.05895541438276 * G_Bsmt_Exposure0
          +     0.00660160055807 * G_Bsmt_Exposure1  +    -0.15566913260843 * 
        G_Bsmt_Exposure2  +    -0.07815127542215 * G_Bsmt_Exposure3
          +      0.1669757128057 * G_Bsmt_Qual0  +     0.13181337904624 * 
        G_Bsmt_Qual1  +     0.42486131972537 * G_Bsmt_Qual2
          +    -0.21372285906871 * G_Condition_10  +    -0.13178087095127 * 
        G_Condition_11  +    -0.51157739604541 * G_Condition_12
          +    -0.14358960328696 * G_Condition_13  +    -0.05594131683279 * 
        G_Condition_20  +    -0.15302353835435 * G_Condition_21
          +     0.06468173521518 * G_Condition_22  +    -0.08914649073451 * 
        G_Exterior_1st0  +    -0.15311026561034 * G_Exterior_1st1
          +    -0.02948596268346 * G_Exterior_1st2  +     0.04356796890635 * 
        G_Exterior_1st3  +     0.04848873362506 * G_Exterior_1st4
          +    -0.16407902619046 * G_Exterior_1st5  +    -0.07366289218701 * 
        G_Exterior_1st6  +    -0.07924222943767 * G_Exterior_1st7
          +     0.51865596202196 * G_Functional0  +      0.1239976758719 * 
        G_Functional1  +     0.09433231782872 * G_Functional2
          +    -0.18646566787231 * G_Garage_Qual0  +     0.07598740155698 * 
        G_Garage_Qual1  +    -0.24521831438078 * G_Garage_Qual2
          +     0.12055941938654 * G_House_Style0  +     0.10082061149934 * 
        G_House_Style1  +      0.1126009829774 * G_House_Style2
          +     0.17455925621042 * G_House_Style3  +     0.02553851495077 * 
        G_House_Style4  +    -0.03412621808527 * G_Kitchen_Qual0
          +     0.00283924588345 * G_Kitchen_Qual1  +     0.27906675524706 * 
        G_Kitchen_Qual2  +     0.33193590007383 * G_MS_SubClass0
          +     0.04183436915961 * G_MS_SubClass1  +    -0.05953486328293 * 
        G_MS_SubClass2  +    -0.10954372289152 * G_MS_SubClass3
          +    -0.17547777892915 * G_MS_SubClass4  +     0.06687571403103 * 
        G_MS_SubClass5  +    -0.00309184212436 * G_MS_SubClass6
          +    -0.05310584561434 * G_MS_SubClass7  +     0.12914936658121 * 
        G_Neighborhood0  +     0.10439215613797 * G_Neighborhood1
          +     0.27464610308976 * G_Neighborhood2  +     0.25454414770824 * 
        G_Neighborhood3  +    -0.00941720620343 * G_Neighborhood4
          +     0.09321239186808 * G_Neighborhood5  +     0.38469130983628 * 
        G_Neighborhood6  +     0.12094970863127 * G_Neighborhood7
          +     0.04675560660471 * G_Neighborhood8  +     0.02533863515485 * 
        G_Neighborhood9  +     0.16711327945038 * G_Neighborhood10
          +     0.36231357297515 * G_Neighborhood11  +    -0.05280553937419 * 
        G_Neighborhood12  +    -0.07874164648038 * G_Pool_QC0
          +     0.08186919095082 * G_Pool_QC1  +    -0.09629438080271 * 
        G_Roof_Matl0  +      0.0961276710479 * G_Roof_Matl1
          +    -0.16044520112768 * G_Sale_Condition0
          +     0.33490740018935 * G_Sale_Condition1
          +    -0.01076045384521 * G_Sale_Condition2
          +    -0.01657514780415 * G_Sale_Condition3
          +     0.21264928986767 * Land_ContourBnk  +     0.19695421459447 * 
        Land_ContourHLS  +     0.21105002068607 * Land_ContourLow ;
   H104  = H104  +    -0.06708328482143 * Exter_QualEx
          +     0.18436745980596 * Exter_QualFa  +     0.26434781874891 * 
        Exter_QualGd  +     0.05542990356138 * G_Bldg_Type0
          +    -0.00394965995297 * G_Bldg_Type1  +    -0.17333690570397 * 
        G_Bldg_Type2  +     0.09047039071294 * G_Bsmt_Exposure0
          +     0.08450149134491 * G_Bsmt_Exposure1  +    -0.10229163429248 * 
        G_Bsmt_Exposure2  +     0.06495239908998 * G_Bsmt_Exposure3
          +     0.09568267516225 * G_Bsmt_Qual0  +     -0.1153811789997 * 
        G_Bsmt_Qual1  +     0.14764048688762 * G_Bsmt_Qual2
          +    -0.04466511022565 * G_Condition_10  +     0.01283986375245 * 
        G_Condition_11  +     0.00013487968171 * G_Condition_12
          +    -0.12234246108104 * G_Condition_13  +    -0.10952287772776 * 
        G_Condition_20  +    -0.10643611479945 * G_Condition_21
          +     0.13245823685766 * G_Condition_22  +    -0.14550758572988 * 
        G_Exterior_1st0  +     -0.2830329666866 * G_Exterior_1st1
          +      0.1348899081361 * G_Exterior_1st2  +    -0.02358878393868 * 
        G_Exterior_1st3  +     0.04731878152068 * G_Exterior_1st4
          +    -0.00695778454536 * G_Exterior_1st5  +    -0.19521933747115 * 
        G_Exterior_1st6  +    -0.08336128420794 * G_Exterior_1st7
          +      -0.186070226819 * G_Functional0  +     0.00123510550196 * 
        G_Functional1  +     0.04031438860659 * G_Functional2
          +     -0.0859028055277 * G_Garage_Qual0  +    -0.11297877923015 * 
        G_Garage_Qual1  +     0.10076458476525 * G_Garage_Qual2
          +    -0.10067949015405 * G_House_Style0  +    -0.24388445644153 * 
        G_House_Style1  +    -0.03257565505906 * G_House_Style2
          +     0.11344561400912 * G_House_Style3  +    -0.13284568175784 * 
        G_House_Style4  +    -0.16788478290221 * G_Kitchen_Qual0
          +     0.11678695232548 * G_Kitchen_Qual1  +    -0.12342574911963 * 
        G_Kitchen_Qual2  +     0.10113590002967 * G_MS_SubClass0
          +     0.10860920969941 * G_MS_SubClass1  +     0.03669216040596 * 
        G_MS_SubClass2  +     0.01005340154959 * G_MS_SubClass3
          +     0.05857212554377 * G_MS_SubClass4  +    -0.03188347967164 * 
        G_MS_SubClass5  +    -0.03397219586448 * G_MS_SubClass6
          +    -0.02339247146526 * G_MS_SubClass7  +      0.0514126338758 * 
        G_Neighborhood0  +     0.01844150508656 * G_Neighborhood1
          +      0.0555209157343 * G_Neighborhood2  +     0.04763171738728 * 
        G_Neighborhood3  +    -0.04981975078262 * G_Neighborhood4
          +    -0.01725089723339 * G_Neighborhood5  +    -0.12799682384717 * 
        G_Neighborhood6  +       0.010887787239 * G_Neighborhood7
          +     0.13147132489218 * G_Neighborhood8  +     0.11356614610413 * 
        G_Neighborhood9  +     0.11178956947134 * G_Neighborhood10
          +     0.06695116653092 * G_Neighborhood11  +     0.18951564107808 * 
        G_Neighborhood12  +     0.07974250931137 * G_Pool_QC0
          +     0.02040612290397 * G_Pool_QC1  +    -0.00033935719444 * 
        G_Roof_Matl0  +     0.04083614038591 * G_Roof_Matl1
          +     0.16204757135352 * G_Sale_Condition0
          +     0.13370965205462 * G_Sale_Condition1
          +     0.07349090930231 * G_Sale_Condition2
          +    -0.19643834133612 * G_Sale_Condition3
          +     0.04412533911819 * Land_ContourBnk  +    -0.20288423755475 * 
        Land_ContourHLS  +     0.11015728846976 * Land_ContourLow ;
   H105  = H105  +     0.11180878876525 * Exter_QualEx
          +     -0.0258089425336 * Exter_QualFa  +    -0.07508593127457 * 
        Exter_QualGd  +     0.11874476467484 * G_Bldg_Type0
          +    -0.21409773853122 * G_Bldg_Type1  +     0.03048256936911 * 
        G_Bldg_Type2  +    -0.00945386308243 * G_Bsmt_Exposure0
          +    -0.10693605021308 * G_Bsmt_Exposure1  +     0.06994041402473 * 
        G_Bsmt_Exposure2  +    -0.28992258111709 * G_Bsmt_Exposure3
          +     0.04893943612381 * G_Bsmt_Qual0  +     0.11368416760206 * 
        G_Bsmt_Qual1  +     0.10199230408293 * G_Bsmt_Qual2
          +    -0.05202112341266 * G_Condition_10  +    -0.17778746379065 * 
        G_Condition_11  +    -0.52717104062066 * G_Condition_12
          +    -0.09496039431213 * G_Condition_13  +    -0.00310598506013 * 
        G_Condition_20  +    -0.34859543641388 * G_Condition_21
          +     0.26977242231982 * G_Condition_22  +    -0.05617722723728 * 
        G_Exterior_1st0  +     0.14397360439968 * G_Exterior_1st1
          +    -0.12566904640375 * G_Exterior_1st2  +     0.07184155901319 * 
        G_Exterior_1st3  +     0.07056748484242 * G_Exterior_1st4
          +    -0.11787008874359 * G_Exterior_1st5  +    -0.02963256226871 * 
        G_Exterior_1st6  +     0.14211497038021 * G_Exterior_1st7
          +     0.08849833335769 * G_Functional0  +    -0.01753132666749 * 
        G_Functional1  +     0.01306388159978 * G_Functional2
          +    -0.08811693314762 * G_Garage_Qual0  +    -0.02065307716023 * 
        G_Garage_Qual1  +    -0.24660312925334 * G_Garage_Qual2
          +     0.14594121059635 * G_House_Style0  +     0.09720894668014 * 
        G_House_Style1  +     0.05071524765958 * G_House_Style2
          +     -0.1108619391527 * G_House_Style3  +    -0.08723414130615 * 
        G_House_Style4  +    -0.14635884406729 * G_Kitchen_Qual0
          +    -0.22778348688042 * G_Kitchen_Qual1  +    -0.05367646703429 * 
        G_Kitchen_Qual2  +    -0.13476984419864 * G_MS_SubClass0
          +    -0.12318837581463 * G_MS_SubClass1  +     0.03332255231949 * 
        G_MS_SubClass2  +    -0.17430391513338 * G_MS_SubClass3
          +    -0.04676882550056 * G_MS_SubClass4  +     0.08883821585175 * 
        G_MS_SubClass5  +    -0.03567888368906 * G_MS_SubClass6
          +     0.00470159277351 * G_MS_SubClass7  +      0.2142185743559 * 
        G_Neighborhood0  +    -0.11362232627715 * G_Neighborhood1
          +       0.206176036659 * G_Neighborhood2  +    -0.03599309736138 * 
        G_Neighborhood3  +     0.20116579772064 * G_Neighborhood4
          +     0.29391740244626 * G_Neighborhood5  +     0.08246687435961 * 
        G_Neighborhood6  +     0.13516222668292 * G_Neighborhood7
          +     0.19531742570451 * G_Neighborhood8  +     0.19570337149717 * 
        G_Neighborhood9  +     0.15406727531052 * G_Neighborhood10
          +     0.09409852399784 * G_Neighborhood11  +    -0.16647796921658 * 
        G_Neighborhood12  +     -0.2014157930451 * G_Pool_QC0
          +      0.2355647802407 * G_Pool_QC1  +    -0.02459746179668 * 
        G_Roof_Matl0  +     0.00352414848005 * G_Roof_Matl1
          +     0.01629389501232 * G_Sale_Condition0
          +    -0.23283220765825 * G_Sale_Condition1
          +    -0.00478876142876 * G_Sale_Condition2
          +    -0.21477670603989 * G_Sale_Condition3
          +     0.45273381842827 * Land_ContourBnk  +     0.19969124318047 * 
        Land_ContourHLS  +     0.28597369055887 * Land_ContourLow ;
   H106  = H106  +     0.16567923606345 * Exter_QualEx
          +     0.09165020932817 * Exter_QualFa  +     0.10673552479462 * 
        Exter_QualGd  +     0.02241432311674 * G_Bldg_Type0
          +    -0.13716144049593 * G_Bldg_Type1  +      0.0008501819483 * 
        G_Bldg_Type2  +    -0.06325633420978 * G_Bsmt_Exposure0
          +    -0.24266237739985 * G_Bsmt_Exposure1  +     0.11405353591956 * 
        G_Bsmt_Exposure2  +    -0.09476410350679 * G_Bsmt_Exposure3
          +     0.24907963773477 * G_Bsmt_Qual0  +    -0.11859950854405 * 
        G_Bsmt_Qual1  +     -0.2460281525025 * G_Bsmt_Qual2
          +    -0.19105523298031 * G_Condition_10  +    -0.04503973279655 * 
        G_Condition_11  +    -0.05014046537731 * G_Condition_12
          +    -0.06829793383455 * G_Condition_13  +     0.09383041593154 * 
        G_Condition_20  +     0.00907860512807 * G_Condition_21
          +     0.01035882933506 * G_Condition_22  +    -0.26182496510831 * 
        G_Exterior_1st0  +     0.15388747063395 * G_Exterior_1st1
          +     0.02169842375697 * G_Exterior_1st2  +    -0.13698954669071 * 
        G_Exterior_1st3  +    -0.05678714977487 * G_Exterior_1st4
          +     0.21358542284894 * G_Exterior_1st5  +     0.00133887760178 * 
        G_Exterior_1st6  +     0.06235892868986 * G_Exterior_1st7
          +     0.09297136757028 * G_Functional0  +     0.01845907466115 * 
        G_Functional1  +     0.06604978051852 * G_Functional2
          +    -0.06232706029543 * G_Garage_Qual0  +     0.09634911649268 * 
        G_Garage_Qual1  +    -0.16544895261372 * G_Garage_Qual2
          +     0.16752728520502 * G_House_Style0  +    -0.01502715263916 * 
        G_House_Style1  +    -0.20175183528591 * G_House_Style2
          +    -0.02113029357416 * G_House_Style3  +    -0.35415203732006 * 
        G_House_Style4  +     0.16133281149046 * G_Kitchen_Qual0
          +    -0.05430674783048 * G_Kitchen_Qual1  +     0.01986183290007 * 
        G_Kitchen_Qual2  +     0.07475373651021 * G_MS_SubClass0
          +     0.01151616771749 * G_MS_SubClass1  +     0.10384451439543 * 
        G_MS_SubClass2  +    -0.10059459335846 * G_MS_SubClass3
          +     0.04544367541199 * G_MS_SubClass4  +    -0.07209990998522 * 
        G_MS_SubClass5  +    -0.01223036444802 * G_MS_SubClass6
          +     0.03078990012932 * G_MS_SubClass7  +    -0.17480121506404 * 
        G_Neighborhood0  +    -0.05377929169024 * G_Neighborhood1
          +    -0.04496190459545 * G_Neighborhood2  +     0.10891556737089 * 
        G_Neighborhood3  +    -0.21101847189179 * G_Neighborhood4
          +    -0.16767925003167 * G_Neighborhood5  +    -0.07771909299089 * 
        G_Neighborhood6  +    -0.03582735841982 * G_Neighborhood7
          +    -0.07027151185203 * G_Neighborhood8  +     0.03777714196586 * 
        G_Neighborhood9  +     0.23092957801297 * G_Neighborhood10
          +     -0.1174084326194 * G_Neighborhood11  +      0.1943927764063 * 
        G_Neighborhood12  +    -0.19478128105525 * G_Pool_QC0
          +     -0.0333574110274 * G_Pool_QC1  +    -0.06908573891514 * 
        G_Roof_Matl0  +    -0.07317649081019 * G_Roof_Matl1
          +    -0.19769125112789 * G_Sale_Condition0
          +     -0.1440600205767 * G_Sale_Condition1
          +    -0.05953209615316 * G_Sale_Condition2
          +    -0.15438078756096 * G_Sale_Condition3
          +     0.05032585251003 * Land_ContourBnk  +     0.35234409992676 * 
        Land_ContourHLS  +     0.13437971881438 * Land_ContourLow ;
   H107  = H107  +    -0.04707259263034 * Exter_QualEx
          +    -0.11798573076156 * Exter_QualFa  +     0.03116744152326 * 
        Exter_QualGd  +     -0.0696330360137 * G_Bldg_Type0
          +    -0.07369692435002 * G_Bldg_Type1  +    -0.25075176418466 * 
        G_Bldg_Type2  +      0.1619040496613 * G_Bsmt_Exposure0
          +    -0.01569936865871 * G_Bsmt_Exposure1  +     0.04419936638472 * 
        G_Bsmt_Exposure2  +     -0.0466723119896 * G_Bsmt_Exposure3
          +     0.06136636637382 * G_Bsmt_Qual0  +     -0.0637804291038 * 
        G_Bsmt_Qual1  +    -0.10231690935645 * G_Bsmt_Qual2
          +     0.00138753790783 * G_Condition_10  +    -0.05131433280157 * 
        G_Condition_11  +     0.22130716632005 * G_Condition_12
          +    -0.09352202635254 * G_Condition_13  +    -0.10584268973745 * 
        G_Condition_20  +    -0.00650067342214 * G_Condition_21
          +    -0.17017930066498 * G_Condition_22  +     0.30127444200543 * 
        G_Exterior_1st0  +    -0.15906194837596 * G_Exterior_1st1
          +     0.04510999020154 * G_Exterior_1st2  +     0.07255709016385 * 
        G_Exterior_1st3  +    -0.06700721867452 * G_Exterior_1st4
          +    -0.05574385716295 * G_Exterior_1st5  +    -0.25469743913228 * 
        G_Exterior_1st6  +    -0.05111557268807 * G_Exterior_1st7
          +    -0.10331519632944 * G_Functional0  +     0.08016040281172 * 
        G_Functional1  +     0.08124561023171 * G_Functional2
          +     0.05045339786797 * G_Garage_Qual0  +      0.1294112465604 * 
        G_Garage_Qual1  +    -0.25075217360566 * G_Garage_Qual2
          +    -0.16289213838586 * G_House_Style0  +    -0.19559443412216 * 
        G_House_Style1  +     0.04339127013814 * G_House_Style2
          +     0.09486750370955 * G_House_Style3  +     0.06617507469997 * 
        G_House_Style4  +     0.02673603861777 * G_Kitchen_Qual0
          +     0.03456741165403 * G_Kitchen_Qual1  +     0.27079887393778 * 
        G_Kitchen_Qual2  +    -0.17360796964076 * G_MS_SubClass0
          +     0.08868389863415 * G_MS_SubClass1  +     0.11272914458689 * 
        G_MS_SubClass2  +    -0.09193763432246 * G_MS_SubClass3
          +    -0.00885102683437 * G_MS_SubClass4  +    -0.05623154872486 * 
        G_MS_SubClass5  +     -0.0485580197455 * G_MS_SubClass6
          +    -0.00935223547808 * G_MS_SubClass7  +    -0.03133415761722 * 
        G_Neighborhood0  +     0.07031671081404 * G_Neighborhood1
          +    -0.00898173041325 * G_Neighborhood2  +     0.09991737546417 * 
        G_Neighborhood3  +     0.03615730352808 * G_Neighborhood4
          +    -0.14090518253118 * G_Neighborhood5  +    -0.04327062699625 * 
        G_Neighborhood6  +     -0.0659078136358 * G_Neighborhood7
          +    -0.01016656252401 * G_Neighborhood8  +    -0.03038241510668 * 
        G_Neighborhood9  +    -0.09967097446556 * G_Neighborhood10
          +     0.15900820321372 * G_Neighborhood11  +    -0.04836489029709 * 
        G_Neighborhood12  +     0.02123715249864 * G_Pool_QC0
          +    -0.08634863802239 * G_Pool_QC1  +    -0.05575691937499 * 
        G_Roof_Matl0  +    -0.14578598182261 * G_Roof_Matl1
          +     0.11446916936323 * G_Sale_Condition0
          +     0.21260058657259 * G_Sale_Condition1
          +     0.10824975382682 * G_Sale_Condition2
          +    -0.04944543693325 * G_Sale_Condition3
          +    -0.05225477860051 * Land_ContourBnk  +     0.07209746979979 * 
        Land_ContourHLS  +    -0.06566991485664 * Land_ContourLow ;
   H108  = H108  +     0.02942383059169 * Exter_QualEx
          +     -0.2162266204203 * Exter_QualFa  +     0.04367498692819 * 
        Exter_QualGd  +      0.0061349766713 * G_Bldg_Type0
          +    -0.13861382321772 * G_Bldg_Type1  +    -0.26881865810197 * 
        G_Bldg_Type2  +     0.18119538716462 * G_Bsmt_Exposure0
          +    -0.00816865301504 * G_Bsmt_Exposure1  +    -0.00705233536044 * 
        G_Bsmt_Exposure2  +    -0.14503461697924 * G_Bsmt_Exposure3
          +     0.07037578367932 * G_Bsmt_Qual0  +     -0.1218620063879 * 
        G_Bsmt_Qual1  +    -0.10244654845632 * G_Bsmt_Qual2
          +     0.00865959305471 * G_Condition_10  +    -0.28765288954984 * 
        G_Condition_11  +     0.05785654728839 * G_Condition_12
          +    -0.01143340165076 * G_Condition_13  +     -0.0558893524333 * 
        G_Condition_20  +     0.15951324385515 * G_Condition_21
          +     0.03046104956388 * G_Condition_22  +    -0.15506000420808 * 
        G_Exterior_1st0  +     0.04895876945822 * G_Exterior_1st1
          +    -0.08041781148836 * G_Exterior_1st2  +     0.17104700746109 * 
        G_Exterior_1st3  +      0.1050123658239 * G_Exterior_1st4
          +    -0.03437692914329 * G_Exterior_1st5  +     0.06744816408559 * 
        G_Exterior_1st6  +    -0.00589331163161 * G_Exterior_1st7
          +    -0.08507392250332 * G_Functional0  +    -0.02059268567126 * 
        G_Functional1  +     0.11150002413773 * G_Functional2
          +     0.15467138889414 * G_Garage_Qual0  +     0.02607179171074 * 
        G_Garage_Qual1  +    -0.18091769710985 * G_Garage_Qual2
          +     0.08442018277314 * G_House_Style0  +     0.15797835610413 * 
        G_House_Style1  +    -0.13451786258159 * G_House_Style2
          +     0.00349825021972 * G_House_Style3  +    -0.06265544297506 * 
        G_House_Style4  +     0.09439257925647 * G_Kitchen_Qual0
          +     -0.0290033997246 * G_Kitchen_Qual1  +     0.10773035853142 * 
        G_Kitchen_Qual2  +    -0.08220133876413 * G_MS_SubClass0
          +      0.0109473633952 * G_MS_SubClass1  +    -0.00775443624204 * 
        G_MS_SubClass2  +    -0.04801231382426 * G_MS_SubClass3
          +    -0.07565172079554 * G_MS_SubClass4  +     0.25143585143216 * 
        G_MS_SubClass5  +      0.0697312532685 * G_MS_SubClass6
          +    -0.17624475644783 * G_MS_SubClass7  +     0.05174657441687 * 
        G_Neighborhood0  +     0.06514628382785 * G_Neighborhood1
          +    -0.24886933101021 * G_Neighborhood2  +     0.08565364000874 * 
        G_Neighborhood3  +     0.06004416180186 * G_Neighborhood4
          +     0.01869686515194 * G_Neighborhood5  +    -0.02564215443527 * 
        G_Neighborhood6  +    -0.10866463819428 * G_Neighborhood7
          +    -0.09805154852506 * G_Neighborhood8  +     0.10066882103153 * 
        G_Neighborhood9  +     0.02153716131973 * G_Neighborhood10
          +     -0.0139187923344 * G_Neighborhood11  +     0.14094219052725 * 
        G_Neighborhood12  +    -0.07375955809013 * G_Pool_QC0
          +    -0.14646896528812 * G_Pool_QC1  +     0.00275224907605 * 
        G_Roof_Matl0  +     0.07995493684526 * G_Roof_Matl1
          +    -0.04440316499275 * G_Sale_Condition0
          +     0.08021700180448 * G_Sale_Condition1
          +     0.02482565001062 * G_Sale_Condition2
          +    -0.16513301532267 * G_Sale_Condition3
          +     0.02203567970599 * Land_ContourBnk  +    -0.04111454332597 * 
        Land_ContourHLS  +     0.02055734089674 * Land_ContourLow ;
   H109  = H109  +    -0.02024555778412 * Exter_QualEx
          +     0.17113239981386 * Exter_QualFa  +     0.00379887602096 * 
        Exter_QualGd  +    -0.06176477998089 * G_Bldg_Type0
          +    -0.01950311852476 * G_Bldg_Type1  +    -0.04410346539641 * 
        G_Bldg_Type2  +    -0.12052612165877 * G_Bsmt_Exposure0
          +    -0.04280262014643 * G_Bsmt_Exposure1  +    -0.01027989158692 * 
        G_Bsmt_Exposure2  +    -0.01995551423444 * G_Bsmt_Exposure3
          +     0.25698583389321 * G_Bsmt_Qual0  +     0.24501629286289 * 
        G_Bsmt_Qual1  +     0.13194103564531 * G_Bsmt_Qual2
          +      0.0874528034312 * G_Condition_10  +    -0.00435334447404 * 
        G_Condition_11  +    -0.26569053262522 * G_Condition_12
          +     0.00532364314903 * G_Condition_13  +    -0.06336698438105 * 
        G_Condition_20  +     -0.1002868778155 * G_Condition_21
          +     0.17784918265421 * G_Condition_22  +     0.03512023658584 * 
        G_Exterior_1st0  +    -0.00606583819738 * G_Exterior_1st1
          +     0.19475864390381 * G_Exterior_1st2  +    -0.06999081055659 * 
        G_Exterior_1st3  +     -0.1125209474531 * G_Exterior_1st4
          +     0.08950631554829 * G_Exterior_1st5  +    -0.13227221777328 * 
        G_Exterior_1st6  +     0.08178164617248 * G_Exterior_1st7
          +      0.0001466318093 * G_Functional0  +    -0.08714683817738 * 
        G_Functional1  +    -0.28570906908008 * G_Functional2
          +      0.0914387890013 * G_Garage_Qual0  +     0.04702126490269 * 
        G_Garage_Qual1  +     -0.0856908915732 * G_Garage_Qual2
          +     0.10359353798216 * G_House_Style0  +    -0.01253682482002 * 
        G_House_Style1  +     0.09543326243039 * G_House_Style2
          +    -0.10079535292275 * G_House_Style3  +    -0.12219192703182 * 
        G_House_Style4  +    -0.01853088195327 * G_Kitchen_Qual0
          +     0.06096470631641 * G_Kitchen_Qual1  +    -0.12533662294527 * 
        G_Kitchen_Qual2  +     0.17041470959789 * G_MS_SubClass0
          +     0.02857808781688 * G_MS_SubClass1  +     0.03981680531712 * 
        G_MS_SubClass2  +    -0.03877692994045 * G_MS_SubClass3
          +       0.183578371935 * G_MS_SubClass4  +    -0.01464507809277 * 
        G_MS_SubClass5  +     0.16070025275483 * G_MS_SubClass6
          +    -0.03338704989552 * G_MS_SubClass7  +      0.0883406557642 * 
        G_Neighborhood0  +     0.01007681576491 * G_Neighborhood1
          +     0.15664839630086 * G_Neighborhood2  +     0.08790646378144 * 
        G_Neighborhood3  +     0.11690525354005 * G_Neighborhood4
          +     -0.0166408209566 * G_Neighborhood5  +     0.00928441930747 * 
        G_Neighborhood6  +     0.21390317102001 * G_Neighborhood7
          +    -0.02855187588578 * G_Neighborhood8  +     0.03174169506032 * 
        G_Neighborhood9  +     0.12352533505592 * G_Neighborhood10
          +     0.04199787950891 * G_Neighborhood11  +     0.01025091408943 * 
        G_Neighborhood12  +    -0.00663409626141 * G_Pool_QC0
          +     0.09333335219953 * G_Pool_QC1  +    -0.04918319407167 * 
        G_Roof_Matl0  +     0.14085848790977 * G_Roof_Matl1
          +     0.14381078070388 * G_Sale_Condition0
          +    -0.32929201002368 * G_Sale_Condition1
          +    -0.00621059073442 * G_Sale_Condition2
          +     -0.0692797876767 * G_Sale_Condition3
          +     0.29585062590753 * Land_ContourBnk  +      0.1291342500332 * 
        Land_ContourHLS  +       0.099873671149 * Land_ContourLow ;
   H110  = H110  +      0.0576543939992 * Exter_QualEx
          +    -0.10949704943785 * Exter_QualFa  +     0.06929182525911 * 
        Exter_QualGd  +      0.0872733760967 * G_Bldg_Type0
          +    -0.26584071753846 * G_Bldg_Type1  +     0.14457526352595 * 
        G_Bldg_Type2  +     -0.3620877280864 * G_Bsmt_Exposure0
          +     0.00375943838294 * G_Bsmt_Exposure1  +     0.07639016295421 * 
        G_Bsmt_Exposure2  +     0.01461487286982 * G_Bsmt_Exposure3
          +    -0.00960193076953 * G_Bsmt_Qual0  +    -0.06445510623915 * 
        G_Bsmt_Qual1  +    -0.01917980974667 * G_Bsmt_Qual2
          +     0.03253754848368 * G_Condition_10  +    -0.02229904258278 * 
        G_Condition_11  +     0.10035090705426 * G_Condition_12
          +    -0.15225537053696 * G_Condition_13  +     0.10229761066825 * 
        G_Condition_20  +     0.16004221516854 * G_Condition_21
          +    -0.00651725567485 * G_Condition_22  +     0.01818734499146 * 
        G_Exterior_1st0  +     0.00788795613387 * G_Exterior_1st1
          +    -0.10136951363248 * G_Exterior_1st2  +     0.08066185579903 * 
        G_Exterior_1st3  +    -0.07249238032047 * G_Exterior_1st4
          +     0.05333665888149 * G_Exterior_1st5  +    -0.03263751318548 * 
        G_Exterior_1st6  +     0.06740056474561 * G_Exterior_1st7
          +    -0.37592161553899 * G_Functional0  +    -0.12195416702389 * 
        G_Functional1  +     0.36865189863686 * G_Functional2
          +      0.0753210310756 * G_Garage_Qual0  +     0.04341743255134 * 
        G_Garage_Qual1  +      0.0858839938321 * G_Garage_Qual2
          +       0.096884418177 * G_House_Style0  +    -0.08079628640614 * 
        G_House_Style1  +     0.14516161989886 * G_House_Style2
          +    -0.13809724644209 * G_House_Style3  +     0.15202272930412 * 
        G_House_Style4  +    -0.21914632204351 * G_Kitchen_Qual0
          +    -0.05924989304654 * G_Kitchen_Qual1  +    -0.14691362025575 * 
        G_Kitchen_Qual2  +     0.08709024596068 * G_MS_SubClass0
          +     0.19993821089905 * G_MS_SubClass1  +     0.08911505458112 * 
        G_MS_SubClass2  +     0.17649164275845 * G_MS_SubClass3
          +    -0.05248541684987 * G_MS_SubClass4  +     0.19158750921157 * 
        G_MS_SubClass5  +     0.18749607725788 * G_MS_SubClass6
          +      0.1196002063055 * G_MS_SubClass7  +    -0.15350010221445 * 
        G_Neighborhood0  +    -0.08118951038801 * G_Neighborhood1
          +    -0.13752053578742 * G_Neighborhood2  +     0.04024558135669 * 
        G_Neighborhood3  +    -0.18827040988348 * G_Neighborhood4
          +     0.06649299378076 * G_Neighborhood5  +     0.10933300274097 * 
        G_Neighborhood6  +    -0.14890450660899 * G_Neighborhood7
          +     0.26011719438661 * G_Neighborhood8  +     0.29773825321833 * 
        G_Neighborhood9  +     0.33174575973036 * G_Neighborhood10
          +    -0.06334861190838 * G_Neighborhood11  +    -0.01599275371423 * 
        G_Neighborhood12  +    -0.03671777156805 * G_Pool_QC0
          +    -0.35595564010772 * G_Pool_QC1  +      0.0784303441113 * 
        G_Roof_Matl0  +    -0.26251610017114 * G_Roof_Matl1
          +     0.06443418441186 * G_Sale_Condition0
          +    -0.02179633427342 * G_Sale_Condition1
          +    -0.17820089598782 * G_Sale_Condition2
          +     0.06455747178904 * G_Sale_Condition3
          +     0.17605224192512 * Land_ContourBnk  +    -0.12134760995552 * 
        Land_ContourHLS  +    -0.10527638854047 * Land_ContourLow ;
   H111  = H111  +     0.02503895038613 * Exter_QualEx
          +    -0.06456920849696 * Exter_QualFa  +     0.11615610487939 * 
        Exter_QualGd  +    -0.13965978631619 * G_Bldg_Type0
          +     0.16061078168304 * G_Bldg_Type1  +    -0.02996990963156 * 
        G_Bldg_Type2  +    -0.01962583594831 * G_Bsmt_Exposure0
          +     0.13577450378807 * G_Bsmt_Exposure1  +    -0.24729469937388 * 
        G_Bsmt_Exposure2  +    -0.09415232615721 * G_Bsmt_Exposure3
          +     -0.0058083940628 * G_Bsmt_Qual0  +    -0.14130527374147 * 
        G_Bsmt_Qual1  +     0.07635686619996 * G_Bsmt_Qual2
          +    -0.01941670478946 * G_Condition_10  +     0.09944890783769 * 
        G_Condition_11  +    -0.07681728007287 * G_Condition_12
          +    -0.09485918854911 * G_Condition_13  +      0.1068405051296 * 
        G_Condition_20  +     0.00215965879462 * G_Condition_21
          +    -0.07898150962655 * G_Condition_22  +     0.10031182550439 * 
        G_Exterior_1st0  +    -0.08400973788031 * G_Exterior_1st1
          +     0.08024304647456 * G_Exterior_1st2  +     0.11972529248109 * 
        G_Exterior_1st3  +     0.02956509905957 * G_Exterior_1st4
          +     0.07942619275711 * G_Exterior_1st5  +     0.24542119999225 * 
        G_Exterior_1st6  +     0.01330305962328 * G_Exterior_1st7
          +    -0.22499494704263 * G_Functional0  +    -0.33046938270105 * 
        G_Functional1  +     0.13506681755622 * G_Functional2
          +    -0.27825119452616 * G_Garage_Qual0  +    -0.18256204497291 * 
        G_Garage_Qual1  +    -0.09774594335214 * G_Garage_Qual2
          +     0.00089621747517 * G_House_Style0  +    -0.07060423568855 * 
        G_House_Style1  +    -0.11613372646327 * G_House_Style2
          +     0.20237738623689 * G_House_Style3  +    -0.14340572883416 * 
        G_House_Style4  +     0.06009893294736 * G_Kitchen_Qual0
          +    -0.37196394429367 * G_Kitchen_Qual1  +     -0.0047105547432 * 
        G_Kitchen_Qual2  +    -0.07146350762392 * G_MS_SubClass0
          +    -0.00359281661715 * G_MS_SubClass1  +     0.00379456155624 * 
        G_MS_SubClass2  +     0.20946119769765 * G_MS_SubClass3
          +     0.12193241169959 * G_MS_SubClass4  +    -0.01802034356146 * 
        G_MS_SubClass5  +    -0.16376093370505 * G_MS_SubClass6
          +    -0.05353204632404 * G_MS_SubClass7  +      -0.128795223231 * 
        G_Neighborhood0  +    -0.10809867685133 * G_Neighborhood1
          +    -0.28180349250512 * G_Neighborhood2  +    -0.03629049782656 * 
        G_Neighborhood3  +     0.21731825312843 * G_Neighborhood4
          +     -0.0608960068222 * G_Neighborhood5  +    -0.08170690790556 * 
        G_Neighborhood6  +     -0.0118807109425 * G_Neighborhood7
          +    -0.16919671009878 * G_Neighborhood8  +      0.0754907700445 * 
        G_Neighborhood9  +     0.09581188492286 * G_Neighborhood10
          +    -0.21602116154349 * G_Neighborhood11  +    -0.07621919285493 * 
        G_Neighborhood12  +     -0.0579609919058 * G_Pool_QC0
          +    -0.05391232334243 * G_Pool_QC1  +     0.32413985914668 * 
        G_Roof_Matl0  +    -0.16355344473729 * G_Roof_Matl1
          +     0.06428573127994 * G_Sale_Condition0
          +    -0.26779503748511 * G_Sale_Condition1
          +    -0.04244810330334 * G_Sale_Condition2
          +     -0.0626088845963 * G_Sale_Condition3
          +     0.02753775061874 * Land_ContourBnk  +     0.02656437495537 * 
        Land_ContourHLS  +     0.23188608477996 * Land_ContourLow ;
   H112  = H112  +    -0.02153786586981 * Exter_QualEx
          +     0.07491263264783 * Exter_QualFa  +    -0.07254681823312 * 
        Exter_QualGd  +      0.0089676334614 * G_Bldg_Type0
          +     0.07379494701549 * G_Bldg_Type1  +     0.06967812354102 * 
        G_Bldg_Type2  +    -0.02689676034267 * G_Bsmt_Exposure0
          +    -0.02186934199991 * G_Bsmt_Exposure1  +    -0.08610406546885 * 
        G_Bsmt_Exposure2  +     0.02507792796497 * G_Bsmt_Exposure3
          +    -0.07359274669232 * G_Bsmt_Qual0  +     0.02191285846767 * 
        G_Bsmt_Qual1  +    -0.04263340909299 * G_Bsmt_Qual2
          +     0.27177331639005 * G_Condition_10  +     0.19275030734893 * 
        G_Condition_11  +     0.00126989251462 * G_Condition_12
          +     0.15403649608231 * G_Condition_13  +     0.03953247853034 * 
        G_Condition_20  +    -0.10513176789463 * G_Condition_21
          +    -0.07591132968342 * G_Condition_22  +     0.22278333859586 * 
        G_Exterior_1st0  +    -0.05861993843185 * G_Exterior_1st1
          +     0.07965742585483 * G_Exterior_1st2  +     0.09989194118827 * 
        G_Exterior_1st3  +     0.23367156499013 * G_Exterior_1st4
          +     0.03735370144504 * G_Exterior_1st5  +    -0.01431108652026 * 
        G_Exterior_1st6  +     0.16624330366701 * G_Exterior_1st7
          +     0.00173135705008 * G_Functional0  +     0.16273518254291 * 
        G_Functional1  +     0.02031676196206 * G_Functional2
          +     0.04332026692297 * G_Garage_Qual0  +     0.00521428166084 * 
        G_Garage_Qual1  +     0.24455285590972 * G_Garage_Qual2
          +     0.07066992032159 * G_House_Style0  +    -0.10179131294567 * 
        G_House_Style1  +    -0.01681003282832 * G_House_Style2
          +     0.07623120403711 * G_House_Style3  +     0.12092014948018 * 
        G_House_Style4  +     0.00380173071569 * G_Kitchen_Qual0
          +     0.20012923970964 * G_Kitchen_Qual1  +    -0.09913309626308 * 
        G_Kitchen_Qual2  +    -0.04636964589902 * G_MS_SubClass0
          +     0.19630345109836 * G_MS_SubClass1  +     0.25736297205539 * 
        G_MS_SubClass2  +      0.2207998226525 * G_MS_SubClass3
          +    -0.11538482403838 * G_MS_SubClass4  +     0.16052659555086 * 
        G_MS_SubClass5  +     0.07796853928276 * G_MS_SubClass6
          +    -0.11770872378857 * G_MS_SubClass7  +     0.02560839299203 * 
        G_Neighborhood0  +     0.01902819670727 * G_Neighborhood1
          +    -0.20250477799807 * G_Neighborhood2  +     0.10649777521255 * 
        G_Neighborhood3  +      0.0984957788804 * G_Neighborhood4
          +     0.14846359751331 * G_Neighborhood5  +    -0.11911118413469 * 
        G_Neighborhood6  +     0.04348962126132 * G_Neighborhood7
          +    -0.03432416679535 * G_Neighborhood8  +    -0.07654004441632 * 
        G_Neighborhood9  +    -0.05092118652771 * G_Neighborhood10
          +    -0.20379417687475 * G_Neighborhood11  +    -0.12179266954825 * 
        G_Neighborhood12  +     0.19452190158452 * G_Pool_QC0
          +     0.04566482645656 * G_Pool_QC1  +    -0.04332127414079 * 
        G_Roof_Matl0  +    -0.05597294565098 * G_Roof_Matl1
          +    -0.03991486327014 * G_Sale_Condition0
          +      0.3545764086923 * G_Sale_Condition1
          +    -0.15595530979257 * G_Sale_Condition2
          +    -0.10753271007017 * G_Sale_Condition3
          +     0.14788624101881 * Land_ContourBnk  +    -0.20723984734813 * 
        Land_ContourHLS  +    -0.07778330791441 * Land_ContourLow ;
   H113  = H113  +     0.08782747626111 * Exter_QualEx
          +     0.04531217145162 * Exter_QualFa  +    -0.11474533355379 * 
        Exter_QualGd  +     -0.0309593471728 * G_Bldg_Type0
          +     0.23927110259306 * G_Bldg_Type1  +    -0.10641492948304 * 
        G_Bldg_Type2  +    -0.00177601577673 * G_Bsmt_Exposure0
          +    -0.06838398133439 * G_Bsmt_Exposure1  +     0.07131158083574 * 
        G_Bsmt_Exposure2  +     0.16759943229681 * G_Bsmt_Exposure3
          +    -0.19741865384765 * G_Bsmt_Qual0  +      0.0422372022373 * 
        G_Bsmt_Qual1  +    -0.28460552554627 * G_Bsmt_Qual2
          +    -0.01941062474695 * G_Condition_10  +     0.00856142281656 * 
        G_Condition_11  +     0.14613694624163 * G_Condition_12
          +     0.16297840615348 * G_Condition_13  +     -0.0519468616211 * 
        G_Condition_20  +     0.08160177660802 * G_Condition_21
          +    -0.18068552569691 * G_Condition_22  +    -0.03187123239397 * 
        G_Exterior_1st0  +     0.27087770724214 * G_Exterior_1st1
          +     0.04353558672083 * G_Exterior_1st2  +    -0.07959325562527 * 
        G_Exterior_1st3  +    -0.01741990359244 * G_Exterior_1st4
          +     0.16184600947735 * G_Exterior_1st5  +    -0.05614827996705 * 
        G_Exterior_1st6  +    -0.15286152863933 * G_Exterior_1st7
          +    -0.09178039022798 * G_Functional0  +     -0.0641077678001 * 
        G_Functional1  +     -0.0052925840836 * G_Functional2
          +     0.19607303645259 * G_Garage_Qual0  +    -0.01663866338583 * 
        G_Garage_Qual1  +    -0.17131676591854 * G_Garage_Qual2
          +    -0.04005172008586 * G_House_Style0  +     0.00494796794419 * 
        G_House_Style1  +     0.00710578052936 * G_House_Style2
          +     0.11599730482926 * G_House_Style3  +     0.00633594903924 * 
        G_House_Style4  +     0.00762428390619 * G_Kitchen_Qual0
          +     0.01245440761646 * G_Kitchen_Qual1  +     0.04662095541445 * 
        G_Kitchen_Qual2  +     -0.0260389110219 * G_MS_SubClass0
          +     0.07106909158583 * G_MS_SubClass1  +    -0.07549318125036 * 
        G_MS_SubClass2  +    -0.06391295368401 * G_MS_SubClass3
          +     0.16187137258994 * G_MS_SubClass4  +     0.01654071689288 * 
        G_MS_SubClass5  +     0.02282418421699 * G_MS_SubClass6
          +     0.03483065386311 * G_MS_SubClass7  +    -0.13750385162509 * 
        G_Neighborhood0  +    -0.06628404601788 * G_Neighborhood1
          +    -0.17914666158891 * G_Neighborhood2  +    -0.11280834207934 * 
        G_Neighborhood3  +     0.09636603030988 * G_Neighborhood4
          +    -0.29645094844768 * G_Neighborhood5  +    -0.10327558265004 * 
        G_Neighborhood6  +     0.10150285620983 * G_Neighborhood7
          +    -0.11499409275588 * G_Neighborhood8  +    -0.07591618480172 * 
        G_Neighborhood9  +    -0.00105142217597 * G_Neighborhood10
          +    -0.13068791311961 * G_Neighborhood11  +     0.03262583163381 * 
        G_Neighborhood12  +     0.01714269962283 * G_Pool_QC0
          +    -0.09314871075468 * G_Pool_QC1  +     0.07536185955364 * 
        G_Roof_Matl0  +    -0.04412862159074 * G_Roof_Matl1
          +     0.11087453373744 * G_Sale_Condition0
          +     0.03201522272858 * G_Sale_Condition1
          +     -0.0625571382396 * G_Sale_Condition2
          +     0.02781885858605 * G_Sale_Condition3
          +    -0.19215420054901 * Land_ContourBnk  +    -0.12913225105306 * 
        Land_ContourHLS  +    -0.14231071588061 * Land_ContourLow ;
   H114  = H114  +     0.03927564753489 * Exter_QualEx
          +     0.09391585546699 * Exter_QualFa  +     0.32169962272128 * 
        Exter_QualGd  +    -0.19090939025998 * G_Bldg_Type0
          +     0.00627328955462 * G_Bldg_Type1  +    -0.10840954812845 * 
        G_Bldg_Type2  +     0.05894154879415 * G_Bsmt_Exposure0
          +    -0.15889103428963 * G_Bsmt_Exposure1  +    -0.08823518166605 * 
        G_Bsmt_Exposure2  +    -0.10004878761796 * G_Bsmt_Exposure3
          +    -0.25158400586935 * G_Bsmt_Qual0  +    -0.11679474656731 * 
        G_Bsmt_Qual1  +    -0.00549323668553 * G_Bsmt_Qual2
          +     0.21440935534427 * G_Condition_10  +    -0.07739265622665 * 
        G_Condition_11  +     0.14142282616946 * G_Condition_12
          +     0.04635050358769 * G_Condition_13  +    -0.05358511130361 * 
        G_Condition_20  +    -0.28441680581786 * G_Condition_21
          +     0.22444347602802 * G_Condition_22  +       0.017375248895 * 
        G_Exterior_1st0  +    -0.09289368385032 * G_Exterior_1st1
          +    -0.27392714009879 * G_Exterior_1st2  +     0.11451578259538 * 
        G_Exterior_1st3  +    -0.20577539541958 * G_Exterior_1st4
          +    -0.18577868308055 * G_Exterior_1st5  +     0.18164442088485 * 
        G_Exterior_1st6  +    -0.00077188535374 * G_Exterior_1st7
          +    -0.09987315537089 * G_Functional0  +    -0.00437181098597 * 
        G_Functional1  +     0.07788043534821 * G_Functional2
          +    -0.12155461684962 * G_Garage_Qual0  +     -0.0687303184241 * 
        G_Garage_Qual1  +    -0.05539175308653 * G_Garage_Qual2
          +    -0.08194822191492 * G_House_Style0  +     0.13645057000603 * 
        G_House_Style1  +    -0.15528196850936 * G_House_Style2
          +     0.00940030488286 * G_House_Style3  +    -0.06928005183134 * 
        G_House_Style4  +     -0.1419252094463 * G_Kitchen_Qual0
          +    -0.26155783394996 * G_Kitchen_Qual1  +    -0.06335103974521 * 
        G_Kitchen_Qual2  +     0.05799102904382 * G_MS_SubClass0
          +     0.00489433983629 * G_MS_SubClass1  +     0.01515680679333 * 
        G_MS_SubClass2  +    -0.00106447013125 * G_MS_SubClass3
          +     0.06587897385539 * G_MS_SubClass4  +     0.11313730490982 * 
        G_MS_SubClass5  +    -0.03274651592861 * G_MS_SubClass6
          +    -0.01821719584035 * G_MS_SubClass7  +      0.0232283681186 * 
        G_Neighborhood0  +    -0.10553520123873 * G_Neighborhood1
          +     0.09443364105484 * G_Neighborhood2  +    -0.11906161359573 * 
        G_Neighborhood3  +     0.04048550837715 * G_Neighborhood4
          +    -0.04497134153529 * G_Neighborhood5  +     0.09433717374189 * 
        G_Neighborhood6  +    -0.01793625790548 * G_Neighborhood7
          +     0.00543087249926 * G_Neighborhood8  +    -0.15153038056353 * 
        G_Neighborhood9  +    -0.14801552871817 * G_Neighborhood10
          +     0.14674577035336 * G_Neighborhood11  +     0.02139950512222 * 
        G_Neighborhood12  +     -0.0325179135028 * G_Pool_QC0
          +     -0.1118216304408 * G_Pool_QC1  +     0.00020655803496 * 
        G_Roof_Matl0  +     0.05410952881096 * G_Roof_Matl1
          +    -0.03112583511883 * G_Sale_Condition0
          +    -0.00845944506824 * G_Sale_Condition1
          +     0.01186609961745 * G_Sale_Condition2
          +     0.16762114979246 * G_Sale_Condition3
          +    -0.13327657944459 * Land_ContourBnk  +     0.05033171321935 * 
        Land_ContourHLS  +    -0.02746069271615 * Land_ContourLow ;
   H115  = H115  +     0.09378326984413 * Exter_QualEx
          +     0.08181728186979 * Exter_QualFa  +    -0.04964771127755 * 
        Exter_QualGd  +    -0.03981940508432 * G_Bldg_Type0
          +     0.17967275287043 * G_Bldg_Type1  +    -0.12698932301591 * 
        G_Bldg_Type2  +     0.25773131807236 * G_Bsmt_Exposure0
          +     0.00242974043443 * G_Bsmt_Exposure1  +     0.05527089396484 * 
        G_Bsmt_Exposure2  +      0.0812182621746 * G_Bsmt_Exposure3
          +     0.09295268751923 * G_Bsmt_Qual0  +      0.0906286988035 * 
        G_Bsmt_Qual1  +     0.15264792791111 * G_Bsmt_Qual2
          +    -0.00860459477836 * G_Condition_10  +    -0.09928888954373 * 
        G_Condition_11  +    -0.22618702689202 * G_Condition_12
          +    -0.12846716826941 * G_Condition_13  +    -0.04766760966726 * 
        G_Condition_20  +    -0.05377322211191 * G_Condition_21
          +    -0.34120339980713 * G_Condition_22  +     0.15185127852538 * 
        G_Exterior_1st0  +     0.06893871234595 * G_Exterior_1st1
          +     0.09696104105665 * G_Exterior_1st2  +     -0.1091482144308 * 
        G_Exterior_1st3  +     0.00517069045593 * G_Exterior_1st4
          +      0.0543220176967 * G_Exterior_1st5  +     0.02407732275367 * 
        G_Exterior_1st6  +    -0.14044891395852 * G_Exterior_1st7
          +    -0.12809598300351 * G_Functional0  +    -0.04901392110959 * 
        G_Functional1  +     -0.1925062202431 * G_Functional2
          +    -0.17990202179565 * G_Garage_Qual0  +    -0.05435242160776 * 
        G_Garage_Qual1  +     0.04239495750057 * G_Garage_Qual2
          +     0.09166735900854 * G_House_Style0  +      0.1025979616718 * 
        G_House_Style1  +     0.00416479898698 * G_House_Style2
          +     0.12052002900218 * G_House_Style3  +    -0.11412196128579 * 
        G_House_Style4  +     0.07245158893888 * G_Kitchen_Qual0
          +     0.07692262071032 * G_Kitchen_Qual1  +     0.00419737472301 * 
        G_Kitchen_Qual2  +     0.00877602246538 * G_MS_SubClass0
          +     0.11818370358703 * G_MS_SubClass1  +     0.13317651148226 * 
        G_MS_SubClass2  +     0.28097607377646 * G_MS_SubClass3
          +     0.14202390608692 * G_MS_SubClass4  +     0.10940880257007 * 
        G_MS_SubClass5  +     0.05548540919703 * G_MS_SubClass6
          +    -0.04841462497057 * G_MS_SubClass7  +    -0.05262246289004 * 
        G_Neighborhood0  +     0.32796283174954 * G_Neighborhood1
          +      0.1147478496274 * G_Neighborhood2  +     0.21733520695592 * 
        G_Neighborhood3  +     0.11251127797709 * G_Neighborhood4
          +     0.05104464972295 * G_Neighborhood5  +      0.1411972789222 * 
        G_Neighborhood6  +    -0.01500449395849 * G_Neighborhood7
          +      0.1592422253573 * G_Neighborhood8  +     0.22380488046471 * 
        G_Neighborhood9  +    -0.05692214715773 * G_Neighborhood10
          +     0.18064941901538 * G_Neighborhood11  +     0.08348586730591 * 
        G_Neighborhood12  +    -0.04909025433332 * G_Pool_QC0
          +     0.02560962804332 * G_Pool_QC1  +     0.04453578414642 * 
        G_Roof_Matl0  +    -0.03115539310334 * G_Roof_Matl1
          +    -0.14603864867127 * G_Sale_Condition0
          +    -0.31117017404057 * G_Sale_Condition1
          +     0.00153873978843 * G_Sale_Condition2
          +     -0.1440137407439 * G_Sale_Condition3
          +    -0.03558032473179 * Land_ContourBnk  +     0.07386842459884 * 
        Land_ContourHLS  +     0.13326211713191 * Land_ContourLow ;
   H116  = H116  +     0.21762616728382 * Exter_QualEx
          +    -0.20444449973882 * Exter_QualFa  +      0.0801617063794 * 
        Exter_QualGd  +    -0.03627136613563 * G_Bldg_Type0
          +     0.01197355762034 * G_Bldg_Type1  +     0.01699045556544 * 
        G_Bldg_Type2  +     0.01356850870706 * G_Bsmt_Exposure0
          +     -0.2121702008869 * G_Bsmt_Exposure1  +    -0.09314142799957 * 
        G_Bsmt_Exposure2  +    -0.01148648691676 * G_Bsmt_Exposure3
          +     0.03848155826492 * G_Bsmt_Qual0  +    -0.11129880359297 * 
        G_Bsmt_Qual1  +     0.00512478406553 * G_Bsmt_Qual2
          +     -0.2517722764869 * G_Condition_10  +     -0.0897992074787 * 
        G_Condition_11  +    -0.01887244931986 * G_Condition_12
          +    -0.06453939954334 * G_Condition_13  +     0.09371749828821 * 
        G_Condition_20  +    -0.15699319075243 * G_Condition_21
          +     -0.2070378429621 * G_Condition_22  +     -0.2800526954841 * 
        G_Exterior_1st0  +    -0.44065078326347 * G_Exterior_1st1
          +    -0.19438974888265 * G_Exterior_1st2  +    -0.41318059193235 * 
        G_Exterior_1st3  +    -0.11350084555336 * G_Exterior_1st4
          +     0.49983941477722 * G_Exterior_1st5  +    -0.06114926773081 * 
        G_Exterior_1st6  +     0.04431280503206 * G_Exterior_1st7
          +     0.03462554284783 * G_Functional0  +    -0.06456542162854 * 
        G_Functional1  +     -0.1519588031567 * G_Functional2
          +     0.17854050685359 * G_Garage_Qual0  +     0.08891945653177 * 
        G_Garage_Qual1  +    -0.06980312927952 * G_Garage_Qual2
          +     0.08706548832772 * G_House_Style0  +    -0.15233350590455 * 
        G_House_Style1  +     0.18674039887457 * G_House_Style2
          +    -0.09483472683788 * G_House_Style3  +     0.28987660971913 * 
        G_House_Style4  +     0.17761325703121 * G_Kitchen_Qual0
          +    -0.09553853301956 * G_Kitchen_Qual1  +     0.00221411629769 * 
        G_Kitchen_Qual2  +    -0.11301951267755 * G_MS_SubClass0
          +     0.16868407350002 * G_MS_SubClass1  +    -0.01980878990351 * 
        G_MS_SubClass2  +     -0.2198236676687 * G_MS_SubClass3
          +     0.03256363569189 * G_MS_SubClass4  +     -0.0342058507501 * 
        G_MS_SubClass5  +     0.09727495407762 * G_MS_SubClass6
          +    -0.05736388917854 * G_MS_SubClass7  +    -0.08448965663739 * 
        G_Neighborhood0  +    -0.02020838213008 * G_Neighborhood1
          +     0.32081116227232 * G_Neighborhood2  +    -0.09766631417782 * 
        G_Neighborhood3  +    -0.34734241670076 * G_Neighborhood4
          +     0.21300341002621 * G_Neighborhood5  +     -0.0123933618438 * 
        G_Neighborhood6  +    -0.11526776496189 * G_Neighborhood7
          +    -0.06159976668187 * G_Neighborhood8  +     0.07302745710057 * 
        G_Neighborhood9  +     0.12004443739113 * G_Neighborhood10
          +     0.01973167403152 * G_Neighborhood11  +     0.33471959392437 * 
        G_Neighborhood12  +    -0.37757732276141 * G_Pool_QC0
          +     0.01226105800393 * G_Pool_QC1  +    -0.43402595496573 * 
        G_Roof_Matl0  +     -0.2270065369106 * G_Roof_Matl1
          +     0.09828075140138 * G_Sale_Condition0
          +    -0.12054492652735 * G_Sale_Condition1
          +    -0.07126051596425 * G_Sale_Condition2
          +     0.03961340314935 * G_Sale_Condition3
          +     0.13572520058649 * Land_ContourBnk  +     0.16403373862453 * 
        Land_ContourHLS  +     0.03526795977866 * Land_ContourLow ;
   H117  = H117  +     0.15544474830697 * Exter_QualEx
          +     0.08893366746528 * Exter_QualFa  +    -0.09322848358115 * 
        Exter_QualGd  +     0.02959497263635 * G_Bldg_Type0
          +    -0.06506843898964 * G_Bldg_Type1  +    -0.04873487213999 * 
        G_Bldg_Type2  +    -0.13494095807734 * G_Bsmt_Exposure0
          +    -0.16652941684223 * G_Bsmt_Exposure1  +     0.14883749259622 * 
        G_Bsmt_Exposure2  +      0.0106156670661 * G_Bsmt_Exposure3
          +    -0.04710737684456 * G_Bsmt_Qual0  +    -0.01480995562162 * 
        G_Bsmt_Qual1  +    -0.13998897684528 * G_Bsmt_Qual2
          +    -0.14354330252146 * G_Condition_10  +     0.24568017956213 * 
        G_Condition_11  +    -0.25255983022469 * G_Condition_12
          +      0.1487190686563 * G_Condition_13  +     -0.0595324080655 * 
        G_Condition_20  +    -0.45695650307623 * G_Condition_21
          +     -0.1965827722095 * G_Condition_22  +    -0.09205476645806 * 
        G_Exterior_1st0  +    -0.05718130543899 * G_Exterior_1st1
          +     -0.2369428781103 * G_Exterior_1st2  +    -0.11569978334215 * 
        G_Exterior_1st3  +     0.00691726979468 * G_Exterior_1st4
          +     0.06075462806612 * G_Exterior_1st5  +    -0.05850511523965 * 
        G_Exterior_1st6  +      0.1097935201077 * G_Exterior_1st7
          +     0.16583889734769 * G_Functional0  +     0.01872225506224 * 
        G_Functional1  +     0.15741797554603 * G_Functional2
          +    -0.11719975254631 * G_Garage_Qual0  +    -0.02701651302705 * 
        G_Garage_Qual1  +     -0.1719636449058 * G_Garage_Qual2
          +     0.14010091068219 * G_House_Style0  +    -0.12849957446141 * 
        G_House_Style1  +     0.09436139131203 * G_House_Style2
          +     0.10119598211266 * G_House_Style3  +      0.0266010589618 * 
        G_House_Style4  +    -0.10496662202489 * G_Kitchen_Qual0
          +    -0.19442411525922 * G_Kitchen_Qual1  +    -0.25684972149648 * 
        G_Kitchen_Qual2  +    -0.06920026120072 * G_MS_SubClass0
          +     0.09911202702426 * G_MS_SubClass1  +     0.24690873232867 * 
        G_MS_SubClass2  +     0.00220990698082 * G_MS_SubClass3
          +     0.12234790526714 * G_MS_SubClass4  +      0.0967096102307 * 
        G_MS_SubClass5  +     0.24413582886117 * G_MS_SubClass6
          +     0.26680499957635 * G_MS_SubClass7  +     0.01667296207803 * 
        G_Neighborhood0  +    -0.09463191056885 * G_Neighborhood1
          +    -0.18294427513591 * G_Neighborhood2  +    -0.04744421507596 * 
        G_Neighborhood3  +     0.07724538368092 * G_Neighborhood4
          +    -0.07824635219311 * G_Neighborhood5  +     0.09175159831456 * 
        G_Neighborhood6  +    -0.10997991849795 * G_Neighborhood7
          +    -0.03046004364303 * G_Neighborhood8  +    -0.12753583083083 * 
        G_Neighborhood9  +    -0.28846748643006 * G_Neighborhood10
          +    -0.27397281627887 * G_Neighborhood11  +     0.11198101044239 * 
        G_Neighborhood12  +    -0.37761876410698 * G_Pool_QC0
          +     0.08910189508463 * G_Pool_QC1  +    -0.17141822683982 * 
        G_Roof_Matl0  +     0.00961058070381 * G_Roof_Matl1
          +     0.05479703308699 * G_Sale_Condition0
          +    -0.14931931470551 * G_Sale_Condition1
          +    -0.15233658839515 * G_Sale_Condition2
          +    -0.24993085961101 * G_Sale_Condition3
          +     -0.1211026505168 * Land_ContourBnk  +     -0.0045576296683 * 
        Land_ContourHLS  +    -0.04661714953909 * Land_ContourLow ;
   H118  = H118  +    -0.26070895346908 * Exter_QualEx
          +    -0.06814551030789 * Exter_QualFa  +    -0.13986196513951 * 
        Exter_QualGd  +     0.10695119313864 * G_Bldg_Type0
          +    -0.09201091764704 * G_Bldg_Type1  +    -0.15321831301272 * 
        G_Bldg_Type2  +    -0.01814402445343 * G_Bsmt_Exposure0
          +    -0.14413090528645 * G_Bsmt_Exposure1  +    -0.12075289897066 * 
        G_Bsmt_Exposure2  +    -0.01719150070583 * G_Bsmt_Exposure3
          +    -0.24113927467745 * G_Bsmt_Qual0  +    -0.07633623254359 * 
        G_Bsmt_Qual1  +    -0.33268275720454 * G_Bsmt_Qual2
          +    -0.09701686008575 * G_Condition_10  +     0.15883737744604 * 
        G_Condition_11  +    -0.07116520672088 * G_Condition_12
          +     0.18678587640717 * G_Condition_13  +     0.09420115232686 * 
        G_Condition_20  +     0.11779942319171 * G_Condition_21
          +     0.08997385071427 * G_Condition_22  +    -0.06021842483651 * 
        G_Exterior_1st0  +    -0.07813579755278 * G_Exterior_1st1
          +     -0.0613032273413 * G_Exterior_1st2  +     0.08274652097596 * 
        G_Exterior_1st3  +     0.11245569251618 * G_Exterior_1st4
          +    -0.16339779206506 * G_Exterior_1st5  +    -0.06764874932854 * 
        G_Exterior_1st6  +    -0.03902704726791 * G_Exterior_1st7
          +    -0.15464472642166 * G_Functional0  +    -0.09695772980443 * 
        G_Functional1  +     0.00817818176142 * G_Functional2
          +    -0.03870296894408 * G_Garage_Qual0  +     0.11430876826709 * 
        G_Garage_Qual1  +     0.00520067401728 * G_Garage_Qual2
          +    -0.12118094029486 * G_House_Style0  +     0.00952212903292 * 
        G_House_Style1  +    -0.05490499404966 * G_House_Style2
          +    -0.14452564670236 * G_House_Style3  +    -0.15745985259729 * 
        G_House_Style4  +     0.05511543129055 * G_Kitchen_Qual0
          +     0.06966073203187 * G_Kitchen_Qual1  +     0.08332035317078 * 
        G_Kitchen_Qual2  +    -0.06793526459656 * G_MS_SubClass0
          +     0.09181073059889 * G_MS_SubClass1  +    -0.05747819993044 * 
        G_MS_SubClass2  +    -0.11915237704131 * G_MS_SubClass3
          +     0.04902337464187 * G_MS_SubClass4  +    -0.17124769971708 * 
        G_MS_SubClass5  +    -0.15533914492584 * G_MS_SubClass6
          +    -0.02451928702757 * G_MS_SubClass7  +     0.12558392779953 * 
        G_Neighborhood0  +    -0.21442635725385 * G_Neighborhood1
          +    -0.18106541516496 * G_Neighborhood2  +     0.01107125575557 * 
        G_Neighborhood3  +     0.07656619091445 * G_Neighborhood4
          +    -0.13273151758996 * G_Neighborhood5  +    -0.08778843676259 * 
        G_Neighborhood6  +    -0.11882209734648 * G_Neighborhood7
          +    -0.10707547285239 * G_Neighborhood8  +    -0.08858658611655 * 
        G_Neighborhood9  +     0.07560266342557 * G_Neighborhood10
          +    -0.00697938652297 * G_Neighborhood11  +     0.03318405897741 * 
        G_Neighborhood12  +     0.08266408396116 * G_Pool_QC0
          +     0.07849816080452 * G_Pool_QC1  +    -0.05964802142471 * 
        G_Roof_Matl0  +    -0.07253330581433 * G_Roof_Matl1
          +     0.09629915869693 * G_Sale_Condition0
          +     0.09368576670628 * G_Sale_Condition1
          +     0.05307621003714 * G_Sale_Condition2
          +    -0.09593081997044 * G_Sale_Condition3
          +    -0.09153492907784 * Land_ContourBnk  +    -0.10651510877673 * 
        Land_ContourHLS  +    -0.17761640718536 * Land_ContourLow ;
   H119  = H119  +    -0.14196444368816 * Exter_QualEx
          +     0.14725120400069 * Exter_QualFa  +     0.15609953720125 * 
        Exter_QualGd  +    -0.06702721324375 * G_Bldg_Type0
          +    -0.08527976939339 * G_Bldg_Type1  +    -0.03124976396215 * 
        G_Bldg_Type2  +     0.04851513414798 * G_Bsmt_Exposure0
          +    -0.15059864031692 * G_Bsmt_Exposure1  +    -0.00456818021437 * 
        G_Bsmt_Exposure2  +    -0.04733132296943 * G_Bsmt_Exposure3
          +      0.0365047374913 * G_Bsmt_Qual0  +    -0.04855728811228 * 
        G_Bsmt_Qual1  +     0.22134632679237 * G_Bsmt_Qual2
          +     0.04146363475685 * G_Condition_10  +     0.08874773010967 * 
        G_Condition_11  +     0.01992170693236 * G_Condition_12
          +    -0.08601465421632 * G_Condition_13  +     0.09702319254183 * 
        G_Condition_20  +      0.1831220443666 * G_Condition_21
          +     0.07878718153238 * G_Condition_22  +    -0.15968139801352 * 
        G_Exterior_1st0  +     0.09992913621401 * G_Exterior_1st1
          +    -0.09739391492905 * G_Exterior_1st2  +     0.12489444494836 * 
        G_Exterior_1st3  +     0.09191784317784 * G_Exterior_1st4
          +    -0.28507182675199 * G_Exterior_1st5  +     0.14455507948267 * 
        G_Exterior_1st6  +     0.01212269859555 * G_Exterior_1st7
          +     0.01175752687759 * G_Functional0  +     0.04850893233972 * 
        G_Functional1  +     -0.0293164461333 * G_Functional2
          +     0.23059791209807 * G_Garage_Qual0  +      0.1701746468825 * 
        G_Garage_Qual1  +    -0.15043450713071 * G_Garage_Qual2
          +     0.02410160127397 * G_House_Style0  +     0.24426274075738 * 
        G_House_Style1  +     0.09100308767749 * G_House_Style2
          +     0.02732571576956 * G_House_Style3  +    -0.11794922152072 * 
        G_House_Style4  +     0.01273399123615 * G_Kitchen_Qual0
          +    -0.01465975110143 * G_Kitchen_Qual1  +     0.10336760613948 * 
        G_Kitchen_Qual2  +     0.12183540763042 * G_MS_SubClass0
          +      0.0167877291563 * G_MS_SubClass1  +    -0.08882636277698 * 
        G_MS_SubClass2  +     0.02034394239459 * G_MS_SubClass3
          +     0.10393129506924 * G_MS_SubClass4  +    -0.29414848845967 * 
        G_MS_SubClass5  +     0.24433678870927 * G_MS_SubClass6
          +    -0.02130359706083 * G_MS_SubClass7  +     0.05694254292067 * 
        G_Neighborhood0  +    -0.00180433233356 * G_Neighborhood1
          +     0.02294547682698 * G_Neighborhood2  +    -0.17496999909775 * 
        G_Neighborhood3  +     0.01047192032481 * G_Neighborhood4
          +    -0.02176409904363 * G_Neighborhood5  +    -0.10499624724221 * 
        G_Neighborhood6  +    -0.15852586750818 * G_Neighborhood7
          +    -0.05793261178432 * G_Neighborhood8  +     0.05813505504532 * 
        G_Neighborhood9  +    -0.00412285273482 * G_Neighborhood10
          +      0.0617109879294 * G_Neighborhood11  +     0.06634330585362 * 
        G_Neighborhood12  +    -0.03787540395295 * G_Pool_QC0
          +     0.12067689551128 * G_Pool_QC1  +    -0.17752469935693 * 
        G_Roof_Matl0  +     0.09256355066404 * G_Roof_Matl1
          +     0.09572096454869 * G_Sale_Condition0
          +     0.10173782058458 * G_Sale_Condition1
          +     0.10935546644047 * G_Sale_Condition2
          +     0.08821927526007 * G_Sale_Condition3
          +     0.06579761703753 * Land_ContourBnk  +     0.02753894698537 * 
        Land_ContourHLS  +      0.0758893918811 * Land_ContourLow ;
   H120  = H120  +    -0.01563138312055 * Exter_QualEx
          +     -0.0973591234634 * Exter_QualFa  +    -0.02368150647042 * 
        Exter_QualGd  +    -0.00925615822961 * G_Bldg_Type0
          +    -0.03932986586423 * G_Bldg_Type1  +     0.08163079360492 * 
        G_Bldg_Type2  +     0.13869386885579 * G_Bsmt_Exposure0
          +     0.10968789752707 * G_Bsmt_Exposure1  +     -0.0996127160493 * 
        G_Bsmt_Exposure2  +     0.18037883982244 * G_Bsmt_Exposure3
          +    -0.06540101078024 * G_Bsmt_Qual0  +     0.16963060315471 * 
        G_Bsmt_Qual1  +     0.12015371435028 * G_Bsmt_Qual2
          +      0.3140308499223 * G_Condition_10  +     0.13241022882596 * 
        G_Condition_11  +    -0.20855685204279 * G_Condition_12
          +    -0.05641214282124 * G_Condition_13  +     0.01652934257501 * 
        G_Condition_20  +    -0.03045447061278 * G_Condition_21
          +     0.02675466121948 * G_Condition_22  +     0.15046932692214 * 
        G_Exterior_1st0  +     0.18987181081347 * G_Exterior_1st1
          +     0.07749578175711 * G_Exterior_1st2  +    -0.21397255243476 * 
        G_Exterior_1st3  +    -0.20621039802522 * G_Exterior_1st4
          +     0.03255276307627 * G_Exterior_1st5  +       -0.01153707081 * 
        G_Exterior_1st6  +     0.11452675950707 * G_Exterior_1st7
          +    -0.02335637251912 * G_Functional0  +     0.13332468774732 * 
        G_Functional1  +      0.1383098451981 * G_Functional2
          +    -0.11661868078335 * G_Garage_Qual0  +     0.01732545652951 * 
        G_Garage_Qual1  +     0.07708536252231 * G_Garage_Qual2
          +     0.00148828065842 * G_House_Style0  +     0.03724977985363 * 
        G_House_Style1  +     0.19139917097174 * G_House_Style2
          +     0.07647408230025 * G_House_Style3  +    -0.06521022673394 * 
        G_House_Style4  +    -0.04707065139157 * G_Kitchen_Qual0
          +     0.20884611691189 * G_Kitchen_Qual1  +      0.0013752895604 * 
        G_Kitchen_Qual2  +     0.01437073478994 * G_MS_SubClass0
          +    -0.01137739391145 * G_MS_SubClass1  +    -0.09574759938524 * 
        G_MS_SubClass2  +     0.04149576427477 * G_MS_SubClass3
          +    -0.11276597563179 * G_MS_SubClass4  +    -0.03294039643163 * 
        G_MS_SubClass5  +    -0.02842368598052 * G_MS_SubClass6
          +     0.06967787570649 * G_MS_SubClass7  +      -0.154646277217 * 
        G_Neighborhood0  +    -0.06605621231632 * G_Neighborhood1
          +    -0.08270757631518 * G_Neighborhood2  +     0.11836463771498 * 
        G_Neighborhood3  +    -0.00175125561934 * G_Neighborhood4
          +     0.17778083496383 * G_Neighborhood5  +     0.14864453701904 * 
        G_Neighborhood6  +     0.02377187429512 * G_Neighborhood7
          +     0.18367885913066 * G_Neighborhood8  +     0.07078577631738 * 
        G_Neighborhood9  +     0.00806116289162 * G_Neighborhood10
          +     0.10747773122038 * G_Neighborhood11  +    -0.05465898326644 * 
        G_Neighborhood12  +    -0.17927454707751 * G_Pool_QC0
          +     0.14024343906828 * G_Pool_QC1  +     0.04901256771135 * 
        G_Roof_Matl0  +    -0.03619671759577 * G_Roof_Matl1
          +    -0.24236834416082 * G_Sale_Condition0
          +    -0.09456964230784 * G_Sale_Condition1
          +     0.06965970076684 * G_Sale_Condition2
          +     0.05226834512144 * G_Sale_Condition3
          +    -0.02287027712179 * Land_ContourBnk  +    -0.15508332833829 * 
        Land_ContourHLS  +     0.23846264458468 * Land_ContourLow ;
   H101  =     0.27685908849303 + H101 ;
   H102  =     0.87912876231891 + H102 ;
   H103  =    -0.65781657516733 + H103 ;
   H104  =     0.44224925365181 + H104 ;
   H105  =    -1.54467755247555 + H105 ;
   H106  =    -1.91293758165353 + H106 ;
   H107  =     0.17727299945529 + H107 ;
   H108  =    -1.42729921797344 + H108 ;
   H109  =     1.38286119288876 + H109 ;
   H110  =    -0.22723541431377 + H110 ;
   H111  =     0.86167707511321 + H111 ;
   H112  =     0.28339835408614 + H112 ;
   H113  =    -0.26692802533099 + H113 ;
   H114  =    -0.49194120513463 + H114 ;
   H115  =     1.95105020362467 + H115 ;
   H116  =    -0.05518540516822 + H116 ;
   H117  =    -1.38828560970066 + H117 ;
   H118  =    -1.28693515117162 + H118 ;
   H119  =    -0.88695547403773 + H119 ;
   H120  =     0.01822449412583 + H120 ;
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
   H111  = TANH(H111 );
   H112  = TANH(H112 );
   H113  = TANH(H113 );
   H114  = TANH(H114 );
   H115  = TANH(H115 );
   H116  = TANH(H116 );
   H117  = TANH(H117 );
   H118  = TANH(H118 );
   H119  = TANH(H119 );
   H120  = TANH(H120 );
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
   H111  = .;
   H112  = .;
   H113  = .;
   H114  = .;
   H115  = .;
   H116  = .;
   H117  = .;
   H118  = .;
   H119  = .;
   H120  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =     3706.38831788501 * H101  +    -20629.7862492912 * H102
          +     -33415.608599232 * H103  +     10882.3205689612 * H104
          +    -35994.0272749309 * H105  +      22503.289044439 * H106
          +     -14154.361791006 * H107  +     3822.89895756902 * H108
          +    -5663.43870676551 * H109  +      35220.127551943 * H110
          +     16648.6787188893 * H111  +    -50967.3101663584 * H112
          +     15062.5543553601 * H113  +    -32207.1777530517 * H114
          +    -7592.05288947684 * H115  +     42208.1547575325 * H116
          +     32498.4863694473 * H117  +     3128.56147661705 * H118
          +    -10821.8953634231 * H119  +    -5131.44236513482 * H120 ;
   P_SalePrice  =     179787.517818149 + P_SalePrice ;
END;
ELSE DO;
   P_SalePrice  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_SalePrice  =     180180.371498771;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
