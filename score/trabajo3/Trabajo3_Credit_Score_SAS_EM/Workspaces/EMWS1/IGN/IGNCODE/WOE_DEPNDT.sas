 
*------------------------------------------------------------*;
* Variable: DEPNDT;
*------------------------------------------------------------*;
LABEL WOE_DEPNDT =
"Weight of Evidence: DEPNDT";
 
if MISSING(DEPNDT) then do;
WOE_DEPNDT = -0.133531393;
end;
else if NOT MISSING(DEPNDT) then do;
if DEPNDT < 1 then do;
WOE_DEPNDT = -0.133531393;
end;
else
if 1 <= DEPNDT AND DEPNDT < 2 then do;
WOE_DEPNDT = -0.016997576;
end;
else
if 2 <= DEPNDT AND DEPNDT < 3 then do;
WOE_DEPNDT = 0.2045446936;
end;
else
if 3 <= DEPNDT AND DEPNDT < 4 then do;
WOE_DEPNDT = -0.089568269;
end;
else
if 4 <= DEPNDT then do;
WOE_DEPNDT = 1.5763109541;
end;
end;
