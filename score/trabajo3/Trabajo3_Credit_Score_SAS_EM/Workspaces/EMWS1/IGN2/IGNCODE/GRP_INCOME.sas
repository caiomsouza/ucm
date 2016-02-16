 
*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
LABEL GRP_INCOME =
"Grouped: INCOME";
 
if MISSING(INCOME) then do;
GRP_INCOME = 3;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.8 then do;
GRP_INCOME = 1;
end;
else
if 1.8 <= INCOME AND INCOME < 2.06 then do;
GRP_INCOME = 2;
end;
else
if 2.06 <= INCOME AND INCOME < 4.8 then do;
GRP_INCOME = 3;
end;
else
if 4.8 <= INCOME AND INCOME < 5.48 then do;
GRP_INCOME = 4;
end;
else
if 5.48 <= INCOME then do;
GRP_INCOME = 5;
end;
end;
