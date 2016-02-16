 
*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
LABEL WOE_AGE =
"Weight of Evidence: AGE";
 
if MISSING(AGE) then do;
WOE_AGE = 0.6508317962;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.75 then do;
WOE_AGE = 0.6508317962;
end;
else
if 27.75 <= AGE AND AGE < 29.83 then do;
WOE_AGE = -0.720195093;
end;
else
if 29.83 <= AGE AND AGE < 32.33 then do;
WOE_AGE = 1.5003250472;
end;
else
if 32.33 <= AGE AND AGE < 44.92 then do;
WOE_AGE = -0.456727278;
end;
else
if 44.92 <= AGE then do;
WOE_AGE = 0.0412713318;
end;
end;
