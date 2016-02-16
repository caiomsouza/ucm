 
*------------------------------------------------------------*;
* Variable: CUR_ADD;
*------------------------------------------------------------*;
LABEL WOE_CUR_ADD =
"Weight of Evidence: CUR_ADD";
 
if MISSING(CUR_ADD) then do;
WOE_CUR_ADD = -0.479033036;
end;
else if NOT MISSING(CUR_ADD) then do;
if CUR_ADD < 6 then do;
WOE_CUR_ADD =  1.389099412;
end;
else
if 6 <= CUR_ADD AND CUR_ADD < 12 then do;
WOE_CUR_ADD = -0.298981628;
end;
else
if 12 <= CUR_ADD AND CUR_ADD < 24 then do;
WOE_CUR_ADD = 1.1335744512;
end;
else
if 24 <= CUR_ADD AND CUR_ADD < 94 then do;
WOE_CUR_ADD = -0.479033036;
end;
else
if 94 <= CUR_ADD then do;
WOE_CUR_ADD = 0.2072881795;
end;
end;
