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

      label H121 = 'Hidden: H1=21' ;

      label H122 = 'Hidden: H1=22' ;

      label H123 = 'Hidden: H1=23' ;

      label H124 = 'Hidden: H1=24' ;

      label H125 = 'Hidden: H1=25' ;

      label H126 = 'Hidden: H1=26' ;

      label H127 = 'Hidden: H1=27' ;

      label H128 = 'Hidden: H1=28' ;

      label H129 = 'Hidden: H1=29' ;

      label H130 = 'Hidden: H1=30' ;

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
   H101  =     0.31718760596343 * S_BsmtFin_SF_1  +    -0.07822000112697 * 
        S_Bsmt_Full_Bath  +    -0.07526199207805 * S_Fireplaces
          +    -0.13852987370519 * S_Garage_Cars  +     0.15884851845524 * 
        S_Gr_Liv_Area  +     0.04292136192663 * S_Lot_Area
          +      0.0365376963266 * S_Mas_Vnr_Area  +    -0.14259398730793 * 
        S_Overall_Cond  +    -0.08309883768651 * S_Overall_Qual
          +      0.1193156020193 * S_Screen_Porch  +    -0.15912860289053 * 
        S_Year_Built ;
   H102  =    -0.21854127799451 * S_BsmtFin_SF_1  +    -0.05746241634578 * 
        S_Bsmt_Full_Bath  +    -0.03135860324514 * S_Fireplaces
          +     0.21444596067246 * S_Garage_Cars  +    -0.08940765239204 * 
        S_Gr_Liv_Area  +     0.14365917192056 * S_Lot_Area
          +     0.03283829319923 * S_Mas_Vnr_Area  +     0.06870076638478 * 
        S_Overall_Cond  +     0.48734769851921 * S_Overall_Qual
          +     0.02281520091338 * S_Screen_Porch  +     0.16955441334113 * 
        S_Year_Built ;
   H103  =     0.03581597743938 * S_BsmtFin_SF_1  +      0.1126877023597 * 
        S_Bsmt_Full_Bath  +     0.00624262742219 * S_Fireplaces
          +    -0.00924180983344 * S_Garage_Cars  +    -0.01995113638854 * 
        S_Gr_Liv_Area  +     0.00880355550082 * S_Lot_Area
          +     0.10220089414817 * S_Mas_Vnr_Area  +     0.00751285679209 * 
        S_Overall_Cond  +    -0.15198664791468 * S_Overall_Qual
          +     0.12946634883334 * S_Screen_Porch  +    -0.04424588802181 * 
        S_Year_Built ;
   H104  =       0.257194587514 * S_BsmtFin_SF_1  +    -0.13829838133489 * 
        S_Bsmt_Full_Bath  +     -0.2635723073383 * S_Fireplaces
          +       0.083471022581 * S_Garage_Cars  +     0.80199777465219 * 
        S_Gr_Liv_Area  +     0.21460002850249 * S_Lot_Area
          +     0.12559929003521 * S_Mas_Vnr_Area  +     0.01631460659002 * 
        S_Overall_Cond  +     0.35831871900656 * S_Overall_Qual
          +     0.11884292619216 * S_Screen_Porch  +     0.18573296390072 * 
        S_Year_Built ;
   H105  =     0.14256392970163 * S_BsmtFin_SF_1  +     0.10471275665521 * 
        S_Bsmt_Full_Bath  +    -0.03297501672523 * S_Fireplaces
          +    -0.15653612044794 * S_Garage_Cars  +    -0.20017372572557 * 
        S_Gr_Liv_Area  +     0.18216771292527 * S_Lot_Area
          +    -0.07637119820709 * S_Mas_Vnr_Area  +    -0.09194463739599 * 
        S_Overall_Cond  +    -0.04990833314404 * S_Overall_Qual
          +    -0.22874131957143 * S_Screen_Porch  +    -0.31211665187963 * 
        S_Year_Built ;
   H106  =     0.18339211714638 * S_BsmtFin_SF_1  +     0.02450922508695 * 
        S_Bsmt_Full_Bath  +     0.10184086774549 * S_Fireplaces
          +    -0.09486679523284 * S_Garage_Cars  +      0.0681241681631 * 
        S_Gr_Liv_Area  +      0.1732565407327 * S_Lot_Area
          +     0.07693783037148 * S_Mas_Vnr_Area  +    -0.13915077485498 * 
        S_Overall_Cond  +    -0.24509775301793 * S_Overall_Qual
          +    -0.01556915872956 * S_Screen_Porch  +    -0.33273990007373 * 
        S_Year_Built ;
   H107  =    -0.12613146617457 * S_BsmtFin_SF_1  +    -0.28630972193944 * 
        S_Bsmt_Full_Bath  +     0.32388102639255 * S_Fireplaces
          +     0.22716658605969 * S_Garage_Cars  +    -0.21228668045705 * 
        S_Gr_Liv_Area  +     0.06181232285837 * S_Lot_Area
          +     0.09106897273614 * S_Mas_Vnr_Area  +     0.19964302685935 * 
        S_Overall_Cond  +     0.21239579644403 * S_Overall_Qual
          +     0.09980392456369 * S_Screen_Porch  +     0.19695218143131 * 
        S_Year_Built ;
   H108  =     0.11754141117536 * S_BsmtFin_SF_1  +     -0.0736657953298 * 
        S_Bsmt_Full_Bath  +     0.16616594447711 * S_Fireplaces
          +    -0.02146205026666 * S_Garage_Cars  +     0.28805334356928 * 
        S_Gr_Liv_Area  +     0.16969702720986 * S_Lot_Area
          +    -0.03133961308455 * S_Mas_Vnr_Area  +      0.2056950383131 * 
        S_Overall_Cond  +    -0.09459895856357 * S_Overall_Qual
          +     0.19851939751349 * S_Screen_Porch  +    -0.01931890952779 * 
        S_Year_Built ;
   H109  =    -0.12589379646952 * S_BsmtFin_SF_1  +       0.187556709871 * 
        S_Bsmt_Full_Bath  +    -0.18985908455718 * S_Fireplaces
          +     0.18330845033983 * S_Garage_Cars  +    -0.54801282751088 * 
        S_Gr_Liv_Area  +    -0.40719120043788 * S_Lot_Area
          +     0.07182518125127 * S_Mas_Vnr_Area  +    -0.13652086664629 * 
        S_Overall_Cond  +    -0.24603974189638 * S_Overall_Qual
          +    -0.11959423623372 * S_Screen_Porch  +     0.03949867159282 * 
        S_Year_Built ;
   H110  =     0.12274383833442 * S_BsmtFin_SF_1  +    -0.01750306887323 * 
        S_Bsmt_Full_Bath  +    -0.15989329584358 * S_Fireplaces
          +     0.08613999321447 * S_Garage_Cars  +     -0.1098696520648 * 
        S_Gr_Liv_Area  +      0.3558079854446 * S_Lot_Area
          +    -0.03787081962489 * S_Mas_Vnr_Area  +     0.04257924217547 * 
        S_Overall_Cond  +     0.15450524221802 * S_Overall_Qual
          +    -0.19988820701098 * S_Screen_Porch  +    -0.07886773544996 * 
        S_Year_Built ;
   H111  =    -0.11223333177895 * S_BsmtFin_SF_1  +    -0.06446757141828 * 
        S_Bsmt_Full_Bath  +     0.11062007701384 * S_Fireplaces
          +     0.06871849159746 * S_Garage_Cars  +    -0.10621994458804 * 
        S_Gr_Liv_Area  +    -0.06237104438696 * S_Lot_Area
          +    -0.05221399985628 * S_Mas_Vnr_Area  +     0.05348758275652 * 
        S_Overall_Cond  +    -0.12642407020289 * S_Overall_Qual
          +    -0.01985952489388 * S_Screen_Porch  +      0.1572532458925 * 
        S_Year_Built ;
   H112  =     0.34577382696517 * S_BsmtFin_SF_1  +    -0.30224932121611 * 
        S_Bsmt_Full_Bath  +    -0.00292276059119 * S_Fireplaces
          +     0.17576655199498 * S_Garage_Cars  +     0.31014103373911 * 
        S_Gr_Liv_Area  +     0.43982745278637 * S_Lot_Area
          +     0.11582293579996 * S_Mas_Vnr_Area  +    -0.22216518762492 * 
        S_Overall_Cond  +     0.19260797628058 * S_Overall_Qual
          +    -0.62734402382758 * S_Screen_Porch  +    -0.28885416686327 * 
        S_Year_Built ;
   H113  =    -0.11799384743391 * S_BsmtFin_SF_1  +    -0.12340012574482 * 
        S_Bsmt_Full_Bath  +     -0.0255942665707 * S_Fireplaces
          +    -0.01863749607393 * S_Garage_Cars  +    -0.23481696449403 * 
        S_Gr_Liv_Area  +     0.33853147393741 * S_Lot_Area
          +    -0.04730906221436 * S_Mas_Vnr_Area  +     0.02801524595076 * 
        S_Overall_Cond  +    -0.31757256785669 * S_Overall_Qual
          +    -0.08120502242489 * S_Screen_Porch  +     0.02317384360444 * 
        S_Year_Built ;
   H114  =    -0.04052526735194 * S_BsmtFin_SF_1  +     0.11227359086884 * 
        S_Bsmt_Full_Bath  +     0.16311503577306 * S_Fireplaces
          +     0.19946065906852 * S_Garage_Cars  +     0.24751575730802 * 
        S_Gr_Liv_Area  +    -0.01208433313669 * S_Lot_Area
          +     0.06526394031503 * S_Mas_Vnr_Area  +    -0.14495627381047 * 
        S_Overall_Cond  +     0.06814923985741 * S_Overall_Qual
          +    -0.16415633860761 * S_Screen_Porch  +    -0.09076866583469 * 
        S_Year_Built ;
   H115  =     0.31163349383932 * S_BsmtFin_SF_1  +     0.11828022603577 * 
        S_Bsmt_Full_Bath  +    -0.00242290787007 * S_Fireplaces
          +     -0.1364055083308 * S_Garage_Cars  +     0.13201884874739 * 
        S_Gr_Liv_Area  +     0.03636690511715 * S_Lot_Area
          +     0.08718295372568 * S_Mas_Vnr_Area  +    -0.01646229694085 * 
        S_Overall_Cond  +    -0.09986024766096 * S_Overall_Qual
          +    -0.07811076970589 * S_Screen_Porch  +     0.04835159226197 * 
        S_Year_Built ;
   H116  =     0.24589534816923 * S_BsmtFin_SF_1  +     0.12191795460592 * 
        S_Bsmt_Full_Bath  +    -0.07757135194327 * S_Fireplaces
          +    -0.27618105405152 * S_Garage_Cars  +     0.27674304937262 * 
        S_Gr_Liv_Area  +     0.13944231348544 * S_Lot_Area
          +     0.13618324283524 * S_Mas_Vnr_Area  +     0.19711239522005 * 
        S_Overall_Cond  +     0.22215524333224 * S_Overall_Qual
          +    -0.04559935118338 * S_Screen_Porch  +      0.0335642778392 * 
        S_Year_Built ;
   H117  =      -0.172452009967 * S_BsmtFin_SF_1  +    -0.02030063397886 * 
        S_Bsmt_Full_Bath  +    -0.06271681755715 * S_Fireplaces
          +     0.13862387760033 * S_Garage_Cars  +    -0.10116455019541 * 
        S_Gr_Liv_Area  +     0.13292763513336 * S_Lot_Area
          +    -0.03752803843466 * S_Mas_Vnr_Area  +      0.0020939314595 * 
        S_Overall_Cond  +     0.12606519989183 * S_Overall_Qual
          +    -0.02889914246774 * S_Screen_Porch  +    -0.02919270301152 * 
        S_Year_Built ;
   H118  =     0.25515367989022 * S_BsmtFin_SF_1  +     0.14664104445134 * 
        S_Bsmt_Full_Bath  +     0.16104239744271 * S_Fireplaces
          +     0.04298830184309 * S_Garage_Cars  +     0.02256523847368 * 
        S_Gr_Liv_Area  +    -0.15626325561271 * S_Lot_Area
          +    -0.06743661458447 * S_Mas_Vnr_Area  +    -0.05950382555975 * 
        S_Overall_Cond  +    -0.10621402507061 * S_Overall_Qual
          +     0.13577344507075 * S_Screen_Porch  +     0.12040660040873 * 
        S_Year_Built ;
   H119  =    -0.08151800358299 * S_BsmtFin_SF_1  +     0.25507798909987 * 
        S_Bsmt_Full_Bath  +    -0.15371664148989 * S_Fireplaces
          +    -0.13077483696779 * S_Garage_Cars  +    -0.25537619579323 * 
        S_Gr_Liv_Area  +    -0.17021815601908 * S_Lot_Area
          +    -0.38180634021215 * S_Mas_Vnr_Area  +     0.01356642844725 * 
        S_Overall_Cond  +    -0.20796389761553 * S_Overall_Qual
          +     0.25085407522277 * S_Screen_Porch  +    -0.02629476275112 * 
        S_Year_Built ;
   H120  =     0.29802467111359 * S_BsmtFin_SF_1  +     0.06409477982186 * 
        S_Bsmt_Full_Bath  +    -0.17553132946517 * S_Fireplaces
          +     0.03083857988001 * S_Garage_Cars  +     0.35899497190971 * 
        S_Gr_Liv_Area  +     0.44473829527847 * S_Lot_Area
          +     0.09013056312944 * S_Mas_Vnr_Area  +     0.18981445690259 * 
        S_Overall_Cond  +    -0.08003400576935 * S_Overall_Qual
          +     0.17159889130933 * S_Screen_Porch  +      0.0989564908069 * 
        S_Year_Built ;
   H121  =    -0.15681092094929 * S_BsmtFin_SF_1  +     0.02552958088568 * 
        S_Bsmt_Full_Bath  +     0.04075938236978 * S_Fireplaces
          +    -0.16185956202668 * S_Garage_Cars  +    -0.19910320054007 * 
        S_Gr_Liv_Area  +    -0.12826529648923 * S_Lot_Area
          +    -0.04505022808397 * S_Mas_Vnr_Area  +    -0.22619068387724 * 
        S_Overall_Cond  +    -0.14945832299874 * S_Overall_Qual
          +      0.0453093254474 * S_Screen_Porch  +    -0.01208208860965 * 
        S_Year_Built ;
   H122  =     0.18928439945817 * S_BsmtFin_SF_1  +     0.02589956500318 * 
        S_Bsmt_Full_Bath  +      0.2034467730357 * S_Fireplaces
          +     0.02589540225787 * S_Garage_Cars  +     0.12834565599643 * 
        S_Gr_Liv_Area  +     0.09506778509457 * S_Lot_Area
          +    -0.14482782276796 * S_Mas_Vnr_Area  +     0.11100735890414 * 
        S_Overall_Cond  +    -0.39233284396735 * S_Overall_Qual
          +    -0.08836404414845 * S_Screen_Porch  +     0.05483741400668 * 
        S_Year_Built ;
   H123  =      0.0488796599827 * S_BsmtFin_SF_1  +     0.04672088918523 * 
        S_Bsmt_Full_Bath  +     0.09263384339075 * S_Fireplaces
          +     0.20860347669343 * S_Garage_Cars  +     0.40263192964018 * 
        S_Gr_Liv_Area  +     0.23255310519848 * S_Lot_Area
          +     0.02140204568204 * S_Mas_Vnr_Area  +      0.1509563420037 * 
        S_Overall_Cond  +     0.13767234443154 * S_Overall_Qual
          +     0.01110952248031 * S_Screen_Porch  +     0.25153152605173 * 
        S_Year_Built ;
   H124  =    -0.03975048734478 * S_BsmtFin_SF_1  +    -0.01137856380837 * 
        S_Bsmt_Full_Bath  +    -0.16152320595002 * S_Fireplaces
          +     0.13897500720803 * S_Garage_Cars  +      0.2062975343981 * 
        S_Gr_Liv_Area  +    -0.23638677369466 * S_Lot_Area
          +     0.17733639982142 * S_Mas_Vnr_Area  +     0.00437253645078 * 
        S_Overall_Cond  +    -0.15413400823532 * S_Overall_Qual
          +     0.00497129295722 * S_Screen_Porch  +    -0.03212931482154 * 
        S_Year_Built ;
   H125  =     0.32219978237619 * S_BsmtFin_SF_1  +     0.15708560443585 * 
        S_Bsmt_Full_Bath  +    -0.07058910180945 * S_Fireplaces
          +    -0.15820697818892 * S_Garage_Cars  +      0.3432636414365 * 
        S_Gr_Liv_Area  +      0.1955271301565 * S_Lot_Area
          +     0.11520039756479 * S_Mas_Vnr_Area  +    -0.06806086715024 * 
        S_Overall_Cond  +     0.01131639241862 * S_Overall_Qual
          +     0.02781467485139 * S_Screen_Porch  +     0.06579844763553 * 
        S_Year_Built ;
   H126  =      0.0726651743126 * S_BsmtFin_SF_1  +     0.02437898096424 * 
        S_Bsmt_Full_Bath  +     0.13248572020406 * S_Fireplaces
          +    -0.20038665263569 * S_Garage_Cars  +     0.62294998065812 * 
        S_Gr_Liv_Area  +      0.2151249161193 * S_Lot_Area
          +    -0.26892950791817 * S_Mas_Vnr_Area  +     0.15678351339678 * 
        S_Overall_Cond  +    -0.09230486128267 * S_Overall_Qual
          +    -0.07257938085382 * S_Screen_Porch  +     0.12694142851117 * 
        S_Year_Built ;
   H127  =     0.25128153680721 * S_BsmtFin_SF_1  +     0.19477664304472 * 
        S_Bsmt_Full_Bath  +    -0.00292277229428 * S_Fireplaces
          +     0.13946892151333 * S_Garage_Cars  +     0.23507541491722 * 
        S_Gr_Liv_Area  +     0.06045714211889 * S_Lot_Area
          +    -0.11534270747724 * S_Mas_Vnr_Area  +    -0.16519880293565 * 
        S_Overall_Cond  +     0.21888647456603 * S_Overall_Qual
          +    -0.02083016942997 * S_Screen_Porch  +      0.3365522463378 * 
        S_Year_Built ;
   H128  =      0.3329640731798 * S_BsmtFin_SF_1  +     -0.0531782275472 * 
        S_Bsmt_Full_Bath  +    -0.10311520092734 * S_Fireplaces
          +    -0.11429347844015 * S_Garage_Cars  +     0.21427985216132 * 
        S_Gr_Liv_Area  +     0.51458376927193 * S_Lot_Area
          +    -0.30764641767205 * S_Mas_Vnr_Area  +    -0.03649125806093 * 
        S_Overall_Cond  +    -0.03145671708118 * S_Overall_Qual
          +    -0.10861057554572 * S_Screen_Porch  +    -0.10529599183364 * 
        S_Year_Built ;
   H129  =    -0.15487856372913 * S_BsmtFin_SF_1  +    -0.04278028216038 * 
        S_Bsmt_Full_Bath  +      -0.020814698921 * S_Fireplaces
          +     0.03703540878123 * S_Garage_Cars  +    -0.12450947854698 * 
        S_Gr_Liv_Area  +     0.07816145833116 * S_Lot_Area
          +     0.03821697267967 * S_Mas_Vnr_Area  +    -0.19900357937513 * 
        S_Overall_Cond  +     0.11316548705576 * S_Overall_Qual
          +    -0.19614055069674 * S_Screen_Porch  +    -0.06071865715809 * 
        S_Year_Built ;
   H130  =     0.05372223661734 * S_BsmtFin_SF_1  +     -0.0615674309484 * 
        S_Bsmt_Full_Bath  +    -0.04740899686997 * S_Fireplaces
          +    -0.11454444274431 * S_Garage_Cars  +    -0.18843287023914 * 
        S_Gr_Liv_Area  +    -0.00490629175192 * S_Lot_Area
          +    -0.10647769647131 * S_Mas_Vnr_Area  +     0.36737878051866 * 
        S_Overall_Cond  +     0.11319640316742 * S_Overall_Qual
          +    -0.01514400585342 * S_Screen_Porch  +     0.19823912632832 * 
        S_Year_Built ;
   H101  = H101  +     0.10884245849509 * Exter_QualEx
          +     0.05566262875997 * Exter_QualFa  +    -0.12245391454954 * 
        Exter_QualGd  +    -0.00861147994951 * G_Bldg_Type0
          +     0.16703845715371 * G_Bldg_Type1  +     0.04805942360123 * 
        G_Bldg_Type2  +      0.0013701467132 * G_Bsmt_Exposure0
          +     0.17672421955479 * G_Bsmt_Exposure1  +     0.05010307410507 * 
        G_Bsmt_Exposure2  +    -0.07738090907327 * G_Bsmt_Exposure3
          +    -0.25777165446033 * G_Bsmt_Qual0  +     0.21896230275677 * 
        G_Bsmt_Qual1  +     0.00903322639498 * G_Bsmt_Qual2
          +    -0.10202520179261 * G_Condition_10  +    -0.23595747144188 * 
        G_Condition_11  +     0.04490456567941 * G_Condition_12
          +    -0.09107473274265 * G_Condition_13  +     0.00041204834965 * 
        G_Condition_20  +    -0.14923193561626 * G_Condition_21
          +     0.14765677071292 * G_Condition_22  +    -0.10970352602806 * 
        G_Exterior_1st0  +     -0.0472883432515 * G_Exterior_1st1
          +     0.27296300175686 * G_Exterior_1st2  +    -0.00789065197666 * 
        G_Exterior_1st3  +    -0.03837782141112 * G_Exterior_1st4
          +     0.01547349556306 * G_Exterior_1st5  +    -0.06171414066368 * 
        G_Exterior_1st6  +     0.18686314559936 * G_Exterior_1st7
          +    -0.00470844101974 * G_Functional0  +     0.08245988515349 * 
        G_Functional1  +     0.14108666749033 * G_Functional2
          +    -0.05436274686295 * G_Garage_Qual0  +    -0.06878141154214 * 
        G_Garage_Qual1  +    -0.05128983466552 * G_Garage_Qual2
          +     0.08506889867478 * G_House_Style0  +    -0.00623661362002 * 
        G_House_Style1  +     0.06114333545051 * G_House_Style2
          +     0.05689198490538 * G_House_Style3  +    -0.10719257409374 * 
        G_House_Style4  +     0.16346344065895 * G_Kitchen_Qual0
          +     0.01886064377614 * G_Kitchen_Qual1  +     0.06537081873729 * 
        G_Kitchen_Qual2  +    -0.00602340174094 * G_MS_SubClass0
          +    -0.22692410251554 * G_MS_SubClass1  +     0.02916439922237 * 
        G_MS_SubClass2  +    -0.15847113189573 * G_MS_SubClass3
          +     0.12490272936583 * G_MS_SubClass4  +     0.04950888712233 * 
        G_MS_SubClass5  +    -0.02841023079439 * G_MS_SubClass6
          +    -0.05204093198668 * G_MS_SubClass7  +     0.01603826821771 * 
        G_Neighborhood0  +    -0.02333719478228 * G_Neighborhood1
          +     0.09998173675593 * G_Neighborhood2  +     0.21666135871359 * 
        G_Neighborhood3  +    -0.01889450163668 * G_Neighborhood4
          +     0.07425378087647 * G_Neighborhood5  +    -0.08159308994977 * 
        G_Neighborhood6  +     0.08614433052859 * G_Neighborhood7
          +     0.03672991366755 * G_Neighborhood8  +       0.008187562255 * 
        G_Neighborhood9  +     0.03758712388551 * G_Neighborhood10
          +     0.01180402350215 * G_Neighborhood11  +     0.20108107360262 * 
        G_Neighborhood12  +    -0.11415450549977 * G_Pool_QC0
          +     0.04484527083911 * G_Pool_QC1  +    -0.05621787167746 * 
        G_Roof_Matl0  +     0.12554177413497 * G_Roof_Matl1
          +     0.05880117579476 * G_Sale_Condition0
          +    -0.00001852660263 * G_Sale_Condition1
          +    -0.06669910877344 * G_Sale_Condition2
          +      0.0954940807576 * G_Sale_Condition3
          +    -0.02422243511693 * Land_ContourBnk  +     0.28668287446167 * 
        Land_ContourHLS  +    -0.03129648593507 * Land_ContourLow ;
   H102  = H102  +     0.22253888783161 * Exter_QualEx
          +     0.14276836025021 * Exter_QualFa  +     0.00810410052051 * 
        Exter_QualGd  +     0.06738399153217 * G_Bldg_Type0
          +      0.0700663228675 * G_Bldg_Type1  +     0.00438107940482 * 
        G_Bldg_Type2  +    -0.04921864476566 * G_Bsmt_Exposure0
          +    -0.14253881626116 * G_Bsmt_Exposure1  +    -0.00020068076791 * 
        G_Bsmt_Exposure2  +     0.10444306886434 * G_Bsmt_Exposure3
          +    -0.06743293791644 * G_Bsmt_Qual0  +    -0.50385585710925 * 
        G_Bsmt_Qual1  +    -0.07918315337769 * G_Bsmt_Qual2
          +     0.10121270712526 * G_Condition_10  +     0.02683270542705 * 
        G_Condition_11  +     0.17090247752521 * G_Condition_12
          +     0.05474623001069 * G_Condition_13  +     0.02897702056451 * 
        G_Condition_20  +     0.04727603710895 * G_Condition_21
          +    -0.26142793638261 * G_Condition_22  +    -0.13772445059729 * 
        G_Exterior_1st0  +    -0.15413366152007 * G_Exterior_1st1
          +    -0.03659632869973 * G_Exterior_1st2  +    -0.16834171611419 * 
        G_Exterior_1st3  +     -0.0603756257213 * G_Exterior_1st4
          +      0.1640622612016 * G_Exterior_1st5  +     0.05860647142313 * 
        G_Exterior_1st6  +     0.15774182971967 * G_Exterior_1st7
          +     0.01482626981124 * G_Functional0  +     0.10616375357784 * 
        G_Functional1  +    -0.10918457802091 * G_Functional2
          +     0.04517536567665 * G_Garage_Qual0  +      0.0491410028857 * 
        G_Garage_Qual1  +    -0.06277203908678 * G_Garage_Qual2
          +     0.12116730494737 * G_House_Style0  +     0.13602309075541 * 
        G_House_Style1  +     0.25586423111418 * G_House_Style2
          +     0.29154536740607 * G_House_Style3  +     0.41903976524231 * 
        G_House_Style4  +    -0.00694353111474 * G_Kitchen_Qual0
          +     -0.1377727716627 * G_Kitchen_Qual1  +    -0.27983156998735 * 
        G_Kitchen_Qual2  +    -0.10624918164155 * G_MS_SubClass0
          +     0.27787911933077 * G_MS_SubClass1  +      -0.026348146524 * 
        G_MS_SubClass2  +     0.08962944688063 * G_MS_SubClass3
          +     0.05412703566152 * G_MS_SubClass4  +    -0.06283055366524 * 
        G_MS_SubClass5  +     0.26519749044963 * G_MS_SubClass6
          +     0.02160599980375 * G_MS_SubClass7  +    -0.03584778403539 * 
        G_Neighborhood0  +     0.02392694749297 * G_Neighborhood1
          +    -0.28167359240451 * G_Neighborhood2  +    -0.06643951375405 * 
        G_Neighborhood3  +    -0.15234841819608 * G_Neighborhood4
          +    -0.06697251943887 * G_Neighborhood5  +     -0.1499696677467 * 
        G_Neighborhood6  +    -0.16432930011303 * G_Neighborhood7
          +     -0.1222342444032 * G_Neighborhood8  +    -0.11618588914413 * 
        G_Neighborhood9  +    -0.25558283138306 * G_Neighborhood10
          +    -0.07387157608171 * G_Neighborhood11  +     0.12345781054593 * 
        G_Neighborhood12  +    -0.37314963354437 * G_Pool_QC0
          +    -0.14912309418352 * G_Pool_QC1  +     -0.1100673323813 * 
        G_Roof_Matl0  +    -0.13232383049399 * G_Roof_Matl1
          +    -0.29422253920374 * G_Sale_Condition0
          +     0.25820252132127 * G_Sale_Condition1
          +      0.0491491341919 * G_Sale_Condition2
          +      0.0990038823933 * G_Sale_Condition3
          +    -0.32209835138495 * Land_ContourBnk  +    -0.06409500346671 * 
        Land_ContourHLS  +    -0.22113774946911 * Land_ContourLow ;
   H103  = H103  +    -0.12616959903204 * Exter_QualEx
          +     0.10936561886397 * Exter_QualFa  +    -0.12992657602639 * 
        Exter_QualGd  +    -0.06918914010204 * G_Bldg_Type0
          +     0.01081783068289 * G_Bldg_Type1  +    -0.21050311896471 * 
        G_Bldg_Type2  +     0.00037039327633 * G_Bsmt_Exposure0
          +    -0.19857149782344 * G_Bsmt_Exposure1  +     -0.0794408902403 * 
        G_Bsmt_Exposure2  +     0.11230674035668 * G_Bsmt_Exposure3
          +      0.1034191657083 * G_Bsmt_Qual0  +    -0.19007061521987 * 
        G_Bsmt_Qual1  +     -0.1480548058785 * G_Bsmt_Qual2
          +     0.02595836152929 * G_Condition_10  +    -0.04055714037607 * 
        G_Condition_11  +    -0.10370769331366 * G_Condition_12
          +    -0.02892522487907 * G_Condition_13  +     0.09998774389755 * 
        G_Condition_20  +    -0.01801606828327 * G_Condition_21
          +    -0.05820987195357 * G_Condition_22  +    -0.01352662573091 * 
        G_Exterior_1st0  +    -0.07629640615504 * G_Exterior_1st1
          +    -0.04551086874902 * G_Exterior_1st2  +     0.05567090739561 * 
        G_Exterior_1st3  +    -0.00006594661304 * G_Exterior_1st4
          +     -0.0182872080801 * G_Exterior_1st5  +     0.00963472989489 * 
        G_Exterior_1st6  +     0.18628489514155 * G_Exterior_1st7
          +     0.13452100706927 * G_Functional0  +     -0.0752292585531 * 
        G_Functional1  +     0.07461111904552 * G_Functional2
          +     0.12741531712233 * G_Garage_Qual0  +    -0.10479929611149 * 
        G_Garage_Qual1  +     0.12598208027685 * G_Garage_Qual2
          +    -0.20167082844645 * G_House_Style0  +     0.26660061828755 * 
        G_House_Style1  +     0.08829762565365 * G_House_Style2
          +    -0.11085043064168 * G_House_Style3  +     0.14021110859481 * 
        G_House_Style4  +    -0.04820934243822 * G_Kitchen_Qual0
          +    -0.08028359038641 * G_Kitchen_Qual1  +    -0.02206349003075 * 
        G_Kitchen_Qual2  +    -0.01714855333903 * G_MS_SubClass0
          +     0.03704151168517 * G_MS_SubClass1  +     0.30572148950171 * 
        G_MS_SubClass2  +    -0.03363425780028 * G_MS_SubClass3
          +    -0.20348630845341 * G_MS_SubClass4  +     0.02099715182253 * 
        G_MS_SubClass5  +    -0.15145796133607 * G_MS_SubClass6
          +     0.01337561767486 * G_MS_SubClass7  +     0.02814072842013 * 
        G_Neighborhood0  +    -0.08262428382427 * G_Neighborhood1
          +    -0.09527475138469 * G_Neighborhood2  +     0.04142419161705 * 
        G_Neighborhood3  +     0.09027292838109 * G_Neighborhood4
          +    -0.08649238120123 * G_Neighborhood5  +      0.0042853275929 * 
        G_Neighborhood6  +    -0.00893473133182 * G_Neighborhood7
          +    -0.16429928707252 * G_Neighborhood8  +    -0.01689309139137 * 
        G_Neighborhood9  +     0.18166087230925 * G_Neighborhood10
          +    -0.15534251652776 * G_Neighborhood11  +    -0.09318866003556 * 
        G_Neighborhood12  +     0.10081537371225 * G_Pool_QC0
          +     0.04796216291527 * G_Pool_QC1  +     0.02592396061986 * 
        G_Roof_Matl0  +     0.05205606627355 * G_Roof_Matl1
          +    -0.02258523877769 * G_Sale_Condition0
          +    -0.10409965729263 * G_Sale_Condition1
          +     0.08410297145415 * G_Sale_Condition2
          +    -0.02125476234343 * G_Sale_Condition3
          +     0.11493132417622 * Land_ContourBnk  +    -0.14306868235627 * 
        Land_ContourHLS  +    -0.01013174021302 * Land_ContourLow ;
   H104  = H104  +     0.20551522658348 * Exter_QualEx
          +     0.16946742042235 * Exter_QualFa  +    -0.18722417597348 * 
        Exter_QualGd  +    -0.01476966701357 * G_Bldg_Type0
          +    -0.10255483453957 * G_Bldg_Type1  +     -0.1636899293316 * 
        G_Bldg_Type2  +     0.39514932135399 * G_Bsmt_Exposure0
          +    -0.30447333585445 * G_Bsmt_Exposure1  +     0.35252226564604 * 
        G_Bsmt_Exposure2  +     0.00856630193949 * G_Bsmt_Exposure3
          +    -0.06101577642579 * G_Bsmt_Qual0  +     0.04191958070484 * 
        G_Bsmt_Qual1  +    -0.07593623925306 * G_Bsmt_Qual2
          +    -0.11953350133086 * G_Condition_10  +    -0.15058508307245 * 
        G_Condition_11  +    -0.15565634171594 * G_Condition_12
          +     0.12032275119185 * G_Condition_13  +     -0.1137647699132 * 
        G_Condition_20  +    -0.47527484881762 * G_Condition_21
          +    -0.08534414848527 * G_Condition_22  +     0.00684668496912 * 
        G_Exterior_1st0  +     -0.1283310613059 * G_Exterior_1st1
          +    -0.13170457266344 * G_Exterior_1st2  +    -0.20813776584854 * 
        G_Exterior_1st3  +    -0.07562164535738 * G_Exterior_1st4
          +     0.27744426976184 * G_Exterior_1st5  +     0.12206812978346 * 
        G_Exterior_1st6  +     0.17805106700383 * G_Exterior_1st7
          +      0.2588109779364 * G_Functional0  +     0.26131186711035 * 
        G_Functional1  +     0.17832514711398 * G_Functional2
          +    -0.03303879825875 * G_Garage_Qual0  +     -0.0563441709999 * 
        G_Garage_Qual1  +    -0.11822490551892 * G_Garage_Qual2
          +    -0.15150137746161 * G_House_Style0  +     -0.1667408088251 * 
        G_House_Style1  +     0.20182248846309 * G_House_Style2
          +    -0.05358253842949 * G_House_Style3  +      0.0201457924008 * 
        G_House_Style4  +    -0.02053487430149 * G_Kitchen_Qual0
          +    -0.01116946324566 * G_Kitchen_Qual1  +     0.08906295235942 * 
        G_Kitchen_Qual2  +     0.14046645919143 * G_MS_SubClass0
          +     0.02086895247735 * G_MS_SubClass1  +     -0.0896053982155 * 
        G_MS_SubClass2  +    -0.05668033007187 * G_MS_SubClass3
          +      0.4296241685367 * G_MS_SubClass4  +    -0.00351791222792 * 
        G_MS_SubClass5  +      0.2170946278376 * G_MS_SubClass6
          +     0.06048856436264 * G_MS_SubClass7  +     0.18329646811146 * 
        G_Neighborhood0  +    -0.11919531362581 * G_Neighborhood1
          +     -0.2644748510476 * G_Neighborhood2  +     -0.1208727244641 * 
        G_Neighborhood3  +    -0.12863484684727 * G_Neighborhood4
          +    -0.03213236533893 * G_Neighborhood5  +     0.14268796494459 * 
        G_Neighborhood6  +     0.06029394767869 * G_Neighborhood7
          +     0.00932937493235 * G_Neighborhood8  +     0.13212377489157 * 
        G_Neighborhood9  +     -0.1414920601867 * G_Neighborhood10
          +     -0.2025291376168 * G_Neighborhood11  +      0.3103815354974 * 
        G_Neighborhood12  +    -0.47274206224149 * G_Pool_QC0
          +    -0.10288050082872 * G_Pool_QC1  +    -0.28486390680083 * 
        G_Roof_Matl0  +    -0.33827653263367 * G_Roof_Matl1
          +    -0.15780635308578 * G_Sale_Condition0
          +    -0.36747164445368 * G_Sale_Condition1
          +     0.03753379968199 * G_Sale_Condition2
          +     -0.4563019931424 * G_Sale_Condition3
          +    -0.00610765800145 * Land_ContourBnk  +     0.29877034180404 * 
        Land_ContourHLS  +     0.11707095796951 * Land_ContourLow ;
   H105  = H105  +    -0.11562514501095 * Exter_QualEx
          +    -0.00237463281957 * Exter_QualFa  +    -0.13514259376138 * 
        Exter_QualGd  +    -0.10459951521487 * G_Bldg_Type0
          +    -0.28816691784739 * G_Bldg_Type1  +    -0.14993868816704 * 
        G_Bldg_Type2  +     0.12011099460594 * G_Bsmt_Exposure0
          +    -0.21646798852374 * G_Bsmt_Exposure1  +     0.08161488857398 * 
        G_Bsmt_Exposure2  +    -0.01577196409324 * G_Bsmt_Exposure3
          +     0.06958408595611 * G_Bsmt_Qual0  +     0.10413860083035 * 
        G_Bsmt_Qual1  +     0.08556901185737 * G_Bsmt_Qual2
          +    -0.12343082825147 * G_Condition_10  +    -0.06722158266271 * 
        G_Condition_11  +    -0.05620761287675 * G_Condition_12
          +     0.07602527732463 * G_Condition_13  +    -0.15862045004748 * 
        G_Condition_20  +    -0.14505560465275 * G_Condition_21
          +     0.06948952835328 * G_Condition_22  +     -0.0981729839365 * 
        G_Exterior_1st0  +    -0.07149752158518 * G_Exterior_1st1
          +     0.02487955039336 * G_Exterior_1st2  +    -0.05119736311188 * 
        G_Exterior_1st3  +     0.13328779229829 * G_Exterior_1st4
          +    -0.04725776485903 * G_Exterior_1st5  +    -0.02421847502481 * 
        G_Exterior_1st6  +      0.0347171103082 * G_Exterior_1st7
          +    -0.01224454069484 * G_Functional0  +    -0.08616964350526 * 
        G_Functional1  +    -0.09846758917507 * G_Functional2
          +      0.0860316801192 * G_Garage_Qual0  +     0.07528248621312 * 
        G_Garage_Qual1  +     0.14835250713867 * G_Garage_Qual2
          +    -0.08459055035907 * G_House_Style0  +     0.11294097278027 * 
        G_House_Style1  +    -0.08754906245114 * G_House_Style2
          +     -0.1062084429947 * G_House_Style3  +     0.04162026914563 * 
        G_House_Style4  +     -0.1278845109117 * G_Kitchen_Qual0
          +    -0.15922338235407 * G_Kitchen_Qual1  +     0.09250429302268 * 
        G_Kitchen_Qual2  +     0.19021200093845 * G_MS_SubClass0
          +    -0.17355563595859 * G_MS_SubClass1  +    -0.07812691709134 * 
        G_MS_SubClass2  +     0.12427971365391 * G_MS_SubClass3
          +     0.07358178776737 * G_MS_SubClass4  +    -0.04818866652721 * 
        G_MS_SubClass5  +    -0.05979963160614 * G_MS_SubClass6
          +    -0.07230318281915 * G_MS_SubClass7  +     0.02178181615411 * 
        G_Neighborhood0  +     0.01315599665438 * G_Neighborhood1
          +     0.31740960264447 * G_Neighborhood2  +     0.14541578645549 * 
        G_Neighborhood3  +     0.12522097792866 * G_Neighborhood4
          +     0.09552383853988 * G_Neighborhood5  +     0.18772638436067 * 
        G_Neighborhood6  +     0.06214611413705 * G_Neighborhood7
          +     0.04028985888396 * G_Neighborhood8  +      0.1451402150356 * 
        G_Neighborhood9  +     0.13293407074442 * G_Neighborhood10
          +     0.15579440539172 * G_Neighborhood11  +    -0.22713479901413 * 
        G_Neighborhood12  +     0.18279231677493 * G_Pool_QC0
          +     0.08813985160323 * G_Pool_QC1  +     0.07040570760732 * 
        G_Roof_Matl0  +    -0.07622060012518 * G_Roof_Matl1
          +     0.08405727764189 * G_Sale_Condition0
          +     0.10316698691397 * G_Sale_Condition1
          +    -0.09427497965464 * G_Sale_Condition2
          +    -0.11021477636234 * G_Sale_Condition3
          +     0.18454825077335 * Land_ContourBnk  +     0.13967702220513 * 
        Land_ContourHLS  +    -0.02013079809151 * Land_ContourLow ;
   H106  = H106  +    -0.12996391237788 * Exter_QualEx
          +    -0.02184636624379 * Exter_QualFa  +    -0.11448169475283 * 
        Exter_QualGd  +    -0.03792301021979 * G_Bldg_Type0
          +     0.22700250440468 * G_Bldg_Type1  +    -0.10983547298045 * 
        G_Bldg_Type2  +      0.3416402742293 * G_Bsmt_Exposure0
          +     0.10243067518395 * G_Bsmt_Exposure1  +    -0.08094520431398 * 
        G_Bsmt_Exposure2  +    -0.07748107996377 * G_Bsmt_Exposure3
          +     0.24827204993676 * G_Bsmt_Qual0  +    -0.03384417904806 * 
        G_Bsmt_Qual1  +    -0.10131794181927 * G_Bsmt_Qual2
          +     0.27318772525925 * G_Condition_10  +    -0.06949955170218 * 
        G_Condition_11  +    -0.11441553564001 * G_Condition_12
          +     0.12493312216412 * G_Condition_13  +    -0.18116513098827 * 
        G_Condition_20  +    -0.05745109469753 * G_Condition_21
          +     0.16677417995166 * G_Condition_22  +      0.0673697044876 * 
        G_Exterior_1st0  +     0.09444916091058 * G_Exterior_1st1
          +     0.16851319923574 * G_Exterior_1st2  +     0.19084740718785 * 
        G_Exterior_1st3  +     0.28439197859066 * G_Exterior_1st4
          +    -0.19867305168986 * G_Exterior_1st5  +    -0.00838297415865 * 
        G_Exterior_1st6  +     0.31973959594113 * G_Exterior_1st7
          +     0.19184369047559 * G_Functional0  +     0.20746685930915 * 
        G_Functional1  +    -0.04214233663173 * G_Functional2
          +     0.02749745037283 * G_Garage_Qual0  +     0.14478123341227 * 
        G_Garage_Qual1  +     0.01538921618809 * G_Garage_Qual2
          +      0.0340821458545 * G_House_Style0  +    -0.03143682273964 * 
        G_House_Style1  +    -0.14885625479331 * G_House_Style2
          +     0.01388011600548 * G_House_Style3  +    -0.03408973600996 * 
        G_House_Style4  +    -0.22719492991916 * G_Kitchen_Qual0
          +     0.21460433598381 * G_Kitchen_Qual1  +    -0.03187288951687 * 
        G_Kitchen_Qual2  +    -0.01962790162833 * G_MS_SubClass0
          +    -0.08873692325354 * G_MS_SubClass1  +       0.122911067573 * 
        G_MS_SubClass2  +    -0.21412570841288 * G_MS_SubClass3
          +    -0.06090208841345 * G_MS_SubClass4  +    -0.02846973879547 * 
        G_MS_SubClass5  +     -0.1244411401553 * G_MS_SubClass6
          +    -0.15190541376569 * G_MS_SubClass7  +     0.15903140644413 * 
        G_Neighborhood0  +     0.18827289118454 * G_Neighborhood1
          +     0.32030787081342 * G_Neighborhood2  +     0.20944033035649 * 
        G_Neighborhood3  +     0.06585642995073 * G_Neighborhood4
          +     0.13934918411713 * G_Neighborhood5  +     0.08945871222735 * 
        G_Neighborhood6  +    -0.00742529770053 * G_Neighborhood7
          +     0.27157857816808 * G_Neighborhood8  +    -0.02858921605897 * 
        G_Neighborhood9  +    -0.11586603818324 * G_Neighborhood10
          +     0.19252418604131 * G_Neighborhood11  +    -0.06381946167136 * 
        G_Neighborhood12  +      0.2206609556946 * G_Pool_QC0
          +     0.09115584587004 * G_Pool_QC1  +     0.08867145146931 * 
        G_Roof_Matl0  +     0.13100104092184 * G_Roof_Matl1
          +    -0.19663786759303 * G_Sale_Condition0
          +     0.15099337268108 * G_Sale_Condition1
          +     0.05248895266065 * G_Sale_Condition2
          +    -0.08362669726327 * G_Sale_Condition3
          +     0.35982400914696 * Land_ContourBnk  +      0.1527299774265 * 
        Land_ContourHLS  +     0.16272436495129 * Land_ContourLow ;
   H107  = H107  +    -0.08748949609382 * Exter_QualEx
          +     0.22122942423423 * Exter_QualFa  +     -0.0372035790942 * 
        Exter_QualGd  +     0.04466958357994 * G_Bldg_Type0
          +    -0.00128219813371 * G_Bldg_Type1  +     0.37906764502214 * 
        G_Bldg_Type2  +    -0.00927204099452 * G_Bsmt_Exposure0
          +    -0.10440950079874 * G_Bsmt_Exposure1  +    -0.07182369921495 * 
        G_Bsmt_Exposure2  +     0.13391166431249 * G_Bsmt_Exposure3
          +     0.03024557515321 * G_Bsmt_Qual0  +    -0.00963496178738 * 
        G_Bsmt_Qual1  +     0.14069231018323 * G_Bsmt_Qual2
          +     0.15700711987204 * G_Condition_10  +     0.13075045243692 * 
        G_Condition_11  +     0.04528177944511 * G_Condition_12
          +    -0.14972543700285 * G_Condition_13  +     0.04616496747506 * 
        G_Condition_20  +     0.16990043817654 * G_Condition_21
          +    -0.02249331333368 * G_Condition_22  +    -0.13617733999516 * 
        G_Exterior_1st0  +      0.0253816614177 * G_Exterior_1st1
          +     0.03392393645477 * G_Exterior_1st2  +    -0.07251922254333 * 
        G_Exterior_1st3  +    -0.01931825159775 * G_Exterior_1st4
          +     0.19487664409409 * G_Exterior_1st5  +     0.07318738091427 * 
        G_Exterior_1st6  +    -0.10700650749929 * G_Exterior_1st7
          +     0.12170007805717 * G_Functional0  +    -0.10808413484262 * 
        G_Functional1  +     0.01218547631728 * G_Functional2
          +    -0.11805247725274 * G_Garage_Qual0  +     0.13472414636487 * 
        G_Garage_Qual1  +     0.06360887562817 * G_Garage_Qual2
          +     0.05229001258213 * G_House_Style0  +    -0.10119473736087 * 
        G_House_Style1  +    -0.03773980058406 * G_House_Style2
          +     0.08403167390741 * G_House_Style3  +    -0.04623526931339 * 
        G_House_Style4  +     0.00102102758499 * G_Kitchen_Qual0
          +     0.11683915289536 * G_Kitchen_Qual1  +     0.26237049703427 * 
        G_Kitchen_Qual2  +    -0.23544591639886 * G_MS_SubClass0
          +    -0.12767316451599 * G_MS_SubClass1  +     -0.2935954252121 * 
        G_MS_SubClass2  +    -0.05960414761127 * G_MS_SubClass3
          +    -0.11096698556621 * G_MS_SubClass4  +     0.08361810532696 * 
        G_MS_SubClass5  +     0.12283041439671 * G_MS_SubClass6
          +    -0.09315430820302 * G_MS_SubClass7  +    -0.05178348528835 * 
        G_Neighborhood0  +    -0.01708393502514 * G_Neighborhood1
          +     -0.3019283363039 * G_Neighborhood2  +    -0.02259738549691 * 
        G_Neighborhood3  +    -0.11068916612255 * G_Neighborhood4
          +    -0.22127955922368 * G_Neighborhood5  +     0.00025647775665 * 
        G_Neighborhood6  +      -0.041262952919 * G_Neighborhood7
          +    -0.17389335850846 * G_Neighborhood8  +    -0.15515675574969 * 
        G_Neighborhood9  +    -0.08486458870096 * G_Neighborhood10
          +     0.08247141952042 * G_Neighborhood11  +    -0.01184869975735 * 
        G_Neighborhood12  +    -0.19517224972888 * G_Pool_QC0
          +    -0.24552334335404 * G_Pool_QC1  +     0.15107365015978 * 
        G_Roof_Matl0  +    -0.05000735695144 * G_Roof_Matl1
          +     0.26168589518287 * G_Sale_Condition0
          +    -0.05283856924883 * G_Sale_Condition1
          +       0.145688585426 * G_Sale_Condition2
          +     0.02764092343926 * G_Sale_Condition3
          +     -0.3150612717912 * Land_ContourBnk  +     0.07776085898356 * 
        Land_ContourHLS  +    -0.12227645582399 * Land_ContourLow ;
   H108  = H108  +     0.17668436975547 * Exter_QualEx
          +    -0.04589060715153 * Exter_QualFa  +     0.09600993661017 * 
        Exter_QualGd  +    -0.01130240737884 * G_Bldg_Type0
          +    -0.06368407774709 * G_Bldg_Type1  +    -0.05898537232094 * 
        G_Bldg_Type2  +     0.18853402815268 * G_Bsmt_Exposure0
          +    -0.02378969881804 * G_Bsmt_Exposure1  +    -0.13442877676015 * 
        G_Bsmt_Exposure2  +    -0.12669552739571 * G_Bsmt_Exposure3
          +    -0.05656931888311 * G_Bsmt_Qual0  +    -0.00311758026821 * 
        G_Bsmt_Qual1  +     0.08114335307533 * G_Bsmt_Qual2
          +     0.04645267606912 * G_Condition_10  +    -0.26193273144257 * 
        G_Condition_11  +     0.23633346695341 * G_Condition_12
          +     0.08978345696825 * G_Condition_13  +    -0.07164663215643 * 
        G_Condition_20  +    -0.03941266684411 * G_Condition_21
          +     0.02303471823079 * G_Condition_22  +    -0.11064965942648 * 
        G_Exterior_1st0  +     0.00526261468933 * G_Exterior_1st1
          +    -0.12774103974667 * G_Exterior_1st2  +    -0.08298501350153 * 
        G_Exterior_1st3  +     0.02131718852655 * G_Exterior_1st4
          +     0.12463754959935 * G_Exterior_1st5  +    -0.10282104082457 * 
        G_Exterior_1st6  +    -0.00480184544312 * G_Exterior_1st7
          +    -0.02397189434802 * G_Functional0  +     0.03107456401262 * 
        G_Functional1  +     0.11691349941351 * G_Functional2
          +     -0.0975701978399 * G_Garage_Qual0  +     0.01701532633262 * 
        G_Garage_Qual1  +    -0.11617235145429 * G_Garage_Qual2
          +    -0.06563723668274 * G_House_Style0  +     0.06684077243207 * 
        G_House_Style1  +    -0.07129292333411 * G_House_Style2
          +     0.05272120910335 * G_House_Style3  +    -0.00398046429461 * 
        G_House_Style4  +    -0.04889681602235 * G_Kitchen_Qual0
          +    -0.13471514382392 * G_Kitchen_Qual1  +     -0.0057876039018 * 
        G_Kitchen_Qual2  +     0.14478420312412 * G_MS_SubClass0
          +     0.01828416337563 * G_MS_SubClass1  +     0.07586317468098 * 
        G_MS_SubClass2  +    -0.01231276907956 * G_MS_SubClass3
          +     0.02011917990299 * G_MS_SubClass4  +     0.05173652117347 * 
        G_MS_SubClass5  +    -0.17446188556512 * G_MS_SubClass6
          +     0.10816192244937 * G_MS_SubClass7  +    -0.05222735534879 * 
        G_Neighborhood0  +     0.04182277050521 * G_Neighborhood1
          +    -0.06536660416257 * G_Neighborhood2  +     0.10930960231167 * 
        G_Neighborhood3  +    -0.22786250203658 * G_Neighborhood4
          +     0.16429694487241 * G_Neighborhood5  +     0.03782012586086 * 
        G_Neighborhood6  +     0.13035420355515 * G_Neighborhood7
          +     0.16506202585383 * G_Neighborhood8  +     0.17431975396206 * 
        G_Neighborhood9  +     0.14400462280505 * G_Neighborhood10
          +    -0.11439251608618 * G_Neighborhood11  +    -0.01156885068827 * 
        G_Neighborhood12  +    -0.12726616510339 * G_Pool_QC0
          +     -0.0202148223258 * G_Pool_QC1  +    -0.12049369424617 * 
        G_Roof_Matl0  +     0.04837173540842 * G_Roof_Matl1
          +     0.01411693866682 * G_Sale_Condition0
          +    -0.02514821308873 * G_Sale_Condition1
          +     0.12188745302693 * G_Sale_Condition2
          +     0.10353797000849 * G_Sale_Condition3
          +     0.06771290651434 * Land_ContourBnk  +    -0.21270935064145 * 
        Land_ContourHLS  +     0.11103850146165 * Land_ContourLow ;
   H109  = H109  +    -0.22977960227336 * Exter_QualEx
          +    -0.14237622923538 * Exter_QualFa  +     0.06504498766355 * 
        Exter_QualGd  +    -0.12470588079717 * G_Bldg_Type0
          +     0.18526486515851 * G_Bldg_Type1  +     0.03945059658839 * 
        G_Bldg_Type2  +     0.06719810770874 * G_Bsmt_Exposure0
          +     0.45625099746301 * G_Bsmt_Exposure1  +     0.21322011048822 * 
        G_Bsmt_Exposure2  +     0.18524212648859 * G_Bsmt_Exposure3
          +     0.01833343583552 * G_Bsmt_Qual0  +     0.20901378217022 * 
        G_Bsmt_Qual1  +     0.01121676541216 * G_Bsmt_Qual2
          +     0.19776031393297 * G_Condition_10  +    -0.05677987897902 * 
        G_Condition_11  +     0.25568220605291 * G_Condition_12
          +    -0.11360875661137 * G_Condition_13  +      0.1046285896625 * 
        G_Condition_20  +     0.08543421222848 * G_Condition_21
          +     0.20186660624235 * G_Condition_22  +     0.18153121249489 * 
        G_Exterior_1st0  +     0.10213788643034 * G_Exterior_1st1
          +      0.0180147789341 * G_Exterior_1st2  +     0.00013643292267 * 
        G_Exterior_1st3  +     0.01852064877888 * G_Exterior_1st4
          +    -0.05918342322534 * G_Exterior_1st5  +     0.28597389068077 * 
        G_Exterior_1st6  +    -0.05365488188045 * G_Exterior_1st7
          +       0.035060017846 * G_Functional0  +     0.01535162950679 * 
        G_Functional1  +      0.0080505675771 * G_Functional2
          +    -0.09244413572381 * G_Garage_Qual0  +     0.14700702697253 * 
        G_Garage_Qual1  +      0.1410826610625 * G_Garage_Qual2
          +    -0.03399458090242 * G_House_Style0  +     0.18153201002666 * 
        G_House_Style1  +     0.04680156181305 * G_House_Style2
          +    -0.13178900011798 * G_House_Style3  +     0.06553867241564 * 
        G_House_Style4  +    -0.15961732002008 * G_Kitchen_Qual0
          +     0.23408621509345 * G_Kitchen_Qual1  +     0.19381143350233 * 
        G_Kitchen_Qual2  +    -0.19793054609228 * G_MS_SubClass0
          +      0.1222263554471 * G_MS_SubClass1  +     0.04843310938431 * 
        G_MS_SubClass2  +     0.06144583372976 * G_MS_SubClass3
          +    -0.06810968494063 * G_MS_SubClass4  +     0.01527021719449 * 
        G_MS_SubClass5  +      0.1106309385209 * G_MS_SubClass6
          +     0.04245212765101 * G_MS_SubClass7  +    -0.05376013497247 * 
        G_Neighborhood0  +    -0.09950754273942 * G_Neighborhood1
          +    -0.25632611721816 * G_Neighborhood2  +     0.02178761152053 * 
        G_Neighborhood3  +     0.19407645428781 * G_Neighborhood4
          +     -0.0364659600878 * G_Neighborhood5  +    -0.33056781545956 * 
        G_Neighborhood6  +     0.07241817182568 * G_Neighborhood7
          +     0.22191337301594 * G_Neighborhood8  +      0.0005001026581 * 
        G_Neighborhood9  +    -0.24727065702389 * G_Neighborhood10
          +    -0.08710378004804 * G_Neighborhood11  +    -0.12926913158191 * 
        G_Neighborhood12  +     0.33524219835891 * G_Pool_QC0
          +    -0.00858540026932 * G_Pool_QC1  +     0.13994718196657 * 
        G_Roof_Matl0  +     0.18975804070865 * G_Roof_Matl1
          +     -0.1075408494835 * G_Sale_Condition0
          +      0.1341669507579 * G_Sale_Condition1
          +     0.02095745225285 * G_Sale_Condition2
          +    -0.10170638899756 * G_Sale_Condition3
          +     0.01502929679948 * Land_ContourBnk  +     0.22232732616964 * 
        Land_ContourHLS  +    -0.00537835152184 * Land_ContourLow ;
   H110  = H110  +     0.18783068192035 * Exter_QualEx
          +    -0.13182841871406 * Exter_QualFa  +    -0.13372436865038 * 
        Exter_QualGd  +    -0.05419704609935 * G_Bldg_Type0
          +    -0.11088060078735 * G_Bldg_Type1  +    -0.02712055508658 * 
        G_Bldg_Type2  +    -0.04222981528986 * G_Bsmt_Exposure0
          +     -0.1382262438478 * G_Bsmt_Exposure1  +    -0.04605128711673 * 
        G_Bsmt_Exposure2  +    -0.15176068314244 * G_Bsmt_Exposure3
          +     0.07339232435961 * G_Bsmt_Qual0  +     0.05339799462419 * 
        G_Bsmt_Qual1  +     -0.1231806715739 * G_Bsmt_Qual2
          +     0.05046694207928 * G_Condition_10  +     0.08565917284099 * 
        G_Condition_11  +    -0.07745043457363 * G_Condition_12
          +      0.0893423807992 * G_Condition_13  +     0.14754723927578 * 
        G_Condition_20  +     -0.0582278927072 * G_Condition_21
          +    -0.01774559480844 * G_Condition_22  +    -0.18474957317441 * 
        G_Exterior_1st0  +    -0.00045592134642 * G_Exterior_1st1
          +     0.05169758327055 * G_Exterior_1st2  +     -0.2614418747556 * 
        G_Exterior_1st3  +    -0.08194025535726 * G_Exterior_1st4
          +     0.08895185414251 * G_Exterior_1st5  +     0.04012436963034 * 
        G_Exterior_1st6  +     0.01271405639352 * G_Exterior_1st7
          +    -0.18895236512416 * G_Functional0  +     0.04758858656513 * 
        G_Functional1  +     0.01806731168972 * G_Functional2
          +     0.07037479707025 * G_Garage_Qual0  +      0.0165275178142 * 
        G_Garage_Qual1  +    -0.07617350524354 * G_Garage_Qual2
          +     0.10364829767625 * G_House_Style0  +    -0.08618597569335 * 
        G_House_Style1  +     0.00946284102262 * G_House_Style2
          +     0.06371363013465 * G_House_Style3  +     0.22186748043392 * 
        G_House_Style4  +    -0.13239725707906 * G_Kitchen_Qual0
          +    -0.06033538759625 * G_Kitchen_Qual1  +    -0.02127456286098 * 
        G_Kitchen_Qual2  +      0.0728377825175 * G_MS_SubClass0
          +     0.03985727297782 * G_MS_SubClass1  +     0.00813180196031 * 
        G_MS_SubClass2  +    -0.14234481028125 * G_MS_SubClass3
          +     0.18263308900821 * G_MS_SubClass4  +      0.1440289722642 * 
        G_MS_SubClass5  +    -0.15417637092037 * G_MS_SubClass6
          +    -0.28043523410134 * G_MS_SubClass7  +     0.18559014266206 * 
        G_Neighborhood0  +     0.14929526053455 * G_Neighborhood1
          +    -0.05418271272111 * G_Neighborhood2  +        0.12933181534 * 
        G_Neighborhood3  +    -0.13626682218546 * G_Neighborhood4
          +     0.10829647207529 * G_Neighborhood5  +      0.2007716594785 * 
        G_Neighborhood6  +     0.21510817694202 * G_Neighborhood7
          +     0.16432799442329 * G_Neighborhood8  +     0.08974653455562 * 
        G_Neighborhood9  +    -0.04551096827327 * G_Neighborhood10
          +     0.15382645099356 * G_Neighborhood11  +    -0.09626371993426 * 
        G_Neighborhood12  +     0.07344581296842 * G_Pool_QC0
          +    -0.17693578092239 * G_Pool_QC1  +      -0.010296683331 * 
        G_Roof_Matl0  +     0.14710810790194 * G_Roof_Matl1
          +     0.15223455112638 * G_Sale_Condition0
          +    -0.03321596113813 * G_Sale_Condition1
          +     0.00028411175231 * G_Sale_Condition2
          +     0.01470740284998 * G_Sale_Condition3
          +     0.15491007844721 * Land_ContourBnk  +     0.29313437297736 * 
        Land_ContourHLS  +     0.28521911587158 * Land_ContourLow ;
   H111  = H111  +    -0.05396859408675 * Exter_QualEx
          +    -0.01525991784122 * Exter_QualFa  +     0.13423079291677 * 
        Exter_QualGd  +     0.01984550656709 * G_Bldg_Type0
          +    -0.01476182725546 * G_Bldg_Type1  +     0.03743446290516 * 
        G_Bldg_Type2  +      0.1610536859873 * G_Bsmt_Exposure0
          +     0.18257300586926 * G_Bsmt_Exposure1  +    -0.11043138369177 * 
        G_Bsmt_Exposure2  +     0.14833620078057 * G_Bsmt_Exposure3
          +     0.08218045017106 * G_Bsmt_Qual0  +     -0.1018617832773 * 
        G_Bsmt_Qual1  +    -0.07239397757551 * G_Bsmt_Qual2
          +      0.1248182806516 * G_Condition_10  +     0.12356334033686 * 
        G_Condition_11  +     0.28304778852307 * G_Condition_12
          +    -0.06129939833943 * G_Condition_13  +      0.1749165949908 * 
        G_Condition_20  +    -0.03206708884218 * G_Condition_21
          +    -0.06475907856696 * G_Condition_22  +     0.02910016557088 * 
        G_Exterior_1st0  +    -0.09685582308877 * G_Exterior_1st1
          +    -0.00351437552836 * G_Exterior_1st2  +    -0.00302450485678 * 
        G_Exterior_1st3  +     0.04186676867077 * G_Exterior_1st4
          +     0.03636214295051 * G_Exterior_1st5  +    -0.11672781231106 * 
        G_Exterior_1st6  +     0.02623947276039 * G_Exterior_1st7
          +     0.03523224391232 * G_Functional0  +    -0.27688006924901 * 
        G_Functional1  +    -0.02063079570118 * G_Functional2
          +    -0.02253077954046 * G_Garage_Qual0  +    -0.06113912331295 * 
        G_Garage_Qual1  +    -0.06387640659376 * G_Garage_Qual2
          +     0.04162348832426 * G_House_Style0  +    -0.02059376396308 * 
        G_House_Style1  +     0.12468668234515 * G_House_Style2
          +     0.05457364786065 * G_House_Style3  +     0.07533347491137 * 
        G_House_Style4  +    -0.12930972432282 * G_Kitchen_Qual0
          +    -0.04151389635769 * G_Kitchen_Qual1  +     0.10690870913001 * 
        G_Kitchen_Qual2  +      0.1957550318844 * G_MS_SubClass0
          +    -0.03182771846103 * G_MS_SubClass1  +    -0.06229202501247 * 
        G_MS_SubClass2  +    -0.03526254135182 * G_MS_SubClass3
          +     0.05878861539826 * G_MS_SubClass4  +     -0.0200648066507 * 
        G_MS_SubClass5  +    -0.00840798190962 * G_MS_SubClass6
          +     0.05847942115661 * G_MS_SubClass7  +    -0.13962770832256 * 
        G_Neighborhood0  +     -0.1077041853632 * G_Neighborhood1
          +    -0.03013409621941 * G_Neighborhood2  +     0.08384307383899 * 
        G_Neighborhood3  +     -0.1537964348612 * G_Neighborhood4
          +     -0.0018480368923 * G_Neighborhood5  +    -0.02033636171403 * 
        G_Neighborhood6  +    -0.13190388987734 * G_Neighborhood7
          +    -0.13543504032872 * G_Neighborhood8  +     0.08401484035944 * 
        G_Neighborhood9  +     0.02330247547295 * G_Neighborhood10
          +     0.01935685226921 * G_Neighborhood11  +    -0.19829462605934 * 
        G_Neighborhood12  +    -0.01202890934233 * G_Pool_QC0
          +     0.03766287346424 * G_Pool_QC1  +     0.12785418345224 * 
        G_Roof_Matl0  +    -0.02758401244326 * G_Roof_Matl1
          +      0.0081114934912 * G_Sale_Condition0
          +     0.13334287356513 * G_Sale_Condition1
          +     0.25515970380296 * G_Sale_Condition2
          +     0.06502512395755 * G_Sale_Condition3
          +     -0.1681791828664 * Land_ContourBnk  +     0.11238230329963 * 
        Land_ContourHLS  +     0.14488576139996 * Land_ContourLow ;
   H112  = H112  +    -0.04394515683055 * Exter_QualEx
          +     0.26048178043261 * Exter_QualFa  +     0.00258748535803 * 
        Exter_QualGd  +    -0.09316911991357 * G_Bldg_Type0
          +    -0.17162170029343 * G_Bldg_Type1  +    -0.26665209850205 * 
        G_Bldg_Type2  +      0.3516750330582 * G_Bsmt_Exposure0
          +      0.1145436670983 * G_Bsmt_Exposure1  +     0.00666890292691 * 
        G_Bsmt_Exposure2  +    -0.12985937507148 * G_Bsmt_Exposure3
          +     0.14366298534002 * G_Bsmt_Qual0  +      0.1363046955569 * 
        G_Bsmt_Qual1  +     0.55535184535691 * G_Bsmt_Qual2
          +    -0.19962237397069 * G_Condition_10  +    -0.17524077164763 * 
        G_Condition_11  +    -0.25751455022851 * G_Condition_12
          +     0.09063996084404 * G_Condition_13  +    -0.11862390695976 * 
        G_Condition_20  +    -0.27958753844179 * G_Condition_21
          +     0.08905761406137 * G_Condition_22  +      0.1615560177395 * 
        G_Exterior_1st0  +    -0.18117857144667 * G_Exterior_1st1
          +    -0.00404346478866 * G_Exterior_1st2  +     0.00756583657466 * 
        G_Exterior_1st3  +     0.19756935384526 * G_Exterior_1st4
          +    -0.21580715220987 * G_Exterior_1st5  +    -0.10293405534728 * 
        G_Exterior_1st6  +      0.0570873721767 * G_Exterior_1st7
          +     0.17182736948809 * G_Functional0  +      0.2302706538881 * 
        G_Functional1  +    -0.01942433343319 * G_Functional2
          +    -0.10404995878886 * G_Garage_Qual0  +     0.11585440846294 * 
        G_Garage_Qual1  +    -0.28285233684313 * G_Garage_Qual2
          +     0.12083563333652 * G_House_Style0  +     -0.1932562360737 * 
        G_House_Style1  +     0.07512599365379 * G_House_Style2
          +    -0.08102943739482 * G_House_Style3  +     0.15436595415953 * 
        G_House_Style4  +     0.37935438003566 * G_Kitchen_Qual0
          +     0.22339287032816 * G_Kitchen_Qual1  +     0.26995688608249 * 
        G_Kitchen_Qual2  +    -0.06430229852767 * G_MS_SubClass0
          +     0.14947679844832 * G_MS_SubClass1  +    -0.03332710094954 * 
        G_MS_SubClass2  +     -0.0725855783925 * G_MS_SubClass3
          +    -0.21379126515282 * G_MS_SubClass4  +     0.06335146854925 * 
        G_MS_SubClass5  +    -0.08221289179831 * G_MS_SubClass6
          +     0.17996611759375 * G_MS_SubClass7  +     0.17537179211939 * 
        G_Neighborhood0  +     0.20167103276414 * G_Neighborhood1
          +     0.35963801792033 * G_Neighborhood2  +     0.03527450705535 * 
        G_Neighborhood3  +     0.28815283752142 * G_Neighborhood4
          +     0.16375516684151 * G_Neighborhood5  +     0.09929060234321 * 
        G_Neighborhood6  +     0.29561842552877 * G_Neighborhood7
          +     0.16488520786648 * G_Neighborhood8  +     0.01988905096652 * 
        G_Neighborhood9  +       0.272325396658 * G_Neighborhood10
          +     0.40423415527025 * G_Neighborhood11  +     0.17176063460845 * 
        G_Neighborhood12  +    -0.35875081196553 * G_Pool_QC0
          +    -0.15569212717961 * G_Pool_QC1  +    -0.23872508173163 * 
        G_Roof_Matl0  +    -0.02428340231563 * G_Roof_Matl1
          +      0.0797702864618 * G_Sale_Condition0
          +     0.20176283653101 * G_Sale_Condition1
          +      0.3036232423193 * G_Sale_Condition2
          +    -0.25123874307021 * G_Sale_Condition3
          +    -0.08857976078478 * Land_ContourBnk  +     0.34939152210779 * 
        Land_ContourHLS  +     0.04855276767869 * Land_ContourLow ;
   H113  = H113  +     0.05301461011958 * Exter_QualEx
          +      0.0883809737416 * Exter_QualFa  +     0.05079976423804 * 
        Exter_QualGd  +     0.01115511186033 * G_Bldg_Type0
          +     0.07927977140929 * G_Bldg_Type1  +     0.19122707453256 * 
        G_Bldg_Type2  +     0.09657203959362 * G_Bsmt_Exposure0
          +     0.17215680356918 * G_Bsmt_Exposure1  +     0.03236073698878 * 
        G_Bsmt_Exposure2  +     0.29899863486194 * G_Bsmt_Exposure3
          +     0.02862791715397 * G_Bsmt_Qual0  +      0.1049905129048 * 
        G_Bsmt_Qual1  +    -0.10683405845594 * G_Bsmt_Qual2
          +      0.1155793798343 * G_Condition_10  +     0.05880197540096 * 
        G_Condition_11  +    -0.00477863290974 * G_Condition_12
          +     0.15012277903086 * G_Condition_13  +    -0.09420551143518 * 
        G_Condition_20  +    -0.02248390959503 * G_Condition_21
          +     0.00707366242254 * G_Condition_22  +     0.01052420822578 * 
        G_Exterior_1st0  +     0.18155934187289 * G_Exterior_1st1
          +      0.0713447291984 * G_Exterior_1st2  +    -0.07022932293415 * 
        G_Exterior_1st3  +    -0.07264111376034 * G_Exterior_1st4
          +     0.02081045197192 * G_Exterior_1st5  +    -0.03159679805012 * 
        G_Exterior_1st6  +     0.27013420402531 * G_Exterior_1st7
          +     0.09837836912913 * G_Functional0  +    -0.02794431126703 * 
        G_Functional1  +    -0.23284794697579 * G_Functional2
          +     0.15464025128555 * G_Garage_Qual0  +     0.01500322219337 * 
        G_Garage_Qual1  +     0.05750432508627 * G_Garage_Qual2
          +    -0.07657206882372 * G_House_Style0  +     0.07786466061698 * 
        G_House_Style1  +    -0.11182942662392 * G_House_Style2
          +     0.03838234078223 * G_House_Style3  +     0.23211244419694 * 
        G_House_Style4  +    -0.00640222745205 * G_Kitchen_Qual0
          +     0.05127548946542 * G_Kitchen_Qual1  +    -0.06776056528906 * 
        G_Kitchen_Qual2  +     0.12209897307401 * G_MS_SubClass0
          +    -0.14682701924993 * G_MS_SubClass1  +    -0.03355629698679 * 
        G_MS_SubClass2  +    -0.10170405253888 * G_MS_SubClass3
          +     0.06438924100509 * G_MS_SubClass4  +     0.07909536435595 * 
        G_MS_SubClass5  +    -0.24284909434113 * G_MS_SubClass6
          +     0.03850788992626 * G_MS_SubClass7  +    -0.20584091506745 * 
        G_Neighborhood0  +     0.05872548038052 * G_Neighborhood1
          +     0.07113779036774 * G_Neighborhood2  +       0.026161034314 * 
        G_Neighborhood3  +     0.03060902785418 * G_Neighborhood4
          +    -0.16376152355323 * G_Neighborhood5  +    -0.16554655176107 * 
        G_Neighborhood6  +     0.10027743375045 * G_Neighborhood7
          +     0.12066810160255 * G_Neighborhood8  +      -0.119462065875 * 
        G_Neighborhood9  +     0.03034872946408 * G_Neighborhood10
          +    -0.02725401427539 * G_Neighborhood11  +     -0.1862965304906 * 
        G_Neighborhood12  +     -0.1158775888512 * G_Pool_QC0
          +    -0.00305012452093 * G_Pool_QC1  +    -0.11431613741387 * 
        G_Roof_Matl0  +     0.09220454369865 * G_Roof_Matl1
          +    -0.05437197906397 * G_Sale_Condition0
          +     0.01944334384639 * G_Sale_Condition1
          +     0.14623076613852 * G_Sale_Condition2
          +    -0.05980319705376 * G_Sale_Condition3
          +     0.04046237461495 * Land_ContourBnk  +    -0.08359003094557 * 
        Land_ContourHLS  +      0.0341589222531 * Land_ContourLow ;
   H114  = H114  +    -0.00674525631031 * Exter_QualEx
          +     0.08258641626062 * Exter_QualFa  +    -0.10388080878897 * 
        Exter_QualGd  +     0.00906761544946 * G_Bldg_Type0
          +    -0.16454134345933 * G_Bldg_Type1  +     0.05316424936428 * 
        G_Bldg_Type2  +    -0.03781951383555 * G_Bsmt_Exposure0
          +     0.25665827950129 * G_Bsmt_Exposure1  +     0.01746288609433 * 
        G_Bsmt_Exposure2  +      0.0544890152158 * G_Bsmt_Exposure3
          +    -0.15924961970685 * G_Bsmt_Qual0  +    -0.16584449823546 * 
        G_Bsmt_Qual1  +    -0.02101956634764 * G_Bsmt_Qual2
          +    -0.04741975657015 * G_Condition_10  +     0.02632462604951 * 
        G_Condition_11  +     0.17001852447658 * G_Condition_12
          +     0.00397483108449 * G_Condition_13  +     0.05261796458726 * 
        G_Condition_20  +     0.07855150145853 * G_Condition_21
          +     0.05368194734178 * G_Condition_22  +    -0.17538955433807 * 
        G_Exterior_1st0  +     0.01198966993941 * G_Exterior_1st1
          +    -0.10449887564171 * G_Exterior_1st2  +    -0.05867387772823 * 
        G_Exterior_1st3  +      0.0311744656691 * G_Exterior_1st4
          +    -0.01411259303138 * G_Exterior_1st5  +    -0.03271226321876 * 
        G_Exterior_1st6  +    -0.18157451126162 * G_Exterior_1st7
          +      0.0261211271689 * G_Functional0  +     0.06585464797237 * 
        G_Functional1  +     0.01331276634878 * G_Functional2
          +     0.04552758843447 * G_Garage_Qual0  +    -0.06101891650935 * 
        G_Garage_Qual1  +     0.01223361729171 * G_Garage_Qual2
          +    -0.07185236843888 * G_House_Style0  +    -0.04608994850251 * 
        G_House_Style1  +     0.19672819861093 * G_House_Style2
          +     0.07180518960731 * G_House_Style3  +     0.00303594023058 * 
        G_House_Style4  +    -0.17335145400967 * G_Kitchen_Qual0
          +      0.1082529181356 * G_Kitchen_Qual1  +     0.08993050314042 * 
        G_Kitchen_Qual2  +     0.06860378936995 * G_MS_SubClass0
          +     0.01345917041994 * G_MS_SubClass1  +     -0.0522925104526 * 
        G_MS_SubClass2  +     0.04900103694844 * G_MS_SubClass3
          +    -0.11564293627056 * G_MS_SubClass4  +     0.05861569215503 * 
        G_MS_SubClass5  +     -0.2496279400943 * G_MS_SubClass6
          +     0.32435333525762 * G_MS_SubClass7  +     0.02520603484985 * 
        G_Neighborhood0  +    -0.01782229921021 * G_Neighborhood1
          +     0.05107855318684 * G_Neighborhood2  +     0.03412864848702 * 
        G_Neighborhood3  +     0.07695253855528 * G_Neighborhood4
          +    -0.07067676805543 * G_Neighborhood5  +     -0.0975889806372 * 
        G_Neighborhood6  +     0.30785265190514 * G_Neighborhood7
          +     0.04709550750385 * G_Neighborhood8  +    -0.02761265535534 * 
        G_Neighborhood9  +    -0.10046532251561 * G_Neighborhood10
          +    -0.04539789310696 * G_Neighborhood11  +    -0.01441757877253 * 
        G_Neighborhood12  +    -0.06752424490924 * G_Pool_QC0
          +     0.17335789921971 * G_Pool_QC1  +    -0.28558286012991 * 
        G_Roof_Matl0  +     -0.1119634922942 * G_Roof_Matl1
          +    -0.02025244135522 * G_Sale_Condition0
          +    -0.18302234765198 * G_Sale_Condition1
          +    -0.10856588069716 * G_Sale_Condition2
          +    -0.04100461737062 * G_Sale_Condition3
          +     -0.0635210290362 * Land_ContourBnk  +    -0.02087795053994 * 
        Land_ContourHLS  +     0.04611666702989 * Land_ContourLow ;
   H115  = H115  +     0.01419202855413 * Exter_QualEx
          +    -0.06760485189894 * Exter_QualFa  +     -0.2389307827347 * 
        Exter_QualGd  +     0.02539065647791 * G_Bldg_Type0
          +    -0.08533069773135 * G_Bldg_Type1  +    -0.13460442901142 * 
        G_Bldg_Type2  +     0.00405413222302 * G_Bsmt_Exposure0
          +     0.09312345467453 * G_Bsmt_Exposure1  +    -0.09180581917762 * 
        G_Bsmt_Exposure2  +    -0.00885075913997 * G_Bsmt_Exposure3
          +    -0.03891327816034 * G_Bsmt_Qual0  +    -0.11356589530245 * 
        G_Bsmt_Qual1  +    -0.18438163651924 * G_Bsmt_Qual2
          +    -0.00642677918502 * G_Condition_10  +    -0.03385027281983 * 
        G_Condition_11  +     0.00484067759954 * G_Condition_12
          +    -0.01205557936046 * G_Condition_13  +    -0.00941205917943 * 
        G_Condition_20  +    -0.11544285821205 * G_Condition_21
          +    -0.01264384036122 * G_Condition_22  +    -0.06264443875162 * 
        G_Exterior_1st0  +    -0.12165161591528 * G_Exterior_1st1
          +    -0.12310118685725 * G_Exterior_1st2  +     0.08286837982639 * 
        G_Exterior_1st3  +     0.00784762970572 * G_Exterior_1st4
          +     0.05531490924169 * G_Exterior_1st5  +    -0.13996313243879 * 
        G_Exterior_1st6  +    -0.02493145109805 * G_Exterior_1st7
          +    -0.00142213814228 * G_Functional0  +    -0.09995438893388 * 
        G_Functional1  +     0.04088914127351 * G_Functional2
          +     0.07392514044665 * G_Garage_Qual0  +    -0.06490377494552 * 
        G_Garage_Qual1  +    -0.13232289356118 * G_Garage_Qual2
          +    -0.04531124380473 * G_House_Style0  +    -0.03553580223603 * 
        G_House_Style1  +    -0.00847599698555 * G_House_Style2
          +     0.02701696486187 * G_House_Style3  +    -0.14730777221988 * 
        G_House_Style4  +    -0.17947864948086 * G_Kitchen_Qual0
          +    -0.05116445160801 * G_Kitchen_Qual1  +    -0.21890889136947 * 
        G_Kitchen_Qual2  +    -0.01508074083298 * G_MS_SubClass0
          +     0.22902755378383 * G_MS_SubClass1  +     0.03106046130593 * 
        G_MS_SubClass2  +      0.0085499473957 * G_MS_SubClass3
          +    -0.03389350982646 * G_MS_SubClass4  +    -0.32009144508412 * 
        G_MS_SubClass5  +     0.00054785338151 * G_MS_SubClass6
          +     0.12077882348214 * G_MS_SubClass7  +    -0.22658905072187 * 
        G_Neighborhood0  +    -0.44355132147801 * G_Neighborhood1
          +    -0.13630007636611 * G_Neighborhood2  +     0.06390253300341 * 
        G_Neighborhood3  +     0.07997820831592 * G_Neighborhood4
          +     0.10886258905976 * G_Neighborhood5  +     0.11073067836133 * 
        G_Neighborhood6  +    -0.09423586952549 * G_Neighborhood7
          +     0.02310079337532 * G_Neighborhood8  +     0.21523620940468 * 
        G_Neighborhood9  +     0.03637657678759 * G_Neighborhood10
          +     0.01544572125953 * G_Neighborhood11  +    -0.14294876826481 * 
        G_Neighborhood12  +    -0.00579796808982 * G_Pool_QC0
          +    -0.09934930536234 * G_Pool_QC1  +     0.16814443091394 * 
        G_Roof_Matl0  +      0.0715439463639 * G_Roof_Matl1
          +    -0.01780628010835 * G_Sale_Condition0
          +    -0.31593985591917 * G_Sale_Condition1
          +    -0.23334246100623 * G_Sale_Condition2
          +    -0.20713103235872 * G_Sale_Condition3
          +     0.26399632720838 * Land_ContourBnk  +      0.0687490671252 * 
        Land_ContourHLS  +    -0.03749402329643 * Land_ContourLow ;
   H116  = H116  +     0.06938954181542 * Exter_QualEx
          +     0.03412613819924 * Exter_QualFa  +    -0.07924451878882 * 
        Exter_QualGd  +    -0.16216867803991 * G_Bldg_Type0
          +    -0.11483300666556 * G_Bldg_Type1  +     0.04220651869171 * 
        G_Bldg_Type2  +     0.01433462985575 * G_Bsmt_Exposure0
          +    -0.19419993721266 * G_Bsmt_Exposure1  +    -0.17726318391648 * 
        G_Bsmt_Exposure2  +    -0.03576154312133 * G_Bsmt_Exposure3
          +      0.2068492340144 * G_Bsmt_Qual0  +    -0.11966791914279 * 
        G_Bsmt_Qual1  +    -0.05936457951337 * G_Bsmt_Qual2
          +     0.12435802501437 * G_Condition_10  +    -0.34310472993224 * 
        G_Condition_11  +     0.17867173888246 * G_Condition_12
          +     0.02368184274243 * G_Condition_13  +     -0.0456247269984 * 
        G_Condition_20  +    -0.05102225734345 * G_Condition_21
          +    -0.00353605499983 * G_Condition_22  +     -0.1149725173192 * 
        G_Exterior_1st0  +    -0.14955053107083 * G_Exterior_1st1
          +    -0.02355425107074 * G_Exterior_1st2  +    -0.28193068164656 * 
        G_Exterior_1st3  +    -0.18056329286363 * G_Exterior_1st4
          +     0.26497198045555 * G_Exterior_1st5  +    -0.03988547300921 * 
        G_Exterior_1st6  +     0.20653066309078 * G_Exterior_1st7
          +    -0.04936132158788 * G_Functional0  +      0.0335637522509 * 
        G_Functional1  +    -0.05383170987447 * G_Functional2
          +    -0.37007601704736 * G_Garage_Qual0  +    -0.05353484376871 * 
        G_Garage_Qual1  +    -0.32577643984346 * G_Garage_Qual2
          +     0.04310793129596 * G_House_Style0  +     0.08430415222082 * 
        G_House_Style1  +    -0.19949821999511 * G_House_Style2
          +    -0.01956797834647 * G_House_Style3  +      0.1267211059563 * 
        G_House_Style4  +    -0.16344724719572 * G_Kitchen_Qual0
          +    -0.12799421342597 * G_Kitchen_Qual1  +     -0.2800058633163 * 
        G_Kitchen_Qual2  +     0.11202815489825 * G_MS_SubClass0
          +     0.09068572470734 * G_MS_SubClass1  +    -0.03779659099364 * 
        G_MS_SubClass2  +    -0.03404468460712 * G_MS_SubClass3
          +     0.06862591292786 * G_MS_SubClass4  +     0.12586373550777 * 
        G_MS_SubClass5  +    -0.08633717413588 * G_MS_SubClass6
          +       0.011854217009 * G_MS_SubClass7  +     0.03809852430957 * 
        G_Neighborhood0  +     -0.0104197840827 * G_Neighborhood1
          +     0.10360711970845 * G_Neighborhood2  +    -0.16272972485642 * 
        G_Neighborhood3  +    -0.04884620246023 * G_Neighborhood4
          +      -0.002204046376 * G_Neighborhood5  +     0.00180660873601 * 
        G_Neighborhood6  +     0.05541527672919 * G_Neighborhood7
          +     0.03052113476356 * G_Neighborhood8  +     0.37483839591925 * 
        G_Neighborhood9  +     0.24523331264152 * G_Neighborhood10
          +    -0.13234598718894 * G_Neighborhood11  +     0.14584545354858 * 
        G_Neighborhood12  +    -0.10177240543327 * G_Pool_QC0
          +    -0.04306178378559 * G_Pool_QC1  +     0.05369567977961 * 
        G_Roof_Matl0  +     -0.0268653104794 * G_Roof_Matl1
          +    -0.06082861331621 * G_Sale_Condition0
          +    -0.17002673591059 * G_Sale_Condition1
          +      -0.132994072361 * G_Sale_Condition2
          +     0.20360597834702 * G_Sale_Condition3
          +    -0.02083864454559 * Land_ContourBnk  +     0.15034692425727 * 
        Land_ContourHLS  +     0.02902698967813 * Land_ContourLow ;
   H117  = H117  +     0.05581895520477 * Exter_QualEx
          +    -0.03732992205591 * Exter_QualFa  +    -0.07467808647482 * 
        Exter_QualGd  +     0.06391703441762 * G_Bldg_Type0
          +     0.12147978716374 * G_Bldg_Type1  +     0.04059646708645 * 
        G_Bldg_Type2  +    -0.01534578350911 * G_Bsmt_Exposure0
          +     0.01506340087488 * G_Bsmt_Exposure1  +     0.00832992889945 * 
        G_Bsmt_Exposure2  +    -0.23174567999477 * G_Bsmt_Exposure3
          +    -0.07325373617829 * G_Bsmt_Qual0  +     0.04483619737566 * 
        G_Bsmt_Qual1  +    -0.09829761430221 * G_Bsmt_Qual2
          +    -0.01349041712447 * G_Condition_10  +    -0.10214653413068 * 
        G_Condition_11  +     0.08717746139378 * G_Condition_12
          +     -0.0240144325313 * G_Condition_13  +    -0.02059301374479 * 
        G_Condition_20  +     0.07427481575255 * G_Condition_21
          +    -0.11339127647192 * G_Condition_22  +     0.02325302742859 * 
        G_Exterior_1st0  +    -0.19776297451494 * G_Exterior_1st1
          +     0.04906372160067 * G_Exterior_1st2  +     0.11846886742179 * 
        G_Exterior_1st3  +     0.00762182553655 * G_Exterior_1st4
          +    -0.06695723089024 * G_Exterior_1st5  +    -0.01715026561568 * 
        G_Exterior_1st6  +     0.09891575344036 * G_Exterior_1st7
          +    -0.12113495816367 * G_Functional0  +     0.08518907625152 * 
        G_Functional1  +     0.03086365972594 * G_Functional2
          +    -0.03371623482759 * G_Garage_Qual0  +    -0.07067098344378 * 
        G_Garage_Qual1  +    -0.12626807003488 * G_Garage_Qual2
          +     0.03578378218361 * G_House_Style0  +    -0.00022716254334 * 
        G_House_Style1  +    -0.00142368566021 * G_House_Style2
          +     0.01545782112467 * G_House_Style3  +     0.14947318412346 * 
        G_House_Style4  +     0.06886299640321 * G_Kitchen_Qual0
          +     0.27900933054288 * G_Kitchen_Qual1  +     0.17246075802338 * 
        G_Kitchen_Qual2  +     0.03142946283252 * G_MS_SubClass0
          +     0.04800296099563 * G_MS_SubClass1  +    -0.02152749225639 * 
        G_MS_SubClass2  +    -0.02707935161902 * G_MS_SubClass3
          +    -0.00043044537647 * G_MS_SubClass4  +     0.08601138474903 * 
        G_MS_SubClass5  +     0.06515301041642 * G_MS_SubClass6
          +    -0.17701204451573 * G_MS_SubClass7  +     -0.0780894780923 * 
        G_Neighborhood0  +    -0.10191187269205 * G_Neighborhood1
          +     0.01949674493032 * G_Neighborhood2  +    -0.26091928543901 * 
        G_Neighborhood3  +    -0.20936605640032 * G_Neighborhood4
          +    -0.25889491210316 * G_Neighborhood5  +    -0.13628555670136 * 
        G_Neighborhood6  +    -0.10976145216696 * G_Neighborhood7
          +    -0.05906037830985 * G_Neighborhood8  +    -0.20459419878779 * 
        G_Neighborhood9  +    -0.02974281882184 * G_Neighborhood10
          +     0.06957810707704 * G_Neighborhood11  +    -0.01281765678157 * 
        G_Neighborhood12  +     0.11260694485175 * G_Pool_QC0
          +    -0.24976541723108 * G_Pool_QC1  +     0.00433903814683 * 
        G_Roof_Matl0  +    -0.22645414136165 * G_Roof_Matl1
          +     -0.0192478155494 * G_Sale_Condition0
          +    -0.03772994171648 * G_Sale_Condition1
          +     0.04602891668949 * G_Sale_Condition2
          +    -0.09045750200523 * G_Sale_Condition3
          +    -0.22388990191537 * Land_ContourBnk  +    -0.00558596069339 * 
        Land_ContourHLS  +     0.16972136251254 * Land_ContourLow ;
   H118  = H118  +    -0.19992651693434 * Exter_QualEx
          +     0.14087239230745 * Exter_QualFa  +    -0.17353382640431 * 
        Exter_QualGd  +     0.21686283682153 * G_Bldg_Type0
          +    -0.03528631722535 * G_Bldg_Type1  +     -0.0218213352102 * 
        G_Bldg_Type2  +      0.0551505536056 * G_Bsmt_Exposure0
          +    -0.13695032053944 * G_Bsmt_Exposure1  +    -0.03649653376147 * 
        G_Bsmt_Exposure2  +     0.16537201219902 * G_Bsmt_Exposure3
          +     0.05595028492474 * G_Bsmt_Qual0  +     0.06774209417597 * 
        G_Bsmt_Qual1  +     0.04455608834262 * G_Bsmt_Qual2
          +     0.15937570771686 * G_Condition_10  +     0.19853013884836 * 
        G_Condition_11  +    -0.03392285147258 * G_Condition_12
          +     -0.0260079886151 * G_Condition_13  +     -0.0255116614846 * 
        G_Condition_20  +     0.03981084514843 * G_Condition_21
          +    -0.05037382625039 * G_Condition_22  +     0.18739669767848 * 
        G_Exterior_1st0  +    -0.15105591722147 * G_Exterior_1st1
          +     0.18579345391042 * G_Exterior_1st2  +     0.03071001302267 * 
        G_Exterior_1st3  +    -0.06970039325468 * G_Exterior_1st4
          +     0.09286135079764 * G_Exterior_1st5  +    -0.04327653984398 * 
        G_Exterior_1st6  +      0.1101715314819 * G_Exterior_1st7
          +     0.14890031255712 * G_Functional0  +     0.07570934369142 * 
        G_Functional1  +     0.00512607469805 * G_Functional2
          +     0.13752506220681 * G_Garage_Qual0  +     0.13424827220341 * 
        G_Garage_Qual1  +    -0.11805175254272 * G_Garage_Qual2
          +     0.03426051769149 * G_House_Style0  +    -0.14823957023865 * 
        G_House_Style1  +      0.0820233597339 * G_House_Style2
          +    -0.00318147643609 * G_House_Style3  +     0.03037361433944 * 
        G_House_Style4  +    -0.04328008168328 * G_Kitchen_Qual0
          +     0.03248263112029 * G_Kitchen_Qual1  +     0.06311785544707 * 
        G_Kitchen_Qual2  +    -0.00430986768197 * G_MS_SubClass0
          +    -0.05327701333072 * G_MS_SubClass1  +     0.02065688346913 * 
        G_MS_SubClass2  +    -0.05543365875262 * G_MS_SubClass3
          +     -0.0469507947121 * G_MS_SubClass4  +    -0.12922701110973 * 
        G_MS_SubClass5  +     0.03271390222417 * G_MS_SubClass6
          +     0.03773602645529 * G_MS_SubClass7  +    -0.08056405286993 * 
        G_Neighborhood0  +    -0.00875017165149 * G_Neighborhood1
          +     0.03648069580008 * G_Neighborhood2  +     0.07013469437613 * 
        G_Neighborhood3  +     0.07606829412918 * G_Neighborhood4
          +    -0.11637877213263 * G_Neighborhood5  +    -0.00065278671264 * 
        G_Neighborhood6  +    -0.02269587398941 * G_Neighborhood7
          +     0.06898910409976 * G_Neighborhood8  +     0.08623093814668 * 
        G_Neighborhood9  +     0.19045303392198 * G_Neighborhood10
          +    -0.08544460460509 * G_Neighborhood11  +     -0.1311977325491 * 
        G_Neighborhood12  +    -0.02260696986104 * G_Pool_QC0
          +     0.04675285084829 * G_Pool_QC1  +     0.29873905286949 * 
        G_Roof_Matl0  +    -0.21427890033479 * G_Roof_Matl1
          +     0.02781998579779 * G_Sale_Condition0
          +    -0.07781195020838 * G_Sale_Condition1
          +     0.16591589748481 * G_Sale_Condition2
          +    -0.08712688196794 * G_Sale_Condition3
          +     0.08737869052851 * Land_ContourBnk  +     -0.1475539893561 * 
        Land_ContourHLS  +    -0.02062614036228 * Land_ContourLow ;
   H119  = H119  +    -0.10232253847522 * Exter_QualEx
          +     0.16616375092588 * Exter_QualFa  +      -0.063596451415 * 
        Exter_QualGd  +    -0.17593166432155 * G_Bldg_Type0
          +     0.04537850885005 * G_Bldg_Type1  +     0.08382838542555 * 
        G_Bldg_Type2  +     0.03378009279873 * G_Bsmt_Exposure0
          +    -0.04337388890529 * G_Bsmt_Exposure1  +     0.12589236136075 * 
        G_Bsmt_Exposure2  +    -0.02861194020619 * G_Bsmt_Exposure3
          +    -0.10735697861136 * G_Bsmt_Qual0  +     0.32738592815494 * 
        G_Bsmt_Qual1  +    -0.06567970014508 * G_Bsmt_Qual2
          +     0.17341757885926 * G_Condition_10  +     0.03393019122652 * 
        G_Condition_11  +      0.0271088601688 * G_Condition_12
          +     0.11712223823526 * G_Condition_13  +    -0.05024243610711 * 
        G_Condition_20  +     0.06032209391822 * G_Condition_21
          +     0.03460875080829 * G_Condition_22  +    -0.00968645239089 * 
        G_Exterior_1st0  +    -0.06407123532828 * G_Exterior_1st1
          +    -0.07640778571308 * G_Exterior_1st2  +     0.09429107708487 * 
        G_Exterior_1st3  +     0.07754458983319 * G_Exterior_1st4
          +     0.08717616309485 * G_Exterior_1st5  +    -0.08643306407513 * 
        G_Exterior_1st6  +     0.05493793628535 * G_Exterior_1st7
          +      0.0779685758326 * G_Functional0  +     0.01472538452761 * 
        G_Functional1  +     0.23185740830184 * G_Functional2
          +    -0.05135191088594 * G_Garage_Qual0  +    -0.15448597774352 * 
        G_Garage_Qual1  +     0.11281999026942 * G_Garage_Qual2
          +     0.05602524846707 * G_House_Style0  +    -0.03949210255373 * 
        G_House_Style1  +     0.16904762431854 * G_House_Style2
          +     0.06861413322267 * G_House_Style3  +     0.06703724714384 * 
        G_House_Style4  +     0.03131462713333 * G_Kitchen_Qual0
          +     0.16564927520514 * G_Kitchen_Qual1  +    -0.03783905237716 * 
        G_Kitchen_Qual2  +    -0.10796750774029 * G_MS_SubClass0
          +     0.04612790857723 * G_MS_SubClass1  +    -0.25565041865062 * 
        G_MS_SubClass2  +      0.1384070288272 * G_MS_SubClass3
          +     -0.0896901829872 * G_MS_SubClass4  +     0.20163078625381 * 
        G_MS_SubClass5  +     0.01718737279382 * G_MS_SubClass6
          +    -0.11797360315329 * G_MS_SubClass7  +     0.16869593293699 * 
        G_Neighborhood0  +     0.05050826550401 * G_Neighborhood1
          +    -0.11994321862625 * G_Neighborhood2  +     0.00899722973355 * 
        G_Neighborhood3  +      -0.047631639149 * G_Neighborhood4
          +    -0.23129073389534 * G_Neighborhood5  +     0.30752970814741 * 
        G_Neighborhood6  +    -0.06326775632961 * G_Neighborhood7
          +    -0.17310296950844 * G_Neighborhood8  +     0.02193590963994 * 
        G_Neighborhood9  +    -0.21331116679263 * G_Neighborhood10
          +     0.08234636068882 * G_Neighborhood11  +    -0.00472628003168 * 
        G_Neighborhood12  +    -0.04039598954246 * G_Pool_QC0
          +    -0.13975137523255 * G_Pool_QC1  +     0.02539112637155 * 
        G_Roof_Matl0  +     0.10427901394897 * G_Roof_Matl1
          +     0.34072408378735 * G_Sale_Condition0
          +     0.23053220074387 * G_Sale_Condition1
          +    -0.10095670522295 * G_Sale_Condition2
          +     0.03977337788313 * G_Sale_Condition3
          +      0.0104958230315 * Land_ContourBnk  +    -0.18038872268453 * 
        Land_ContourHLS  +     0.12782469087008 * Land_ContourLow ;
   H120  = H120  +     0.10638451394451 * Exter_QualEx
          +     0.22355959806094 * Exter_QualFa  +    -0.14559627569657 * 
        Exter_QualGd  +     0.01550122412248 * G_Bldg_Type0
          +    -0.06831511282515 * G_Bldg_Type1  +    -0.04654302748684 * 
        G_Bldg_Type2  +    -0.21111115528256 * G_Bsmt_Exposure0
          +     0.33928156465817 * G_Bsmt_Exposure1  +     0.18535852598709 * 
        G_Bsmt_Exposure2  +     0.10511841600945 * G_Bsmt_Exposure3
          +     0.08004285996193 * G_Bsmt_Qual0  +       0.125240899307 * 
        G_Bsmt_Qual1  +      0.0474439075832 * G_Bsmt_Qual2
          +    -0.14745457025583 * G_Condition_10  +      0.0360010649969 * 
        G_Condition_11  +     0.10562605116897 * G_Condition_12
          +     0.08409523621421 * G_Condition_13  +    -0.13373427523308 * 
        G_Condition_20  +     0.01159395871741 * G_Condition_21
          +    -0.09030482155245 * G_Condition_22  +      0.0887882487173 * 
        G_Exterior_1st0  +     0.12364290436908 * G_Exterior_1st1
          +     0.09631858724496 * G_Exterior_1st2  +    -0.05292151521716 * 
        G_Exterior_1st3  +     0.21326527811429 * G_Exterior_1st4
          +     0.03366945017812 * G_Exterior_1st5  +    -0.08641887995903 * 
        G_Exterior_1st6  +     0.12302909352377 * G_Exterior_1st7
          +    -0.08335666216484 * G_Functional0  +    -0.01832464293867 * 
        G_Functional1  +    -0.07211131630653 * G_Functional2
          +     0.02359472181638 * G_Garage_Qual0  +    -0.00173990456378 * 
        G_Garage_Qual1  +     0.26025818602398 * G_Garage_Qual2
          +     0.25639454535001 * G_House_Style0  +    -0.16126099905619 * 
        G_House_Style1  +    -0.10762086411947 * G_House_Style2
          +      0.1991263511974 * G_House_Style3  +     0.12246216661961 * 
        G_House_Style4  +    -0.17423521716118 * G_Kitchen_Qual0
          +     0.13760429963201 * G_Kitchen_Qual1  +    -0.21017720183942 * 
        G_Kitchen_Qual2  +     0.08733937741571 * G_MS_SubClass0
          +    -0.02060787509862 * G_MS_SubClass1  +     0.05534054923438 * 
        G_MS_SubClass2  +     0.20220470829022 * G_MS_SubClass3
          +     0.08877693643757 * G_MS_SubClass4  +     0.02387383593947 * 
        G_MS_SubClass5  +     -0.2621476839629 * G_MS_SubClass6
          +    -0.16876125778224 * G_MS_SubClass7  +    -0.27643766620661 * 
        G_Neighborhood0  +    -0.04222255034411 * G_Neighborhood1
          +     0.10872321571998 * G_Neighborhood2  +     0.21669434655992 * 
        G_Neighborhood3  +    -0.00806564320033 * G_Neighborhood4
          +    -0.04306929265988 * G_Neighborhood5  +     0.08093889775275 * 
        G_Neighborhood6  +     0.04428056790668 * G_Neighborhood7
          +    -0.06475913738733 * G_Neighborhood8  +     0.30556991990123 * 
        G_Neighborhood9  +     0.27542070717653 * G_Neighborhood10
          +     0.37919298175547 * G_Neighborhood11  +     0.24746069825635 * 
        G_Neighborhood12  +    -0.09819989669044 * G_Pool_QC0
          +    -0.13160634055894 * G_Pool_QC1  +    -0.17886135464403 * 
        G_Roof_Matl0  +    -0.11602916908084 * G_Roof_Matl1
          +     0.04577143249033 * G_Sale_Condition0
          +    -0.09646848800467 * G_Sale_Condition1
          +     0.04920004529739 * G_Sale_Condition2
          +    -0.08131140778544 * G_Sale_Condition3
          +      0.1448697055443 * Land_ContourBnk  +    -0.05563979820375 * 
        Land_ContourHLS  +     0.03825874013399 * Land_ContourLow ;
   H121  = H121  +     0.17509986385211 * Exter_QualEx
          +     0.11579441910548 * Exter_QualFa  +    -0.00071195993027 * 
        Exter_QualGd  +    -0.11214538695013 * G_Bldg_Type0
          +      0.1507811750014 * G_Bldg_Type1  +    -0.06930103048961 * 
        G_Bldg_Type2  +     0.08659616101701 * G_Bsmt_Exposure0
          +     0.10654157531825 * G_Bsmt_Exposure1  +     0.17225226875591 * 
        G_Bsmt_Exposure2  +     0.02185089890765 * G_Bsmt_Exposure3
          +    -0.14592917435525 * G_Bsmt_Qual0  +     0.01861411508325 * 
        G_Bsmt_Qual1  +     0.01042648810738 * G_Bsmt_Qual2
          +     0.02583644406425 * G_Condition_10  +     -0.0042843153442 * 
        G_Condition_11  +     0.18300521115658 * G_Condition_12
          +     0.14951827508259 * G_Condition_13  +    -0.10214201798024 * 
        G_Condition_20  +     0.02254655669748 * G_Condition_21
          +     0.02278722411646 * G_Condition_22  +    -0.08698438839206 * 
        G_Exterior_1st0  +    -0.22527646817308 * G_Exterior_1st1
          +     0.13819503534725 * G_Exterior_1st2  +     0.00118759662836 * 
        G_Exterior_1st3  +     0.11377326219698 * G_Exterior_1st4
          +     0.01499964650225 * G_Exterior_1st5  +    -0.09987821009963 * 
        G_Exterior_1st6  +    -0.21530981662777 * G_Exterior_1st7
          +    -0.04605227558921 * G_Functional0  +    -0.26740955942431 * 
        G_Functional1  +    -0.03554541287407 * G_Functional2
          +     0.02912797519036 * G_Garage_Qual0  +    -0.19779110139079 * 
        G_Garage_Qual1  +    -0.15343938422348 * G_Garage_Qual2
          +    -0.08924634143355 * G_House_Style0  +     0.03932149596779 * 
        G_House_Style1  +    -0.09311210651823 * G_House_Style2
          +    -0.04735662777312 * G_House_Style3  +     0.14538430703516 * 
        G_House_Style4  +    -0.00967272340975 * G_Kitchen_Qual0
          +    -0.08105888218674 * G_Kitchen_Qual1  +    -0.03469013983101 * 
        G_Kitchen_Qual2  +    -0.03604287100059 * G_MS_SubClass0
          +     0.20357767359901 * G_MS_SubClass1  +    -0.16788811343697 * 
        G_MS_SubClass2  +     -0.2063637420352 * G_MS_SubClass3
          +     0.18325937730696 * G_MS_SubClass4  +    -0.04712507801223 * 
        G_MS_SubClass5  +    -0.01574969218404 * G_MS_SubClass6
          +    -0.02504535972135 * G_MS_SubClass7  +     0.01234831790026 * 
        G_Neighborhood0  +     -0.1721067277595 * G_Neighborhood1
          +     -0.1734291199922 * G_Neighborhood2  +    -0.10159387913081 * 
        G_Neighborhood3  +    -0.09986949434897 * G_Neighborhood4
          +    -0.26170145071049 * G_Neighborhood5  +     -0.0510936843052 * 
        G_Neighborhood6  +      0.0340004405849 * G_Neighborhood7
          +    -0.04745272017844 * G_Neighborhood8  +    -0.05363243819661 * 
        G_Neighborhood9  +     0.07078076293098 * G_Neighborhood10
          +    -0.03221710022439 * G_Neighborhood11  +    -0.07648035422816 * 
        G_Neighborhood12  +    -0.04008502199151 * G_Pool_QC0
          +    -0.06442576505046 * G_Pool_QC1  +    -0.12341835036713 * 
        G_Roof_Matl0  +     0.16323237657768 * G_Roof_Matl1
          +    -0.01578291996579 * G_Sale_Condition0
          +     0.06026922647702 * G_Sale_Condition1
          +     0.07339615751571 * G_Sale_Condition2
          +    -0.11498020396688 * G_Sale_Condition3
          +    -0.01855478669658 * Land_ContourBnk  +     0.06860707783453 * 
        Land_ContourHLS  +    -0.00222067106929 * Land_ContourLow ;
   H122  = H122  +     0.06765022949843 * Exter_QualEx
          +    -0.16200978717979 * Exter_QualFa  +     0.00279332407399 * 
        Exter_QualGd  +     -0.0787187790585 * G_Bldg_Type0
          +     -0.0756659516072 * G_Bldg_Type1  +     0.00315895033952 * 
        G_Bldg_Type2  +     0.14842820542137 * G_Bsmt_Exposure0
          +    -0.23088264840497 * G_Bsmt_Exposure1  +    -0.11127137061692 * 
        G_Bsmt_Exposure2  +    -0.09363617945591 * G_Bsmt_Exposure3
          +     0.06121807620434 * G_Bsmt_Qual0  +     0.02793923655413 * 
        G_Bsmt_Qual1  +    -0.04091373964881 * G_Bsmt_Qual2
          +    -0.11065943375088 * G_Condition_10  +    -0.03664960114436 * 
        G_Condition_11  +    -0.21200614948876 * G_Condition_12
          +     0.11311229107038 * G_Condition_13  +    -0.16796277121096 * 
        G_Condition_20  +     -0.2068948418823 * G_Condition_21
          +    -0.02821007450618 * G_Condition_22  +     0.04694765952927 * 
        G_Exterior_1st0  +    -0.00824839064784 * G_Exterior_1st1
          +      0.1581023507516 * G_Exterior_1st2  +    -0.03779755356929 * 
        G_Exterior_1st3  +     0.02216645832401 * G_Exterior_1st4
          +    -0.02216857222037 * G_Exterior_1st5  +    -0.03372795062784 * 
        G_Exterior_1st6  +     0.14291429626841 * G_Exterior_1st7
          +     0.15470183464111 * G_Functional0  +     0.12058768188487 * 
        G_Functional1  +     0.05443581374203 * G_Functional2
          +     0.12553029777614 * G_Garage_Qual0  +    -0.07918902504569 * 
        G_Garage_Qual1  +    -0.04491868614437 * G_Garage_Qual2
          +     0.02584617354022 * G_House_Style0  +    -0.10241826078923 * 
        G_House_Style1  +    -0.05304198213008 * G_House_Style2
          +    -0.06794170911518 * G_House_Style3  +    -0.07506885542492 * 
        G_House_Style4  +     0.04123919258531 * G_Kitchen_Qual0
          +     0.01151873914625 * G_Kitchen_Qual1  +    -0.13352858404942 * 
        G_Kitchen_Qual2  +    -0.11440460493807 * G_MS_SubClass0
          +    -0.00099970421907 * G_MS_SubClass1  +     0.07681620658723 * 
        G_MS_SubClass2  +    -0.13082852967667 * G_MS_SubClass3
          +    -0.00478134254697 * G_MS_SubClass4  +     0.03232263859679 * 
        G_MS_SubClass5  +    -0.26714150628896 * G_MS_SubClass6
          +    -0.01146697670115 * G_MS_SubClass7  +     0.14531806388204 * 
        G_Neighborhood0  +     0.03862814554455 * G_Neighborhood1
          +     0.15347056275113 * G_Neighborhood2  +     0.05096634728153 * 
        G_Neighborhood3  +     0.06627173567943 * G_Neighborhood4
          +     0.13600028863255 * G_Neighborhood5  +     0.00473033833052 * 
        G_Neighborhood6  +     0.10680067780506 * G_Neighborhood7
          +      0.0856658751335 * G_Neighborhood8  +     0.14496175367074 * 
        G_Neighborhood9  +     0.06559407093411 * G_Neighborhood10
          +      0.0451438830116 * G_Neighborhood11  +     0.12623786223119 * 
        G_Neighborhood12  +    -0.05912261486159 * G_Pool_QC0
          +      0.0995095357278 * G_Pool_QC1  +    -0.07861655576481 * 
        G_Roof_Matl0  +     0.12063695544468 * G_Roof_Matl1
          +    -0.09303650459918 * G_Sale_Condition0
          +    -0.05533199549633 * G_Sale_Condition1
          +    -0.06802332182784 * G_Sale_Condition2
          +    -0.29812806074338 * G_Sale_Condition3
          +     0.41375026619318 * Land_ContourBnk  +     0.32797719147845 * 
        Land_ContourHLS  +     0.05665981057693 * Land_ContourLow ;
   H123  = H123  +     0.03143248952684 * Exter_QualEx
          +     0.01045115651262 * Exter_QualFa  +     0.13364910485264 * 
        Exter_QualGd  +      -0.256424318119 * G_Bldg_Type0
          +    -0.13807140150175 * G_Bldg_Type1  +     -0.1525838325701 * 
        G_Bldg_Type2  +     0.02874190909204 * G_Bsmt_Exposure0
          +    -0.04728255287968 * G_Bsmt_Exposure1  +    -0.01349821678009 * 
        G_Bsmt_Exposure2  +    -0.01770334499132 * G_Bsmt_Exposure3
          +     0.11677846120965 * G_Bsmt_Qual0  +     0.01691887135511 * 
        G_Bsmt_Qual1  +     -0.0258472717283 * G_Bsmt_Qual2
          +     0.02154861470086 * G_Condition_10  +    -0.03747766124867 * 
        G_Condition_11  +     0.03992552448142 * G_Condition_12
          +    -0.03041629930401 * G_Condition_13  +     0.03707743490742 * 
        G_Condition_20  +    -0.09062331127894 * G_Condition_21
          +     0.01182526386527 * G_Condition_22  +     0.03607388402108 * 
        G_Exterior_1st0  +     0.18452757059147 * G_Exterior_1st1
          +     0.09312713562214 * G_Exterior_1st2  +    -0.00731648766733 * 
        G_Exterior_1st3  +     0.05002606139454 * G_Exterior_1st4
          +     0.26528092720195 * G_Exterior_1st5  +    -0.00315358263946 * 
        G_Exterior_1st6  +     0.18263320131805 * G_Exterior_1st7
          +     0.13608654152849 * G_Functional0  +    -0.03161202689952 * 
        G_Functional1  +     0.02853136013311 * G_Functional2
          +     0.09601545574347 * G_Garage_Qual0  +     0.11034153609686 * 
        G_Garage_Qual1  +     0.00658673717344 * G_Garage_Qual2
          +     0.05500965429922 * G_House_Style0  +     0.12211771982409 * 
        G_House_Style1  +    -0.06551319173085 * G_House_Style2
          +    -0.12797195437736 * G_House_Style3  +     0.07259095825531 * 
        G_House_Style4  +    -0.03617892296403 * G_Kitchen_Qual0
          +    -0.11560448009174 * G_Kitchen_Qual1  +     0.36407352369445 * 
        G_Kitchen_Qual2  +     0.14015077309059 * G_MS_SubClass0
          +     0.11896467706129 * G_MS_SubClass1  +    -0.00171809544062 * 
        G_MS_SubClass2  +    -0.21347594863764 * G_MS_SubClass3
          +     0.10931392185279 * G_MS_SubClass4  +     -0.0716907542942 * 
        G_MS_SubClass5  +     -0.0488586388907 * G_MS_SubClass6
          +     0.11198524324442 * G_MS_SubClass7  +    -0.06573157784611 * 
        G_Neighborhood0  +     0.19236792172862 * G_Neighborhood1
          +     0.21776209300014 * G_Neighborhood2  +    -0.11055399822379 * 
        G_Neighborhood3  +    -0.19566705478302 * G_Neighborhood4
          +    -0.02417265296316 * G_Neighborhood5  +     0.03988032835144 * 
        G_Neighborhood6  +    -0.31523888815869 * G_Neighborhood7
          +     0.00699108370374 * G_Neighborhood8  +     0.12052598560075 * 
        G_Neighborhood9  +     0.35870166424914 * G_Neighborhood10
          +    -0.08274909754724 * G_Neighborhood11  +      0.0715557682328 * 
        G_Neighborhood12  +    -0.09771851136551 * G_Pool_QC0
          +     0.02037011057275 * G_Pool_QC1  +     0.02459161515713 * 
        G_Roof_Matl0  +    -0.09273723634786 * G_Roof_Matl1
          +    -0.12273986915427 * G_Sale_Condition0
          +    -0.18810753530091 * G_Sale_Condition1
          +     0.09566391650095 * G_Sale_Condition2
          +     0.21928440956328 * G_Sale_Condition3
          +      0.1508166681528 * Land_ContourBnk  +     0.29447356044263 * 
        Land_ContourHLS  +     0.12815727069154 * Land_ContourLow ;
   H124  = H124  +      0.0066834578224 * Exter_QualEx
          +     0.07740559428815 * Exter_QualFa  +      0.0213020581744 * 
        Exter_QualGd  +     0.19306271371542 * G_Bldg_Type0
          +    -0.06878197963129 * G_Bldg_Type1  +     0.09160799799676 * 
        G_Bldg_Type2  +    -0.09352818301554 * G_Bsmt_Exposure0
          +     -0.2292302678458 * G_Bsmt_Exposure1  +     0.26872032423371 * 
        G_Bsmt_Exposure2  +    -0.06503757127348 * G_Bsmt_Exposure3
          +    -0.02023917082254 * G_Bsmt_Qual0  +    -0.12590507631077 * 
        G_Bsmt_Qual1  +      -0.023033149425 * G_Bsmt_Qual2
          +     0.09383358595587 * G_Condition_10  +     0.14759656771863 * 
        G_Condition_11  +     0.07706412989983 * G_Condition_12
          +     0.16181576178099 * G_Condition_13  +     0.06647290544757 * 
        G_Condition_20  +     0.10034685375118 * G_Condition_21
          +    -0.08579105677424 * G_Condition_22  +     0.01814990979516 * 
        G_Exterior_1st0  +    -0.01789791097212 * G_Exterior_1st1
          +     0.00085127006588 * G_Exterior_1st2  +     0.11239595406533 * 
        G_Exterior_1st3  +    -0.06288505337867 * G_Exterior_1st4
          +    -0.09024621149453 * G_Exterior_1st5  +     0.13125624845878 * 
        G_Exterior_1st6  +     0.15460523617795 * G_Exterior_1st7
          +     0.13368217186557 * G_Functional0  +     0.13833208083407 * 
        G_Functional1  +     0.10281414651298 * G_Functional2
          +     0.21774709325317 * G_Garage_Qual0  +     0.06843786892715 * 
        G_Garage_Qual1  +    -0.15625030724419 * G_Garage_Qual2
          +     0.00940042806208 * G_House_Style0  +    -0.01876245554979 * 
        G_House_Style1  +      0.0537174439457 * G_House_Style2
          +     0.15083499300981 * G_House_Style3  +     0.02170611995573 * 
        G_House_Style4  +    -0.00050826484836 * G_Kitchen_Qual0
          +    -0.07365303842875 * G_Kitchen_Qual1  +    -0.20281829460298 * 
        G_Kitchen_Qual2  +    -0.14365374495882 * G_MS_SubClass0
          +    -0.04047023797375 * G_MS_SubClass1  +    -0.16140376263683 * 
        G_MS_SubClass2  +     0.03098696764073 * G_MS_SubClass3
          +     0.05822646064753 * G_MS_SubClass4  +    -0.07253043385709 * 
        G_MS_SubClass5  +    -0.01603993094348 * G_MS_SubClass6
          +     -0.0499642472294 * G_MS_SubClass7  +    -0.23278697305355 * 
        G_Neighborhood0  +    -0.28165818778383 * G_Neighborhood1
          +    -0.43913034215534 * G_Neighborhood2  +    -0.09976487642753 * 
        G_Neighborhood3  +    -0.16775460526666 * G_Neighborhood4
          +    -0.12032037124191 * G_Neighborhood5  +    -0.05249649560852 * 
        G_Neighborhood6  +      0.0900884826138 * G_Neighborhood7
          +     0.02449206318314 * G_Neighborhood8  +     0.08948003361858 * 
        G_Neighborhood9  +    -0.07095902499622 * G_Neighborhood10
          +    -0.19237465469522 * G_Neighborhood11  +     0.15959213074452 * 
        G_Neighborhood12  +     -0.3796632134258 * G_Pool_QC0
          +    -0.27064963202903 * G_Pool_QC1  +    -0.24202918695742 * 
        G_Roof_Matl0  +    -0.06202287882779 * G_Roof_Matl1
          +     0.24023521743283 * G_Sale_Condition0
          +    -0.01529388106735 * G_Sale_Condition1
          +     0.00017961734298 * G_Sale_Condition2
          +      -0.222545323075 * G_Sale_Condition3
          +    -0.27142941485405 * Land_ContourBnk  +    -0.12933069891588 * 
        Land_ContourHLS  +     0.00634638392404 * Land_ContourLow ;
   H125  = H125  +     0.16195978246665 * Exter_QualEx
          +     0.27604917072965 * Exter_QualFa  +    -0.02157457763336 * 
        Exter_QualGd  +    -0.09805778967046 * G_Bldg_Type0
          +      0.1171910155281 * G_Bldg_Type1  +    -0.03780240133567 * 
        G_Bldg_Type2  +     0.10277711132204 * G_Bsmt_Exposure0
          +    -0.32638684060626 * G_Bsmt_Exposure1  +     -0.2060011554023 * 
        G_Bsmt_Exposure2  +     0.11647397311276 * G_Bsmt_Exposure3
          +     0.02789676891528 * G_Bsmt_Qual0  +     0.08815510574029 * 
        G_Bsmt_Qual1  +    -0.08034669651038 * G_Bsmt_Qual2
          +    -0.17540114293669 * G_Condition_10  +    -0.07374609517275 * 
        G_Condition_11  +    -0.02934249768806 * G_Condition_12
          +    -0.25356940671123 * G_Condition_13  +     0.10120698869173 * 
        G_Condition_20  +     0.00624840407203 * G_Condition_21
          +     0.22036410316006 * G_Condition_22  +    -0.00921099041654 * 
        G_Exterior_1st0  +     -0.1455412300956 * G_Exterior_1st1
          +     0.06468965674109 * G_Exterior_1st2  +    -0.01617412113305 * 
        G_Exterior_1st3  +     0.00098131574935 * G_Exterior_1st4
          +    -0.07526541210544 * G_Exterior_1st5  +    -0.04636130171641 * 
        G_Exterior_1st6  +     0.18806586441759 * G_Exterior_1st7
          +     0.06203511000557 * G_Functional0  +     0.03277111240934 * 
        G_Functional1  +     -0.2433446923122 * G_Functional2
          +     0.22272440148948 * G_Garage_Qual0  +    -0.07064860374278 * 
        G_Garage_Qual1  +    -0.14425091995532 * G_Garage_Qual2
          +    -0.02167063207179 * G_House_Style0  +     -0.1430240077977 * 
        G_House_Style1  +      0.1241529022783 * G_House_Style2
          +     0.08577852326162 * G_House_Style3  +    -0.19806155762738 * 
        G_House_Style4  +    -0.04611934890899 * G_Kitchen_Qual0
          +     0.13921997604592 * G_Kitchen_Qual1  +    -0.02582798536082 * 
        G_Kitchen_Qual2  +     0.01510917394213 * G_MS_SubClass0
          +     0.05986892554566 * G_MS_SubClass1  +    -0.12313691872171 * 
        G_MS_SubClass2  +    -0.08084561397757 * G_MS_SubClass3
          +     -0.0072288006178 * G_MS_SubClass4  +     0.13472257724458 * 
        G_MS_SubClass5  +    -0.17846253211667 * G_MS_SubClass6
          +    -0.11427497207678 * G_MS_SubClass7  +     0.13811370887552 * 
        G_Neighborhood0  +      0.0292501739538 * G_Neighborhood1
          +     0.15578023921181 * G_Neighborhood2  +     0.06553829213681 * 
        G_Neighborhood3  +     0.03805705487417 * G_Neighborhood4
          +    -0.05813190060716 * G_Neighborhood5  +     0.03235779969278 * 
        G_Neighborhood6  +    -0.21515870781535 * G_Neighborhood7
          +     0.06888302581669 * G_Neighborhood8  +     -0.0763469928211 * 
        G_Neighborhood9  +    -0.04841455384226 * G_Neighborhood10
          +    -0.03546500321301 * G_Neighborhood11  +     0.08016672071108 * 
        G_Neighborhood12  +    -0.17796734248918 * G_Pool_QC0
          +     0.05719796619435 * G_Pool_QC1  +    -0.07570138792058 * 
        G_Roof_Matl0  +     0.03911066601202 * G_Roof_Matl1
          +    -0.10435129835801 * G_Sale_Condition0
          +    -0.08035446451316 * G_Sale_Condition1
          +     0.14952526273597 * G_Sale_Condition2
          +    -0.13007481908824 * G_Sale_Condition3
          +     0.09331028254077 * Land_ContourBnk  +     0.00210592406015 * 
        Land_ContourHLS  +     0.12872245883025 * Land_ContourLow ;
   H126  = H126  +    -0.02409264669228 * Exter_QualEx
          +     0.02907541112608 * Exter_QualFa  +     0.03784048375167 * 
        Exter_QualGd  +     0.02652373354675 * G_Bldg_Type0
          +     -0.1459567205076 * G_Bldg_Type1  +    -0.11813146092637 * 
        G_Bldg_Type2  +    -0.11589211918178 * G_Bsmt_Exposure0
          +     0.05952905687317 * G_Bsmt_Exposure1  +    -0.01535331701955 * 
        G_Bsmt_Exposure2  +    -0.11427398244076 * G_Bsmt_Exposure3
          +     0.12154978556025 * G_Bsmt_Qual0  +     0.05387716120303 * 
        G_Bsmt_Qual1  +     0.06030496809789 * G_Bsmt_Qual2
          +    -0.10086216999274 * G_Condition_10  +    -0.22579932774593 * 
        G_Condition_11  +    -0.05415347433688 * G_Condition_12
          +     0.05811494889041 * G_Condition_13  +     0.03096097127154 * 
        G_Condition_20  +    -0.15239675550394 * G_Condition_21
          +      0.1391263401976 * G_Condition_22  +    -0.06555431788826 * 
        G_Exterior_1st0  +    -0.08280654118325 * G_Exterior_1st1
          +    -0.13367847016844 * G_Exterior_1st2  +      0.0244209016886 * 
        G_Exterior_1st3  +     0.02685232307505 * G_Exterior_1st4
          +     0.04737678841871 * G_Exterior_1st5  +    -0.04512721954396 * 
        G_Exterior_1st6  +    -0.21331953083283 * G_Exterior_1st7
          +     0.03779979021683 * G_Functional0  +     0.00464298854134 * 
        G_Functional1  +     0.14474875127015 * G_Functional2
          +    -0.00743894353607 * G_Garage_Qual0  +       0.020628852387 * 
        G_Garage_Qual1  +     0.11082751704167 * G_Garage_Qual2
          +      0.1950956276982 * G_House_Style0  +     0.04609533860107 * 
        G_House_Style1  +     0.06967599677276 * G_House_Style2
          +    -0.02255938421122 * G_House_Style3  +    -0.14331967118045 * 
        G_House_Style4  +     0.06186262310417 * G_Kitchen_Qual0
          +     0.02263049952783 * G_Kitchen_Qual1  +     -0.0024156940015 * 
        G_Kitchen_Qual2  +     0.05502065103559 * G_MS_SubClass0
          +    -0.08072941774576 * G_MS_SubClass1  +    -0.02945976229913 * 
        G_MS_SubClass2  +     0.14450404336999 * G_MS_SubClass3
          +     0.12286486310847 * G_MS_SubClass4  +     0.02585900979856 * 
        G_MS_SubClass5  +      0.1294992397021 * G_MS_SubClass6
          +     0.10307469269342 * G_MS_SubClass7  +     -0.1223358508619 * 
        G_Neighborhood0  +     0.04363875486263 * G_Neighborhood1
          +    -0.09982637439202 * G_Neighborhood2  +    -0.10598197363801 * 
        G_Neighborhood3  +    -0.12830329554926 * G_Neighborhood4
          +    -0.04152219745173 * G_Neighborhood5  +    -0.00643677164726 * 
        G_Neighborhood6  +    -0.02597197612976 * G_Neighborhood7
          +    -0.11262672929775 * G_Neighborhood8  +     0.05404936361794 * 
        G_Neighborhood9  +     0.01260531621334 * G_Neighborhood10
          +     0.02935833869726 * G_Neighborhood11  +      0.0223123297677 * 
        G_Neighborhood12  +     0.05784832584082 * G_Pool_QC0
          +     0.15150597496003 * G_Pool_QC1  +      0.1181137312497 * 
        G_Roof_Matl0  +    -0.03361378396173 * G_Roof_Matl1
          +     0.00690393060661 * G_Sale_Condition0
          +     0.02762616373723 * G_Sale_Condition1
          +    -0.07288481254782 * G_Sale_Condition2
          +    -0.13888789712949 * G_Sale_Condition3
          +     0.37826065267447 * Land_ContourBnk  +    -0.07599699895587 * 
        Land_ContourHLS  +     0.09629855545125 * Land_ContourLow ;
   H127  = H127  +     0.17195475559134 * Exter_QualEx
          +    -0.07996574839911 * Exter_QualFa  +    -0.32662842350927 * 
        Exter_QualGd  +     0.19300828093436 * G_Bldg_Type0
          +    -0.10137898038465 * G_Bldg_Type1  +     0.24141699594928 * 
        G_Bldg_Type2  +     0.06242321923186 * G_Bsmt_Exposure0
          +     0.04313606387194 * G_Bsmt_Exposure1  +     0.17905234339415 * 
        G_Bsmt_Exposure2  +     0.18203802126354 * G_Bsmt_Exposure3
          +    -0.02488192851568 * G_Bsmt_Qual0  +     0.02308340401578 * 
        G_Bsmt_Qual1  +    -0.03688854695406 * G_Bsmt_Qual2
          +     0.00128999530533 * G_Condition_10  +       -0.22301920245 * 
        G_Condition_11  +    -0.07029584066357 * G_Condition_12
          +    -0.08006451757607 * G_Condition_13  +     0.02242392305711 * 
        G_Condition_20  +     0.15304170758259 * G_Condition_21
          +    -0.03916488037179 * G_Condition_22  +     0.00857590403282 * 
        G_Exterior_1st0  +    -0.07076587061419 * G_Exterior_1st1
          +     0.03861305036406 * G_Exterior_1st2  +     0.00905471181651 * 
        G_Exterior_1st3  +    -0.25456827883684 * G_Exterior_1st4
          +        0.02496027262 * G_Exterior_1st5  +     0.00450102445451 * 
        G_Exterior_1st6  +     0.05540731097501 * G_Exterior_1st7
          +     0.03953982294372 * G_Functional0  +    -0.10584188464656 * 
        G_Functional1  +    -0.01173041082413 * G_Functional2
          +    -0.05133402438337 * G_Garage_Qual0  +     0.13255440469624 * 
        G_Garage_Qual1  +    -0.11894008218023 * G_Garage_Qual2
          +      0.0003953134915 * G_House_Style0  +     -0.2954985119349 * 
        G_House_Style1  +     0.06247891620561 * G_House_Style2
          +    -0.18171249726365 * G_House_Style3  +    -0.06797786799239 * 
        G_House_Style4  +    -0.08752844160014 * G_Kitchen_Qual0
          +     0.09212673772369 * G_Kitchen_Qual1  +     0.08424694816681 * 
        G_Kitchen_Qual2  +    -0.06111407277645 * G_MS_SubClass0
          +    -0.26011746088309 * G_MS_SubClass1  +    -0.13120015427475 * 
        G_MS_SubClass2  +    -0.30859301967054 * G_MS_SubClass3
          +     0.05485261459516 * G_MS_SubClass4  +    -0.09313982919052 * 
        G_MS_SubClass5  +    -0.05826195241994 * G_MS_SubClass6
          +    -0.18030262883379 * G_MS_SubClass7  +    -0.09658492908942 * 
        G_Neighborhood0  +    -0.19062555638719 * G_Neighborhood1
          +     0.04404003155216 * G_Neighborhood2  +     0.08608862687292 * 
        G_Neighborhood3  +    -0.02735888712014 * G_Neighborhood4
          +     0.05755978185432 * G_Neighborhood5  +     0.02653246477572 * 
        G_Neighborhood6  +     0.15750838114726 * G_Neighborhood7
          +     0.15580320934425 * G_Neighborhood8  +    -0.12912647891766 * 
        G_Neighborhood9  +     0.21717992269395 * G_Neighborhood10
          +    -0.16686401361155 * G_Neighborhood11  +     0.04466387378485 * 
        G_Neighborhood12  +     0.08463484325806 * G_Pool_QC0
          +     0.04679138147965 * G_Pool_QC1  +    -0.13005446737083 * 
        G_Roof_Matl0  +     0.12579064714514 * G_Roof_Matl1
          +     0.08661195096801 * G_Sale_Condition0
          +    -0.32151421953428 * G_Sale_Condition1
          +     0.12451686436482 * G_Sale_Condition2
          +     0.16457026988062 * G_Sale_Condition3
          +     0.06575347991232 * Land_ContourBnk  +     0.15033903356463 * 
        Land_ContourHLS  +     0.18280661071366 * Land_ContourLow ;
   H128  = H128  +    -0.11607699606701 * Exter_QualEx
          +    -0.32159066895188 * Exter_QualFa  +      0.0095262917443 * 
        Exter_QualGd  +    -0.13076492482321 * G_Bldg_Type0
          +    -0.10759357856809 * G_Bldg_Type1  +     0.04426729796712 * 
        G_Bldg_Type2  +    -0.21953352789359 * G_Bsmt_Exposure0
          +     -0.0890865764312 * G_Bsmt_Exposure1  +    -0.06135332021936 * 
        G_Bsmt_Exposure2  +    -0.20808360973775 * G_Bsmt_Exposure3
          +     0.03123400900605 * G_Bsmt_Qual0  +     0.20958590456682 * 
        G_Bsmt_Qual1  +     0.16559256962706 * G_Bsmt_Qual2
          +    -0.24646375346135 * G_Condition_10  +    -0.16384387957892 * 
        G_Condition_11  +     0.03244381581168 * G_Condition_12
          +     0.09151809007583 * G_Condition_13  +     0.14733762317315 * 
        G_Condition_20  +     0.15791058255456 * G_Condition_21
          +    -0.07059613001672 * G_Condition_22  +      0.0262096301156 * 
        G_Exterior_1st0  +    -0.30051292829799 * G_Exterior_1st1
          +    -0.02972738825528 * G_Exterior_1st2  +    -0.08294135380531 * 
        G_Exterior_1st3  +     0.15188322790111 * G_Exterior_1st4
          +    -0.12638967621043 * G_Exterior_1st5  +     0.03272565142752 * 
        G_Exterior_1st6  +    -0.04146348050421 * G_Exterior_1st7
          +    -0.18478712211952 * G_Functional0  +    -0.13820318616857 * 
        G_Functional1  +    -0.19729132429039 * G_Functional2
          +     0.33420674741434 * G_Garage_Qual0  +    -0.16046119672754 * 
        G_Garage_Qual1  +     0.07118416514673 * G_Garage_Qual2
          +    -0.08522890041766 * G_House_Style0  +    -0.01690407034634 * 
        G_House_Style1  +     0.09627970754415 * G_House_Style2
          +    -0.15537096959247 * G_House_Style3  +     0.07029268527497 * 
        G_House_Style4  +      0.0667615021852 * G_Kitchen_Qual0
          +     0.08643345604858 * G_Kitchen_Qual1  +    -0.06397981585185 * 
        G_Kitchen_Qual2  +    -0.15745427388901 * G_MS_SubClass0
          +    -0.00863799876046 * G_MS_SubClass1  +     -0.0655776833948 * 
        G_MS_SubClass2  +     0.02145158350244 * G_MS_SubClass3
          +     -0.0213263578889 * G_MS_SubClass4  +    -0.12269764852308 * 
        G_MS_SubClass5  +     0.16396828630413 * G_MS_SubClass6
          +     0.12462404658562 * G_MS_SubClass7  +     0.19229234004989 * 
        G_Neighborhood0  +    -0.05241144061101 * G_Neighborhood1
          +    -0.18576523653852 * G_Neighborhood2  +    -0.03288382302356 * 
        G_Neighborhood3  +     0.05538015802829 * G_Neighborhood4
          +     0.10275837982052 * G_Neighborhood5  +    -0.01325237065515 * 
        G_Neighborhood6  +     -0.1701188962954 * G_Neighborhood7
          +     -0.0244408064115 * G_Neighborhood8  +    -0.01056666529279 * 
        G_Neighborhood9  +    -0.17041924028372 * G_Neighborhood10
          +    -0.00070968486678 * G_Neighborhood11  +     0.17938135606814 * 
        G_Neighborhood12  +     0.23999904085624 * G_Pool_QC0
          +     0.07800986636437 * G_Pool_QC1  +     0.19127523058147 * 
        G_Roof_Matl0  +     0.13021716227982 * G_Roof_Matl1
          +      0.0921660929589 * G_Sale_Condition0
          +    -0.10191433218705 * G_Sale_Condition1
          +     0.02637803696895 * G_Sale_Condition2
          +     0.24953514387861 * G_Sale_Condition3
          +     0.02531586535189 * Land_ContourBnk  +     -0.1607469070055 * 
        Land_ContourHLS  +     0.02380677097419 * Land_ContourLow ;
   H129  = H129  +    -0.07110687088823 * Exter_QualEx
          +    -0.05138335911628 * Exter_QualFa  +    -0.06958333313622 * 
        Exter_QualGd  +     0.09886573910207 * G_Bldg_Type0
          +      0.2134430358895 * G_Bldg_Type1  +     0.20093844126826 * 
        G_Bldg_Type2  +     0.14483125752215 * G_Bsmt_Exposure0
          +     0.11612901646991 * G_Bsmt_Exposure1  +     0.18199201428558 * 
        G_Bsmt_Exposure2  +     0.00952014522514 * G_Bsmt_Exposure3
          +     0.07429108558129 * G_Bsmt_Qual0  +     0.12590162729803 * 
        G_Bsmt_Qual1  +     0.09025019674501 * G_Bsmt_Qual2
          +     0.08462216935713 * G_Condition_10  +     0.19614818884623 * 
        G_Condition_11  +     0.11566367592366 * G_Condition_12
          +    -0.07715084784143 * G_Condition_13  +    -0.17219511902951 * 
        G_Condition_20  +     0.21061817253358 * G_Condition_21
          +     0.02259626583976 * G_Condition_22  +     0.00457788667979 * 
        G_Exterior_1st0  +    -0.03977056394241 * G_Exterior_1st1
          +     0.00990505297021 * G_Exterior_1st2  +     -0.1656167645354 * 
        G_Exterior_1st3  +      0.1353172230645 * G_Exterior_1st4
          +     0.13420311206593 * G_Exterior_1st5  +     0.05727954627661 * 
        G_Exterior_1st6  +    -0.05664347945201 * G_Exterior_1st7
          +    -0.14625480880967 * G_Functional0  +    -0.15538843012454 * 
        G_Functional1  +    -0.29707524653752 * G_Functional2
          +    -0.00866935499268 * G_Garage_Qual0  +     0.03602671000384 * 
        G_Garage_Qual1  +     0.05848954046982 * G_Garage_Qual2
          +    -0.07464138398903 * G_House_Style0  +     0.07801802668278 * 
        G_House_Style1  +     0.06512061257646 * G_House_Style2
          +    -0.10905420003387 * G_House_Style3  +     0.21128463513592 * 
        G_House_Style4  +     0.00491754078356 * G_Kitchen_Qual0
          +    -0.05915596940511 * G_Kitchen_Qual1  +    -0.08367101252902 * 
        G_Kitchen_Qual2  +     0.07748624135879 * G_MS_SubClass0
          +     0.19813908134844 * G_MS_SubClass1  +     0.05451675517719 * 
        G_MS_SubClass2  +     -0.0517174089939 * G_MS_SubClass3
          +     0.08864759953297 * G_MS_SubClass4  +    -0.00978490510883 * 
        G_MS_SubClass5  +      0.0569057545849 * G_MS_SubClass6
          +     0.00237825754382 * G_MS_SubClass7  +    -0.04729336993878 * 
        G_Neighborhood0  +     0.01716293640436 * G_Neighborhood1
          +    -0.25516352221709 * G_Neighborhood2  +     -0.1069117552556 * 
        G_Neighborhood3  +     0.24737784203359 * G_Neighborhood4
          +    -0.09139702233523 * G_Neighborhood5  +      -0.107449300235 * 
        G_Neighborhood6  +     0.07619750299546 * G_Neighborhood7
          +     -0.1100635347663 * G_Neighborhood8  +    -0.13640816022084 * 
        G_Neighborhood9  +    -0.26906634184822 * G_Neighborhood10
          +    -0.02201438078714 * G_Neighborhood11  +     0.07909216572549 * 
        G_Neighborhood12  +     0.01878436427089 * G_Pool_QC0
          +    -0.04685905467909 * G_Pool_QC1  +    -0.03226826119151 * 
        G_Roof_Matl0  +     0.18077820393443 * G_Roof_Matl1
          +     -0.2053307127032 * G_Sale_Condition0
          +     0.15347608813865 * G_Sale_Condition1
          +     0.27056754409488 * G_Sale_Condition2
          +     0.28565634727221 * G_Sale_Condition3
          +    -0.34761245347403 * Land_ContourBnk  +    -0.31806187445917 * 
        Land_ContourHLS  +     -0.4343530379093 * Land_ContourLow ;
   H130  = H130  +     0.17560356864824 * Exter_QualEx
          +     0.13205512891743 * Exter_QualFa  +    -0.03284387987208 * 
        Exter_QualGd  +     0.03521276699653 * G_Bldg_Type0
          +    -0.14772776187532 * G_Bldg_Type1  +    -0.17798481340264 * 
        G_Bldg_Type2  +     0.17409517560983 * G_Bsmt_Exposure0
          +     0.15145920551342 * G_Bsmt_Exposure1  +     0.07492041292314 * 
        G_Bsmt_Exposure2  +    -0.09308614324825 * G_Bsmt_Exposure3
          +     0.08509733090821 * G_Bsmt_Qual0  +     0.03803757338799 * 
        G_Bsmt_Qual1  +     0.25843778814442 * G_Bsmt_Qual2
          +     0.08687709635431 * G_Condition_10  +     0.08241576305478 * 
        G_Condition_11  +     0.08446555030712 * G_Condition_12
          +     0.12135682346285 * G_Condition_13  +      0.0630714422179 * 
        G_Condition_20  +     -0.1769518841406 * G_Condition_21
          +    -0.06942751743661 * G_Condition_22  +     0.02629295329017 * 
        G_Exterior_1st0  +      0.0757884272702 * G_Exterior_1st1
          +    -0.19302023672063 * G_Exterior_1st2  +     -0.0172779789072 * 
        G_Exterior_1st3  +      0.0761556140136 * G_Exterior_1st4
          +     0.10405902251167 * G_Exterior_1st5  +     0.20728864972321 * 
        G_Exterior_1st6  +     0.15816597158627 * G_Exterior_1st7
          +     0.10484448197187 * G_Functional0  +     0.07952384596097 * 
        G_Functional1  +    -0.02139044396178 * G_Functional2
          +    -0.10704709383163 * G_Garage_Qual0  +     0.21215489502525 * 
        G_Garage_Qual1  +     0.18715417159352 * G_Garage_Qual2
          +     0.04398424129414 * G_House_Style0  +     0.04721499338596 * 
        G_House_Style1  +     0.07923442871882 * G_House_Style2
          +     0.19269911993024 * G_House_Style3  +    -0.10836632347906 * 
        G_House_Style4  +     0.18930171555641 * G_Kitchen_Qual0
          +     0.09345555723033 * G_Kitchen_Qual1  +    -0.04349904053612 * 
        G_Kitchen_Qual2  +     -0.0474646426226 * G_MS_SubClass0
          +     0.02947413395224 * G_MS_SubClass1  +    -0.01357101320917 * 
        G_MS_SubClass2  +     0.35847317179803 * G_MS_SubClass3
          +     0.11113346943649 * G_MS_SubClass4  +    -0.03341831353183 * 
        G_MS_SubClass5  +    -0.01234101387013 * G_MS_SubClass6
          +     0.00629951877306 * G_MS_SubClass7  +    -0.15067601404056 * 
        G_Neighborhood0  +    -0.02295338509405 * G_Neighborhood1
          +    -0.08059863115857 * G_Neighborhood2  +     0.00672868628788 * 
        G_Neighborhood3  +    -0.07111068290409 * G_Neighborhood4
          +     0.14380205501873 * G_Neighborhood5  +     0.12311953803521 * 
        G_Neighborhood6  +     0.13874103934094 * G_Neighborhood7
          +    -0.18490556016366 * G_Neighborhood8  +    -0.36941082606149 * 
        G_Neighborhood9  +    -0.19475734540248 * G_Neighborhood10
          +    -0.23690664181209 * G_Neighborhood11  +     0.09717534516445 * 
        G_Neighborhood12  +     0.04879860931481 * G_Pool_QC0
          +    -0.18266429850979 * G_Pool_QC1  +    -0.17709287021104 * 
        G_Roof_Matl0  +    -0.04115200257494 * G_Roof_Matl1
          +    -0.11187889425668 * G_Sale_Condition0
          +    -0.10369241658012 * G_Sale_Condition1
          +     0.18667280045373 * G_Sale_Condition2
          +     0.08715247513624 * G_Sale_Condition3
          +    -0.03232143597442 * Land_ContourBnk  +    -0.04611101312136 * 
        Land_ContourHLS  +    -0.18928482822582 * Land_ContourLow ;
   H101  =    -0.85578443776236 + H101 ;
   H102  =    -0.97106058210051 + H102 ;
   H103  =    -0.45160988760832 + H103 ;
   H104  =    -0.29167865453255 + H104 ;
   H105  =     1.10015135077218 + H105 ;
   H106  =     0.06799878245572 + H106 ;
   H107  =    -0.13917821011104 + H107 ;
   H108  =     -0.2849103546934 + H108 ;
   H109  =     1.82931766475725 + H109 ;
   H110  =    -0.55091880365975 + H110 ;
   H111  =     1.22284114691332 + H111 ;
   H112  =    -0.83680172380671 + H112 ;
   H113  =    -1.64564406614379 + H113 ;
   H114  =     1.06525321240734 + H114 ;
   H115  =     0.05940151460528 + H115 ;
   H116  =     -0.4149754303303 + H116 ;
   H117  =     0.77038922080271 + H117 ;
   H118  =    -1.26291906228571 + H118 ;
   H119  =     0.88170735661014 + H119 ;
   H120  =     0.56944056776711 + H120 ;
   H121  =    -0.96279911801372 + H121 ;
   H122  =     -0.7477755775295 + H122 ;
   H123  =    -0.60064047428989 + H123 ;
   H124  =    -1.17429004851595 + H124 ;
   H125  =    -0.90657978468068 + H125 ;
   H126  =     0.84057072022537 + H126 ;
   H127  =    -1.38423479290889 + H127 ;
   H128  =       0.185669686299 + H128 ;
   H129  =     0.17648516684115 + H129 ;
   H130  =    -0.94094183801973 + H130 ;
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
   H121  = TANH(H121 );
   H122  = TANH(H122 );
   H123  = TANH(H123 );
   H124  = TANH(H124 );
   H125  = TANH(H125 );
   H126  = TANH(H126 );
   H127  = TANH(H127 );
   H128  = TANH(H128 );
   H129  = TANH(H129 );
   H130  = TANH(H130 );
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
   H121  = .;
   H122  = .;
   H123  = .;
   H124  = .;
   H125  = .;
   H126  = .;
   H127  = .;
   H128  = .;
   H129  = .;
   H130  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_SalePrice  =    -5331.78466511755 * H101  +     17117.3391809936 * H102
          +    -157.537819114568 * H103  +     43903.6102575709 * H104
          +    -10487.3347746984 * H105  +    -22886.5387736865 * H106
          +      15832.254776787 * H107  +      6592.2838779395 * H108
          +    -25067.2769529597 * H109  +    -6362.80257739816 * H110
          +       2056.877583113 * H111  +    -53109.4989437762 * H112
          +    -11673.3307817545 * H113  +     5821.62616899628 * H114
          +     8844.44865552244 * H115  +     16203.0993223935 * H116
          +     735.906412531554 * H117  +    -1284.24946936061 * H118
          +    -12354.8448466589 * H119  +     21191.8263161702 * H120
          +    -5711.80336273636 * H121  +    -11719.2828926694 * H122
          +      33837.650256815 * H123  +     24780.7660444368 * H124
          +     12295.8365978277 * H125  +     19051.6649833369 * H126
          +     17065.8939725201 * H127  +     27467.2653259528 * H128
          +     14054.2499681177 * H129  +    -28295.3993707218 * H130 ;
   P_SalePrice  =     179893.826923788 + P_SalePrice ;
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
