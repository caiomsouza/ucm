 
*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
LABEL GRP_INCOME =
"Grouped: INCOME";
 
if MISSING(INCOME) then do;
GRP_INCOME = 3;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.68 then do;
GRP_INCOME = 1;
end;
else
if 1.68 <= INCOME AND INCOME < 2.1 then do;
GRP_INCOME = 2;
end;
else
if 2.1 <= INCOME AND INCOME < 3.11 then do;
GRP_INCOME = 3;
end;
else
if 3.11 <= INCOME AND INCOME < 5.92 then do;
GRP_INCOME = 4;
end;
else
if 5.92 <= INCOME then do;
GRP_INCOME = 5;
end;
end;
