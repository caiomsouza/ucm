 
*------------------------------------------------------------*;
* Variable: ACTIVE;
*------------------------------------------------------------*;
LABEL WOE_ACTIVE =
"Weight of Evidence: ACTIVE";
 
if MISSING(ACTIVE) then do;
WOE_ACTIVE = 0.0427216583;
end;
else if NOT MISSING(ACTIVE) then do;
if ACTIVE < 2 then do;
WOE_ACTIVE = 2.9807326998;
end;
else
if 2 <= ACTIVE AND ACTIVE < 7 then do;
WOE_ACTIVE = 0.0427216583;
end;
else
if 7 <= ACTIVE AND ACTIVE < 11 then do;
WOE_ACTIVE = -0.177166329;
end;
else
if 11 <= ACTIVE AND ACTIVE < 12 then do;
WOE_ACTIVE =  0.858471161;
end;
else
if 12 <= ACTIVE then do;
WOE_ACTIVE = -0.822940251;
end;
end;
