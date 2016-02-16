 
*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
LABEL WOE_AVGEXP =
"Weight of Evidence: AVGEXP";
 
if MISSING(AVGEXP) then do;
WOE_AVGEXP = -0.265458936;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 87.15 then do;
WOE_AVGEXP = -0.265458936;
end;
else
if 87.15 <= AVGEXP AND AVGEXP < 132.85 then do;
WOE_AVGEXP = 0.4837777115;
end;
else
if 132.85 <= AVGEXP AND AVGEXP < 175.44 then do;
WOE_AVGEXP = 2.2321867399;
end;
else
if 175.44 <= AVGEXP AND AVGEXP < 420.58 then do;
WOE_AVGEXP = 0.2606341602;
end;
else
if 420.58 <= AVGEXP then do;
WOE_AVGEXP = -0.750966751;
end;
end;
