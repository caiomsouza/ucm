*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Avisos' ;

drop _Y;
_Y = SalePrice ;

drop _DM_BAD;
_DM_BAD=0;

*** Check BsmtFin_SF_1 for missing values ;
if missing( BsmtFin_SF_1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Bsmt_Full_Bath for missing values ;
if missing( Bsmt_Full_Bath ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Fireplaces for missing values ;
if missing( Fireplaces ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Garage_Cars for missing values ;
if missing( Garage_Cars ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Gr_Liv_Area for missing values ;
if missing( Gr_Liv_Area ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Lot_Area for missing values ;
if missing( Lot_Area ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Mas_Vnr_Area for missing values ;
if missing( Mas_Vnr_Area ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Overall_Cond for missing values ;
if missing( Overall_Cond ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Overall_Qual for missing values ;
if missing( Overall_Qual ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Screen_Porch for missing values ;
if missing( Screen_Porch ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Year_Built for missing values ;
if missing( Year_Built ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for Exter_Qual ;
drop _0_0 _0_1 _0_2 ;
if missing( Exter_Qual ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm2 $ 2; drop _dm2 ;
   _dm2 = put( Exter_Qual , $2. );
   %DMNORMIP( _dm2 )
   if _dm2 = 'TA'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm2 = 'GD'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else if _dm2 = 'EX'  then do;
      _0_0 = 1;
      _0_1 = 0;
      _0_2 = 0;
   end;
   else if _dm2 = 'FA'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bldg_Type ;
drop _1_0 _1_1 _1_2 ;
if missing( G_Bldg_Type ) then do;
   _1_0 = .;
   _1_1 = .;
   _1_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bldg_Type , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 0;
      _1_1 = 0;
      _1_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
   end;
   else if _dm12 = '1'  then do;
      _1_0 = 0;
      _1_1 = 1;
      _1_2 = 0;
   end;
   else if _dm12 = '0'  then do;
      _1_0 = 1;
      _1_1 = 0;
      _1_2 = 0;
   end;
   else do;
      _1_0 = .;
      _1_1 = .;
      _1_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bsmt_Exposure ;
drop _2_0 _2_1 _2_2 _2_3 ;
*** encoding is sparse, initialize to zero;
_2_0 = 0;
_2_1 = 0;
_2_2 = 0;
_2_3 = 0;
if missing( G_Bsmt_Exposure ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   _2_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bsmt_Exposure , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _2_1 = 1;
   end;
   else if _dm12 = '3'  then do;
      _2_3 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
      _2_3 = -1;
   end;
   else if _dm12 = '2'  then do;
      _2_2 = 1;
   end;
   else if _dm12 = '0'  then do;
      _2_0 = 1;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      _2_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Bsmt_Qual ;
drop _3_0 _3_1 _3_2 ;
if missing( G_Bsmt_Qual ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Bsmt_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _3_0 = 0;
      _3_1 = 1;
      _3_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 0;
      _3_1 = 0;
      _3_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = -1;
      _3_1 = -1;
      _3_2 = -1;
   end;
   else if _dm12 = '0'  then do;
      _3_0 = 1;
      _3_1 = 0;
      _3_2 = 0;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Condition_1 ;
drop _4_0 _4_1 _4_2 _4_3 ;
*** encoding is sparse, initialize to zero;
_4_0 = 0;
_4_1 = 0;
_4_2 = 0;
_4_3 = 0;
if missing( G_Condition_1 ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Condition_1 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _4_2 = 1;
   end;
   else if _dm12 = '1'  then do;
      _4_1 = 1;
   end;
   else if _dm12 = '0'  then do;
      _4_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _4_0 = -1;
      _4_1 = -1;
      _4_2 = -1;
      _4_3 = -1;
   end;
   else if _dm12 = '3'  then do;
      _4_3 = 1;
   end;
   else do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      _4_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Condition_2 ;
drop _5_0 _5_1 _5_2 ;
if missing( G_Condition_2 ) then do;
   _5_0 = .;
   _5_1 = .;
   _5_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Condition_2 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _5_0 = 0;
      _5_1 = 1;
      _5_2 = 0;
   end;
   else if _dm12 = '0'  then do;
      _5_0 = 1;
      _5_1 = 0;
      _5_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _5_0 = -1;
      _5_1 = -1;
      _5_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _5_0 = 0;
      _5_1 = 0;
      _5_2 = 1;
   end;
   else do;
      _5_0 = .;
      _5_1 = .;
      _5_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Exterior_1st ;
drop _6_0 _6_1 _6_2 _6_3 _6_4 _6_5 _6_6 _6_7 ;
*** encoding is sparse, initialize to zero;
_6_0 = 0;
_6_1 = 0;
_6_2 = 0;
_6_3 = 0;
_6_4 = 0;
_6_5 = 0;
_6_6 = 0;
_6_7 = 0;
if missing( G_Exterior_1st ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   _6_3 = .;
   _6_4 = .;
   _6_5 = .;
   _6_6 = .;
   _6_7 = .;
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
               _6_0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  _6_1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _6_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _6_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _6_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            _6_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               _6_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            _6_7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               _6_0 = -1;
               _6_1 = -1;
               _6_2 = -1;
               _6_3 = -1;
               _6_4 = -1;
               _6_5 = -1;
               _6_6 = -1;
               _6_7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      _6_3 = .;
      _6_4 = .;
      _6_5 = .;
      _6_6 = .;
      _6_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Functional ;
drop _7_0 _7_1 _7_2 ;
if missing( G_Functional ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Functional , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _7_0 = 0;
      _7_1 = 0;
      _7_2 = 1;
   end;
   else if _dm12 = '1'  then do;
      _7_0 = 0;
      _7_1 = 1;
      _7_2 = 0;
   end;
   else if _dm12 = '0'  then do;
      _7_0 = 1;
      _7_1 = 0;
      _7_2 = 0;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Garage_Qual ;
drop _8_0 _8_1 _8_2 ;
if missing( G_Garage_Qual ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Garage_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _8_0 = 0;
      _8_1 = 0;
      _8_2 = 1;
   end;
   else if _dm12 = '0'  then do;
      _8_0 = 1;
      _8_1 = 0;
      _8_2 = 0;
   end;
   else if _dm12 = '1'  then do;
      _8_0 = 0;
      _8_1 = 1;
      _8_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _8_0 = -1;
      _8_1 = -1;
      _8_2 = -1;
   end;
   else do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_House_Style ;
drop _9_0 _9_1 _9_2 _9_3 _9_4 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
_9_4 = 0;
if missing( G_House_Style ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   _9_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_House_Style , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      _9_4 = 1;
   end;
   else if _dm12 = '5'  then do;
      _9_0 = -1;
      _9_1 = -1;
      _9_2 = -1;
      _9_3 = -1;
      _9_4 = -1;
   end;
   else if _dm12 = '1'  then do;
      _9_1 = 1;
   end;
   else if _dm12 = '3'  then do;
      _9_3 = 1;
   end;
   else if _dm12 = '2'  then do;
      _9_2 = 1;
   end;
   else if _dm12 = '0'  then do;
      _9_0 = 1;
   end;
   else do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      _9_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Kitchen_Qual ;
drop _10_0 _10_1 _10_2 ;
if missing( G_Kitchen_Qual ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Kitchen_Qual , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _10_0 = 0;
      _10_1 = 1;
      _10_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _10_0 = 0;
      _10_1 = 0;
      _10_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _10_0 = -1;
      _10_1 = -1;
      _10_2 = -1;
   end;
   else if _dm12 = '0'  then do;
      _10_0 = 1;
      _10_1 = 0;
      _10_2 = 0;
   end;
   else do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_MS_SubClass ;
drop _11_0 _11_1 _11_2 _11_3 _11_4 _11_5 _11_6 _11_7 ;
*** encoding is sparse, initialize to zero;
_11_0 = 0;
_11_1 = 0;
_11_2 = 0;
_11_3 = 0;
_11_4 = 0;
_11_5 = 0;
_11_6 = 0;
_11_7 = 0;
if missing( G_MS_SubClass ) then do;
   _11_0 = .;
   _11_1 = .;
   _11_2 = .;
   _11_3 = .;
   _11_4 = .;
   _11_5 = .;
   _11_6 = .;
   _11_7 = .;
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
               _11_0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  _11_1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _11_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _11_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _11_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            _11_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               _11_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            _11_7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               _11_0 = -1;
               _11_1 = -1;
               _11_2 = -1;
               _11_3 = -1;
               _11_4 = -1;
               _11_5 = -1;
               _11_6 = -1;
               _11_7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _11_0 = .;
      _11_1 = .;
      _11_2 = .;
      _11_3 = .;
      _11_4 = .;
      _11_5 = .;
      _11_6 = .;
      _11_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Neighborhood ;
drop _12_0 _12_1 _12_2 _12_3 _12_4 _12_5 _12_6 _12_7 _12_8 _12_9 _12_10 _12_11
         _12_12 ;
*** encoding is sparse, initialize to zero;
_12_0 = 0;
_12_1 = 0;
_12_2 = 0;
_12_3 = 0;
_12_4 = 0;
_12_5 = 0;
_12_6 = 0;
_12_7 = 0;
_12_8 = 0;
_12_9 = 0;
_12_10 = 0;
_12_11 = 0;
_12_12 = 0;
if missing( G_Neighborhood ) then do;
   _12_0 = .;
   _12_1 = .;
   _12_2 = .;
   _12_3 = .;
   _12_4 = .;
   _12_5 = .;
   _12_6 = .;
   _12_7 = .;
   _12_8 = .;
   _12_9 = .;
   _12_10 = .;
   _12_11 = .;
   _12_12 = .;
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
               _12_0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  _12_1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '10'  then do;
               _12_10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _12_11 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm12 <= '13'  then do;
            if _dm12 = '12'  then do;
               _12_12 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '13'  then do;
                  _12_0 = -1;
                  _12_1 = -1;
                  _12_2 = -1;
                  _12_3 = -1;
                  _12_4 = -1;
                  _12_5 = -1;
                  _12_6 = -1;
                  _12_7 = -1;
                  _12_8 = -1;
                  _12_9 = -1;
                  _12_10 = -1;
                  _12_11 = -1;
                  _12_12 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _12_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 <= '4'  then do;
            if _dm12 = '3'  then do;
               _12_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '4'  then do;
                  _12_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '5'  then do;
               _12_5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _12_6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm12 <= '8'  then do;
            if _dm12 = '7'  then do;
               _12_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '8'  then do;
                  _12_8 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '9'  then do;
               _12_9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _12_0 = .;
      _12_1 = .;
      _12_2 = .;
      _12_3 = .;
      _12_4 = .;
      _12_5 = .;
      _12_6 = .;
      _12_7 = .;
      _12_8 = .;
      _12_9 = .;
      _12_10 = .;
      _12_11 = .;
      _12_12 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Pool_QC ;
drop _13_0 _13_1 ;
if missing( G_Pool_QC ) then do;
   _13_0 = .;
   _13_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Pool_QC , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _13_0 = 1;
      _13_1 = 0;
   end;
   else if _dm12 = '1'  then do;
      _13_0 = 0;
      _13_1 = 1;
   end;
   else if _dm12 = '2'  then do;
      _13_0 = -1;
      _13_1 = -1;
   end;
   else do;
      _13_0 = .;
      _13_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Roof_Matl ;
drop _14_0 _14_1 ;
if missing( G_Roof_Matl ) then do;
   _14_0 = .;
   _14_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Roof_Matl , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _14_0 = 1;
      _14_1 = 0;
   end;
   else if _dm12 = '1'  then do;
      _14_0 = 0;
      _14_1 = 1;
   end;
   else if _dm12 = '2'  then do;
      _14_0 = -1;
      _14_1 = -1;
   end;
   else do;
      _14_0 = .;
      _14_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Sale_Condition ;
drop _15_0 _15_1 _15_2 _15_3 ;
*** encoding is sparse, initialize to zero;
_15_0 = 0;
_15_1 = 0;
_15_2 = 0;
_15_3 = 0;
if missing( G_Sale_Condition ) then do;
   _15_0 = .;
   _15_1 = .;
   _15_2 = .;
   _15_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Sale_Condition , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _15_3 = 1;
   end;
   else if _dm12 = '4'  then do;
      _15_0 = -1;
      _15_1 = -1;
      _15_2 = -1;
      _15_3 = -1;
   end;
   else if _dm12 = '1'  then do;
      _15_1 = 1;
   end;
   else if _dm12 = '2'  then do;
      _15_2 = 1;
   end;
   else if _dm12 = '0'  then do;
      _15_0 = 1;
   end;
   else do;
      _15_0 = .;
      _15_1 = .;
      _15_2 = .;
      _15_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Land_Contour ;
drop _16_0 _16_1 _16_2 ;
if missing( Land_Contour ) then do;
   _16_0 = .;
   _16_1 = .;
   _16_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm3 $ 3; drop _dm3 ;
   _dm3 = put( Land_Contour , $3. );
   %DMNORMIP( _dm3 )
   if _dm3 = 'LVL'  then do;
      _16_0 = -1;
      _16_1 = -1;
      _16_2 = -1;
   end;
   else if _dm3 = 'BNK'  then do;
      _16_0 = 1;
      _16_1 = 0;
      _16_2 = 0;
   end;
   else if _dm3 = 'HLS'  then do;
      _16_0 = 0;
      _16_1 = 1;
      _16_2 = 0;
   end;
   else if _dm3 = 'LOW'  then do;
      _16_0 = 0;
      _16_1 = 0;
      _16_2 = 1;
   end;
   else do;
      _16_0 = .;
      _16_1 = .;
      _16_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     180180.371498771;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: BsmtFin_SF_1 ;
_TEMP = BsmtFin_SF_1 ;
_LP0 = _LP0 + (    11.5621514398407 * _TEMP);

***  Effect: Bsmt_Full_Bath ;
_TEMP = Bsmt_Full_Bath ;
_LP0 = _LP0 + (     5381.0283259171 * _TEMP);

***  Effect: Exter_Qual ;
_TEMP = 1;
_LP0 = _LP0 + (     18323.390845647) * _TEMP * _0_0;
_LP0 = _LP0 + (   -3747.81969466283) * _TEMP * _0_1;
_LP0 = _LP0 + (   -5496.78631343533) * _TEMP * _0_2;

***  Effect: Fireplaces ;
_TEMP = Fireplaces ;
_LP0 = _LP0 + (    4379.59985305054 * _TEMP);

***  Effect: G_Bldg_Type ;
_TEMP = 1;
_LP0 = _LP0 + (    6576.43439152216) * _TEMP * _1_0;
_LP0 = _LP0 + (   -11803.8511310857) * _TEMP * _1_1;
_LP0 = _LP0 + (    11069.7326206555) * _TEMP * _1_2;

***  Effect: G_Bsmt_Exposure ;
_TEMP = 1;
_LP0 = _LP0 + (   -12018.5997177394) * _TEMP * _2_0;
_LP0 = _LP0 + (   -5926.31354700216) * _TEMP * _2_1;
_LP0 = _LP0 + (   -3993.69337983088) * _TEMP * _2_2;
_LP0 = _LP0 + (    2465.45051412577) * _TEMP * _2_3;

***  Effect: G_Bsmt_Qual ;
_TEMP = 1;
_LP0 = _LP0 + (    -4179.5382655472) * _TEMP * _3_0;
_LP0 = _LP0 + (    -6406.3783388792) * _TEMP * _3_1;
_LP0 = _LP0 + (    -6338.7659888715) * _TEMP * _3_2;

***  Effect: G_Condition_1 ;
_TEMP = 1;
_LP0 = _LP0 + (   -4194.14166143883) * _TEMP * _4_0;
_LP0 = _LP0 + (   -6956.17482110982) * _TEMP * _4_1;
_LP0 = _LP0 + (    6676.25137890562) * _TEMP * _4_2;
_LP0 = _LP0 + (   -8776.17077925436) * _TEMP * _4_3;

***  Effect: G_Condition_2 ;
_TEMP = 1;
_LP0 = _LP0 + (    83434.0253912133) * _TEMP * _5_0;
_LP0 = _LP0 + (    81683.8185167201) * _TEMP * _5_1;
_LP0 = _LP0 + (   -281269.591889351) * _TEMP * _5_2;

***  Effect: G_Exterior_1st ;
_TEMP = 1;
_LP0 = _LP0 + (   -9205.18903430088) * _TEMP * _6_0;
_LP0 = _LP0 + (   -7693.16325851265) * _TEMP * _6_1;
_LP0 = _LP0 + (   -5863.34932983151) * _TEMP * _6_2;
_LP0 = _LP0 + (   -6799.85913114501) * _TEMP * _6_3;
_LP0 = _LP0 + (   -7840.12391954443) * _TEMP * _6_4;
_LP0 = _LP0 + (    12326.5183642068) * _TEMP * _6_5;
_LP0 = _LP0 + (   -3674.96002700122) * _TEMP * _6_6;
_LP0 = _LP0 + (     1383.9850085169) * _TEMP * _6_7;

***  Effect: G_Functional ;
_TEMP = 1;
_LP0 = _LP0 + (   -21034.9332616899) * _TEMP * _7_0;
_LP0 = _LP0 + (   -4876.26116187539) * _TEMP * _7_1;
_LP0 = _LP0 + (    7648.46274250068) * _TEMP * _7_2;

***  Effect: G_Garage_Qual ;
_TEMP = 1;
_LP0 = _LP0 + (    4641.54799617582) * _TEMP * _8_0;
_LP0 = _LP0 + (   -4352.49441075297) * _TEMP * _8_1;
_LP0 = _LP0 + (   -3345.40185135973) * _TEMP * _8_2;

***  Effect: G_House_Style ;
_TEMP = 1;
_LP0 = _LP0 + (    13595.3110119909) * _TEMP * _9_0;
_LP0 = _LP0 + (    2383.51337072447) * _TEMP * _9_1;
_LP0 = _LP0 + (    -5701.2647938565) * _TEMP * _9_2;
_LP0 = _LP0 + (   -10055.6667452562) * _TEMP * _9_3;
_LP0 = _LP0 + (    5492.33350056387) * _TEMP * _9_4;

***  Effect: G_Kitchen_Qual ;
_TEMP = 1;
_LP0 = _LP0 + (   -5905.13878775874) * _TEMP * _10_0;
_LP0 = _LP0 + (    -7893.5750174173) * _TEMP * _10_1;
_LP0 = _LP0 + (   -4678.74346560328) * _TEMP * _10_2;

***  Effect: G_MS_SubClass ;
_TEMP = 1;
_LP0 = _LP0 + (    2133.52864044655) * _TEMP * _11_0;
_LP0 = _LP0 + (   -816.655742675946) * _TEMP * _11_1;
_LP0 = _LP0 + (   -10240.6572797958) * _TEMP * _11_2;
_LP0 = _LP0 + (   -548.381333694365) * _TEMP * _11_3;
_LP0 = _LP0 + (    4588.69077526382) * _TEMP * _11_4;
_LP0 = _LP0 + (    6232.01490897712) * _TEMP * _11_5;
_LP0 = _LP0 + (   -63.8259395757313) * _TEMP * _11_6;
_LP0 = _LP0 + (   -2344.29892366153) * _TEMP * _11_7;

***  Effect: G_Neighborhood ;
_TEMP = 1;
_LP0 = _LP0 + (   -11388.9625836084) * _TEMP * _12_0;
_LP0 = _LP0 + (   -12384.8369505246) * _TEMP * _12_1;
_LP0 = _LP0 + (   -14547.1736664579) * _TEMP * _12_2;
_LP0 = _LP0 + (   -5696.04671276753) * _TEMP * _12_3;
_LP0 = _LP0 + (   -10819.1412766228) * _TEMP * _12_4;
_LP0 = _LP0 + (   -8831.77811684984) * _TEMP * _12_5;
_LP0 = _LP0 + (   -2932.49112863053) * _TEMP * _12_6;
_LP0 = _LP0 + (   -11107.4711217786) * _TEMP * _12_7;
_LP0 = _LP0 + (   -5232.34080321108) * _TEMP * _12_8;
_LP0 = _LP0 + (    6582.67897056899) * _TEMP * _12_9;
_LP0 = _LP0 + (    13037.4302202485) * _TEMP * _12_10;
_LP0 = _LP0 + (   -2533.07973603028) * _TEMP * _12_11;
_LP0 = _LP0 + (      27656.12464228) * _TEMP * _12_12;

***  Effect: G_Pool_QC ;
_TEMP = 1;
_LP0 = _LP0 + (   -8795.46637672844) * _TEMP * _13_0;
_LP0 = _LP0 + (   -121341.235935082) * _TEMP * _13_1;

***  Effect: G_Roof_Matl ;
_TEMP = 1;
_LP0 = _LP0 + (    -22920.455931963) * _TEMP * _14_0;
_LP0 = _LP0 + (   -28693.8090176535) * _TEMP * _14_1;

***  Effect: G_Sale_Condition ;
_TEMP = 1;
_LP0 = _LP0 + (    12736.0089863706) * _TEMP * _15_0;
_LP0 = _LP0 + (   -14055.7760826579) * _TEMP * _15_1;
_LP0 = _LP0 + (   -4929.32298035061) * _TEMP * _15_2;
_LP0 = _LP0 + (   -2106.92934601425) * _TEMP * _15_3;

***  Effect: Garage_Cars ;
_TEMP = Garage_Cars ;
_LP0 = _LP0 + (    8996.15359693248 * _TEMP);

***  Effect: Gr_Liv_Area ;
_TEMP = Gr_Liv_Area ;
_LP0 = _LP0 + (    55.3902228837991 * _TEMP);

***  Effect: Land_Contour ;
_TEMP = 1;
_LP0 = _LP0 + (   -5081.64428552808) * _TEMP * _16_0;
_LP0 = _LP0 + (    6900.54210263651) * _TEMP * _16_1;
_LP0 = _LP0 + (   -3234.88904036249) * _TEMP * _16_2;

***  Effect: Lot_Area ;
_TEMP = Lot_Area ;
_LP0 = _LP0 + (    0.31339484955751 * _TEMP);

***  Effect: Mas_Vnr_Area ;
_TEMP = Mas_Vnr_Area ;
_LP0 = _LP0 + (    16.2985773701351 * _TEMP);

***  Effect: Overall_Cond ;
_TEMP = Overall_Cond ;
_LP0 = _LP0 + (     5890.7322376418 * _TEMP);

***  Effect: Overall_Qual ;
_TEMP = Overall_Qual ;
_LP0 = _LP0 + (    7380.92883919355 * _TEMP);

***  Effect: Screen_Porch ;
_TEMP = Screen_Porch ;
_LP0 = _LP0 + (    41.9050575228443 * _TEMP);

***  Effect: Year_Built ;
_TEMP = Year_Built ;
_LP0 = _LP0 + (    375.064725501796 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (   -803043.872150006);

REGDR1:

*** Predicted Value, Error, and Residual;
label P_SalePrice = 'Predicted: SalePrice' ;
P_SalePrice = _LP0;

drop _R;
if _Y = . then do;
   R_SalePrice = .;
end;
else do;
   _R = _Y - _LP0;
    label R_SalePrice = 'Residual: SalePrice' ;
   R_SalePrice = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;