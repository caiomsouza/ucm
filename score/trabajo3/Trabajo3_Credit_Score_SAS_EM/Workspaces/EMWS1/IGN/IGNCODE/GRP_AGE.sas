 
*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
LABEL GRP_AGE =
"Grouped: AGE";
 
if MISSING(AGE) then do;
GRP_AGE = 1;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.75 then do;
GRP_AGE = 1;
end;
else
if 27.75 <= AGE AND AGE < 29.83 then do;
GRP_AGE = 2;
end;
else
if 29.83 <= AGE AND AGE < 32.33 then do;
GRP_AGE = 3;
end;
else
if 32.33 <= AGE AND AGE < 44.92 then do;
GRP_AGE = 4;
end;
else
if 44.92 <= AGE then do;
GRP_AGE = 5;
end;
end;
