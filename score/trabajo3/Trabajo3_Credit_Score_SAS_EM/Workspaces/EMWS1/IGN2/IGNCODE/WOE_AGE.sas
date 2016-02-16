 
*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
LABEL WOE_AGE =
"Weight of Evidence: AGE";
 
if MISSING(AGE) then do;
WOE_AGE = 0.6003011055;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.58 then do;
WOE_AGE = 0.6003011055;
end;
else
if 27.58 <= AGE AND AGE < 32.58 then do;
WOE_AGE =  0.130780767;
end;
else
if 32.58 <= AGE AND AGE < 37.25 then do;
WOE_AGE = -0.502657689;
end;
else
if 37.25 <= AGE AND AGE < 52.42 then do;
WOE_AGE = -0.227437735;
end;
else
if 52.42 <= AGE then do;
WOE_AGE = -0.573134755;
end;
end;
