*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Avisos' ;


drop _DM_BAD;
_DM_BAD=0;

*** Check EXER for missing values ;
if missing( EXER ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check HEART for missing values ;
if missing( HEART ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for SEX ;
drop _0_0 ;
if missing( SEX ) then do;
   _0_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( SEX , _dm8 )
   if _dm8 = 'F'  then do;
      _0_0 = 1;
   end;
   else if _dm8 = 'M'  then do;
      _0_0 = -1;
   end;
   else do;
      _0_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     32.8935483870967;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: EXER ;
_TEMP = EXER ;
_LP0 = _LP0 + (    1.59111347045909 * _TEMP);

***  Effect: HEART ;
_TEMP = HEART ;
_LP0 = _LP0 + (   -0.27394216661046 * _TEMP);

***  Effect: SEX ;
_TEMP = 1;
_LP0 = _LP0 + (   -6.56160818926628) * _TEMP * _0_0;
*--- Intercept ---*;
_LP0 = _LP0 + (    49.9044397105592);

REGDR1:

*** Predicted Value;
label P_AERO = 'Predicted: AERO' ;
P_AERO = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
