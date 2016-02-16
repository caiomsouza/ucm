 
*------------------------------------------------------------*;
* Variable: CUR_ADD;
*------------------------------------------------------------*;
LABEL WOE_CUR_ADD =
"Weight of Evidence: CUR_ADD";
 
if MISSING(CUR_ADD) then do;
WOE_CUR_ADD = 0.6668815422;
end;
else if NOT MISSING(CUR_ADD) then do;
if CUR_ADD < 24 then do;
WOE_CUR_ADD = 0.6668815422;
end;
else
if 24 <= CUR_ADD AND CUR_ADD < 49 then do;
WOE_CUR_ADD =  -0.20537362;
end;
else
if 49 <= CUR_ADD AND CUR_ADD < 108 then do;
WOE_CUR_ADD = -0.386407782;
end;
else
if 108 <= CUR_ADD AND CUR_ADD < 192 then do;
WOE_CUR_ADD = -0.093365009;
end;
else
if 192 <= CUR_ADD then do;
WOE_CUR_ADD = -0.610244006;
end;
end;
