 
*------------------------------------------------------------*;
* Variable: DEPNDT;
*------------------------------------------------------------*;
LABEL GRP_DEPNDT =
"Grouped: DEPNDT";
 
if MISSING(DEPNDT) then do;
GRP_DEPNDT = 1;
end;
else if NOT MISSING(DEPNDT) then do;
if DEPNDT < 1 then do;
GRP_DEPNDT = 1;
end;
else
if 1 <= DEPNDT AND DEPNDT < 2 then do;
GRP_DEPNDT = 2;
end;
else
if 2 <= DEPNDT AND DEPNDT < 3 then do;
GRP_DEPNDT = 3;
end;
else
if 3 <= DEPNDT AND DEPNDT < 4 then do;
GRP_DEPNDT = 4;
end;
else
if 4 <= DEPNDT then do;
GRP_DEPNDT = 5;
end;
end;
