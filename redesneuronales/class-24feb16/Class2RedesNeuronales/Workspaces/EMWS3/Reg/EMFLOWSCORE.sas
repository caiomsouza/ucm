*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Avisos' ;

drop _Y;
_Y = FEV ;

drop _DM_BAD;
_DM_BAD=0;

*** Check Age for missing values ;
if missing( Age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Height for missing values ;
if missing( Height ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for Sex ;
drop _0_0 ;
if missing( Sex ) then do;
   _0_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( Sex , _dm8 )
   if _dm8 = 'MALE'  then do;
      _0_0 = -1;
   end;
   else if _dm8 = 'FEMALE'  then do;
      _0_0 = 1;
   end;
   else do;
      _0_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Smoker ;
drop _1_0 ;
if missing( Smoker ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( Smoker , _dm8 )
   if _dm8 = 'NON'  then do;
      _1_0 = -1;
   end;
   else if _dm8 = 'CURRENT'  then do;
      _1_0 = 1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     2.61260262008733;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (    0.07596045521159 * _TEMP);

***  Effect: Height ;
_TEMP = Height ;
_LP0 = _LP0 + (    0.09860769065413 * _TEMP);

***  Effect: Sex ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.07732643011341) * _TEMP * _0_0;

***  Effect: Smoker ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.02751443379397) * _TEMP * _1_0;
*--- Intercept ---*;
_LP0 = _LP0 + (   -4.17171847220485);

REGDR1:

*** Predicted Value, Error, and Residual;
label P_FEV = 'Predicted: FEV' ;
P_FEV = _LP0;

drop _R;
if _Y = . then do;
   R_FEV = .;
end;
else do;
   _R = _Y - _LP0;
    label R_FEV = 'Residual: FEV' ;
   R_FEV = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
