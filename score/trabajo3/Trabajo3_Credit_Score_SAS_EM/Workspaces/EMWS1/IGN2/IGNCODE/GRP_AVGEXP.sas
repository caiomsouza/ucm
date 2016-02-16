 
*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
LABEL GRP_AVGEXP =
"Grouped: AVGEXP";
 
if MISSING(AVGEXP) then do;
GRP_AVGEXP = 1;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 12.65 then do;
GRP_AVGEXP = 1;
end;
else
if 12.65 <= AVGEXP AND AVGEXP < 57.44 then do;
GRP_AVGEXP = 2;
end;
else
if 57.44 <= AVGEXP AND AVGEXP < 101.76 then do;
GRP_AVGEXP = 3;
end;
else
if 101.76 <= AVGEXP AND AVGEXP < 352.17 then do;
GRP_AVGEXP = 4;
end;
else
if 352.17 <= AVGEXP then do;
GRP_AVGEXP = 5;
end;
end;
