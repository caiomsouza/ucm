 
*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
LABEL GRP_AVGEXP =
"Grouped: AVGEXP";
 
if MISSING(AVGEXP) then do;
GRP_AVGEXP = 1;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 87.15 then do;
GRP_AVGEXP = 1;
end;
else
if 87.15 <= AVGEXP AND AVGEXP < 132.85 then do;
GRP_AVGEXP = 2;
end;
else
if 132.85 <= AVGEXP AND AVGEXP < 175.44 then do;
GRP_AVGEXP = 3;
end;
else
if 175.44 <= AVGEXP AND AVGEXP < 420.58 then do;
GRP_AVGEXP = 4;
end;
else
if 420.58 <= AVGEXP then do;
GRP_AVGEXP = 5;
end;
end;
