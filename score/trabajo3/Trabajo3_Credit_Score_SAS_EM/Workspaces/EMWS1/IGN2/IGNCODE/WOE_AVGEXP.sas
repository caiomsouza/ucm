 
*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
LABEL WOE_AVGEXP =
"Weight of Evidence: AVGEXP";
 
if MISSING(AVGEXP) then do;
WOE_AVGEXP = -0.038146471;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 12.65 then do;
WOE_AVGEXP = -0.038146471;
end;
else
if 12.65 <= AVGEXP AND AVGEXP < 57.44 then do;
WOE_AVGEXP = 0.7190904124;
end;
else
if 57.44 <= AVGEXP AND AVGEXP < 101.76 then do;
WOE_AVGEXP = -0.035614661;
end;
else
if 101.76 <= AVGEXP AND AVGEXP < 352.17 then do;
WOE_AVGEXP = 0.2241113341;
end;
else
if 352.17 <= AVGEXP then do;
WOE_AVGEXP = -0.534076026;
end;
end;
