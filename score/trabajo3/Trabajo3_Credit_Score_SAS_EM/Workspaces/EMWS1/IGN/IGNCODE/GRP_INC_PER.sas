 
*------------------------------------------------------------*;
* Variable: INC_PER;
*------------------------------------------------------------*;
LABEL GRP_INC_PER =
"Grouped: INC_PER";
 
if MISSING(INC_PER) then do;
GRP_INC_PER = 1;
end;
else if NOT MISSING(INC_PER) then do;
if INC_PER < 1.68 then do;
GRP_INC_PER = 1;
end;
else
if 1.68 <= INC_PER AND INC_PER < 1.86 then do;
GRP_INC_PER = 2;
end;
else
if 1.86 <= INC_PER AND INC_PER < 2.5 then do;
GRP_INC_PER = 3;
end;
else
if 2.5 <= INC_PER AND INC_PER < 3.75 then do;
GRP_INC_PER = 4;
end;
else
if 3.75 <= INC_PER then do;
GRP_INC_PER = 5;
end;
end;
