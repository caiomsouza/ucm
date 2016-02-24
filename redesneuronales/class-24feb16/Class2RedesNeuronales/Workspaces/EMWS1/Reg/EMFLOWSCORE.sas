*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Avisos' ;

drop _Y;
_Y = hat ;

drop _DM_BAD;
_DM_BAD=0;

*** Check x1 for missing values ;
if missing( x1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check x2 for missing values ;
if missing( x2 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =    -0.27662261117926;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: x1 ;
_TEMP = x1 ;
_LP0 = _LP0 + (-2.1971018421772E-19 * _TEMP);

***  Effect: x2 ;
_TEMP = x2 ;
_LP0 = _LP0 + (  3.075942579048E-18 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (   -0.27662261117926);

REGDR1:

*** Predicted Value, Error, and Residual;
label P_hat = 'Predicted: hat' ;
P_hat = _LP0;

drop _R;
if _Y = . then do;
   R_hat = .;
end;
else do;
   _R = _Y - _LP0;
    label R_hat = 'Residual: hat' ;
   R_hat = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
