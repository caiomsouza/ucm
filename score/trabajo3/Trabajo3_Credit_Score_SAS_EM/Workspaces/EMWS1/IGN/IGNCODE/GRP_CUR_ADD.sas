 
*------------------------------------------------------------*;
* Variable: CUR_ADD;
*------------------------------------------------------------*;
LABEL GRP_CUR_ADD =
"Grouped: CUR_ADD";
 
if MISSING(CUR_ADD) then do;
GRP_CUR_ADD = 4;
end;
else if NOT MISSING(CUR_ADD) then do;
if CUR_ADD < 6 then do;
GRP_CUR_ADD = 1;
end;
else
if 6 <= CUR_ADD AND CUR_ADD < 12 then do;
GRP_CUR_ADD = 2;
end;
else
if 12 <= CUR_ADD AND CUR_ADD < 24 then do;
GRP_CUR_ADD = 3;
end;
else
if 24 <= CUR_ADD AND CUR_ADD < 94 then do;
GRP_CUR_ADD = 4;
end;
else
if 94 <= CUR_ADD then do;
GRP_CUR_ADD = 5;
end;
end;
