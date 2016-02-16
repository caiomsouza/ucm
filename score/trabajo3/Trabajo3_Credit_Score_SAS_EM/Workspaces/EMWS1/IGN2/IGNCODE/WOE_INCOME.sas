 
*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
LABEL WOE_INCOME =
"Weight of Evidence: INCOME";
 
if MISSING(INCOME) then do;
WOE_INCOME = 0.0680795741;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.8 then do;
WOE_INCOME = 0.7162559049;
end;
else
if 1.8 <= INCOME AND INCOME < 2.06 then do;
WOE_INCOME = -0.167356326;
end;
else
if 2.06 <= INCOME AND INCOME < 4.8 then do;
WOE_INCOME = 0.0680795741;
end;
else
if 4.8 <= INCOME AND INCOME < 5.48 then do;
WOE_INCOME =  0.809508884;
end;
else
if 5.48 <= INCOME then do;
WOE_INCOME = -0.772831578;
end;
end;
