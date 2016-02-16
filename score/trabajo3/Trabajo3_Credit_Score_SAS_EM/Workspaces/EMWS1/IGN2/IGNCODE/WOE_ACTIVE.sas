 
*------------------------------------------------------------*;
* Variable: ACTIVE;
*------------------------------------------------------------*;
LABEL WOE_ACTIVE =
"Weight of Evidence: ACTIVE";
 
if MISSING(ACTIVE) then do;
WOE_ACTIVE = -0.028067235;
end;
else if NOT MISSING(ACTIVE) then do;
if ACTIVE < 2 then do;
WOE_ACTIVE = 3.6995307206;
end;
else
if 2 <= ACTIVE AND ACTIVE < 12 then do;
WOE_ACTIVE = -0.028067235;
end;
else
if 12 <= ACTIVE AND ACTIVE < 16 then do;
WOE_ACTIVE = -0.989965504;
end;
else
if 16 <= ACTIVE AND ACTIVE < 19 then do;
WOE_ACTIVE = -0.275327763;
end;
else
if 19 <= ACTIVE then do;
WOE_ACTIVE =  -1.00825793;
end;
end;
