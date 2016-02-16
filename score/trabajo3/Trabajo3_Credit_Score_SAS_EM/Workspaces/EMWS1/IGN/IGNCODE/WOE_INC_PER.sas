 
*------------------------------------------------------------*;
* Variable: INC_PER;
*------------------------------------------------------------*;
LABEL WOE_INC_PER =
"Weight of Evidence: INC_PER";
 
if MISSING(INC_PER) then do;
WOE_INC_PER = 0.4620558884;
end;
else if NOT MISSING(INC_PER) then do;
if INC_PER < 1.68 then do;
WOE_INC_PER = 0.4620558884;
end;
else
if 1.68 <= INC_PER AND INC_PER < 1.86 then do;
WOE_INC_PER = -1.038648824;
end;
else
if 1.86 <= INC_PER AND INC_PER < 2.5 then do;
WOE_INC_PER = 0.3336592952;
end;
else
if 2.5 <= INC_PER AND INC_PER < 3.75 then do;
WOE_INC_PER = -0.122358092;
end;
else
if 3.75 <= INC_PER then do;
WOE_INC_PER = -0.750966751;
end;
end;
