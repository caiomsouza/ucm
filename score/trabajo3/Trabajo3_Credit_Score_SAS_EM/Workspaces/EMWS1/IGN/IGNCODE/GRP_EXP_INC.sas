 
*------------------------------------------------------------*;
* Variable: EXP_INC;
*------------------------------------------------------------*;
LABEL GRP_EXP_INC =
"Grouped: EXP_INC";
 
if MISSING(EXP_INC) then do;
GRP_EXP_INC = 5;
end;
else if NOT MISSING(EXP_INC) then do;
if EXP_INC < 0.04 then do;
GRP_EXP_INC = 1;
end;
else
if 0.04 <= EXP_INC AND EXP_INC < 0.05 then do;
GRP_EXP_INC = 2;
end;
else
if 0.05 <= EXP_INC AND EXP_INC < 0.06 then do;
GRP_EXP_INC = 3;
end;
else
if 0.06 <= EXP_INC AND EXP_INC < 0.07 then do;
GRP_EXP_INC = 4;
end;
else
if 0.07 <= EXP_INC then do;
GRP_EXP_INC = 5;
end;
end;
