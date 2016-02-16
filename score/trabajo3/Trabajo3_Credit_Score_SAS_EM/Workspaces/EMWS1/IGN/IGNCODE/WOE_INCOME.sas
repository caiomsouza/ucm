 
*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
LABEL WOE_INCOME =
"Weight of Evidence: INCOME";
 
if MISSING(INCOME) then do;
WOE_INCOME = 0.0468053802;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.68 then do;
WOE_INCOME = 0.8071778666;
end;
else
if 1.68 <= INCOME AND INCOME < 2.1 then do;
WOE_INCOME = -0.750966751;
end;
else
if 2.1 <= INCOME AND INCOME < 3.11 then do;
WOE_INCOME = 0.0468053802;
end;
else
if 3.11 <= INCOME AND INCOME < 5.92 then do;
WOE_INCOME = 0.5407116333;
end;
else
if 5.92 <= INCOME then do;
WOE_INCOME = -0.900498485;
end;
end;
