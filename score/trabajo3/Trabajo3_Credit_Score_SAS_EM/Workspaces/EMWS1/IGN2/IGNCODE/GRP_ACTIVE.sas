 
*------------------------------------------------------------*;
* Variable: ACTIVE;
*------------------------------------------------------------*;
LABEL GRP_ACTIVE =
"Grouped: ACTIVE";
 
if MISSING(ACTIVE) then do;
GRP_ACTIVE = 2;
end;
else if NOT MISSING(ACTIVE) then do;
if ACTIVE < 2 then do;
GRP_ACTIVE = 1;
end;
else
if 2 <= ACTIVE AND ACTIVE < 12 then do;
GRP_ACTIVE = 2;
end;
else
if 12 <= ACTIVE AND ACTIVE < 16 then do;
GRP_ACTIVE = 3;
end;
else
if 16 <= ACTIVE AND ACTIVE < 19 then do;
GRP_ACTIVE = 4;
end;
else
if 19 <= ACTIVE then do;
GRP_ACTIVE = 5;
end;
end;
