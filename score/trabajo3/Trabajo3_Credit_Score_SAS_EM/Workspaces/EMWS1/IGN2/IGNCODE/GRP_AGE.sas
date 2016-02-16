 
*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
LABEL GRP_AGE =
"Grouped: AGE";
 
if MISSING(AGE) then do;
GRP_AGE = 1;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.58 then do;
GRP_AGE = 1;
end;
else
if 27.58 <= AGE AND AGE < 32.58 then do;
GRP_AGE = 2;
end;
else
if 32.58 <= AGE AND AGE < 37.25 then do;
GRP_AGE = 3;
end;
else
if 37.25 <= AGE AND AGE < 52.42 then do;
GRP_AGE = 4;
end;
else
if 52.42 <= AGE then do;
GRP_AGE = 5;
end;
end;
