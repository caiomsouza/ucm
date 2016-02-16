 
*------------------------------------------------------------*;
* Variable: EXP_INC;
*------------------------------------------------------------*;
LABEL WOE_EXP_INC =
"Weight of Evidence: EXP_INC";
 
if MISSING(EXP_INC) then do;
WOE_EXP_INC = -0.096040784;
end;
else if NOT MISSING(EXP_INC) then do;
if EXP_INC < 0.04 then do;
WOE_EXP_INC = -0.245418185;
end;
else
if 0.04 <= EXP_INC AND EXP_INC < 0.05 then do;
WOE_EXP_INC = 1.8700720727;
end;
else
if 0.05 <= EXP_INC AND EXP_INC < 0.06 then do;
WOE_EXP_INC = -0.240141128;
end;
else
if 0.06 <= EXP_INC AND EXP_INC < 0.07 then do;
WOE_EXP_INC = 1.9402763313;
end;
else
if 0.07 <= EXP_INC then do;
WOE_EXP_INC = -0.096040784;
end;
end;
