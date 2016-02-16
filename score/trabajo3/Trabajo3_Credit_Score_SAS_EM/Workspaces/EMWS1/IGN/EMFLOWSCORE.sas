length _UFormat $200;
drop _UFormat;
_UFormat='';
 
*------------------------------------------------------------*;
* Variable: ACTIVE;
*------------------------------------------------------------*;
LABEL GRP_ACTIVE =
"Grouped: ACTIVE";
LABEL WOE_ACTIVE =
"Weight of Evidence: ACTIVE";
 
if MISSING(ACTIVE) then do;
GRP_ACTIVE = 2;
WOE_ACTIVE = 0.0427216583;
end;
else if NOT MISSING(ACTIVE) then do;
if ACTIVE < 2 then do;
GRP_ACTIVE = 1;
WOE_ACTIVE = 2.9807326998;
end;
else
if 2 <= ACTIVE AND ACTIVE < 7 then do;
GRP_ACTIVE = 2;
WOE_ACTIVE = 0.0427216583;
end;
else
if 7 <= ACTIVE AND ACTIVE < 11 then do;
GRP_ACTIVE = 3;
WOE_ACTIVE = -0.177166329;
end;
else
if 11 <= ACTIVE AND ACTIVE < 12 then do;
GRP_ACTIVE = 4;
WOE_ACTIVE =  0.858471161;
end;
else
if 12 <= ACTIVE then do;
GRP_ACTIVE = 5;
WOE_ACTIVE = -0.822940251;
end;
end;
 
*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
LABEL GRP_AGE =
"Grouped: AGE";
LABEL WOE_AGE =
"Weight of Evidence: AGE";
 
if MISSING(AGE) then do;
GRP_AGE = 1;
WOE_AGE = 0.6508317962;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.75 then do;
GRP_AGE = 1;
WOE_AGE = 0.6508317962;
end;
else
if 27.75 <= AGE AND AGE < 29.83 then do;
GRP_AGE = 2;
WOE_AGE = -0.720195093;
end;
else
if 29.83 <= AGE AND AGE < 32.33 then do;
GRP_AGE = 3;
WOE_AGE = 1.5003250472;
end;
else
if 32.33 <= AGE AND AGE < 44.92 then do;
GRP_AGE = 4;
WOE_AGE = -0.456727278;
end;
else
if 44.92 <= AGE then do;
GRP_AGE = 5;
WOE_AGE = 0.0412713318;
end;
end;
 
*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
LABEL GRP_AVGEXP =
"Grouped: AVGEXP";
LABEL WOE_AVGEXP =
"Weight of Evidence: AVGEXP";
 
if MISSING(AVGEXP) then do;
GRP_AVGEXP = 1;
WOE_AVGEXP = -0.265458936;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 87.15 then do;
GRP_AVGEXP = 1;
WOE_AVGEXP = -0.265458936;
end;
else
if 87.15 <= AVGEXP AND AVGEXP < 132.85 then do;
GRP_AVGEXP = 2;
WOE_AVGEXP = 0.4837777115;
end;
else
if 132.85 <= AVGEXP AND AVGEXP < 175.44 then do;
GRP_AVGEXP = 3;
WOE_AVGEXP = 2.2321867399;
end;
else
if 175.44 <= AVGEXP AND AVGEXP < 420.58 then do;
GRP_AVGEXP = 4;
WOE_AVGEXP = 0.2606341602;
end;
else
if 420.58 <= AVGEXP then do;
GRP_AVGEXP = 5;
WOE_AVGEXP = -0.750966751;
end;
end;
 
*------------------------------------------------------------*;
* Variable: CUR_ADD;
*------------------------------------------------------------*;
LABEL GRP_CUR_ADD =
"Grouped: CUR_ADD";
LABEL WOE_CUR_ADD =
"Weight of Evidence: CUR_ADD";
 
if MISSING(CUR_ADD) then do;
GRP_CUR_ADD = 4;
WOE_CUR_ADD = -0.479033036;
end;
else if NOT MISSING(CUR_ADD) then do;
if CUR_ADD < 6 then do;
GRP_CUR_ADD = 1;
WOE_CUR_ADD =  1.389099412;
end;
else
if 6 <= CUR_ADD AND CUR_ADD < 12 then do;
GRP_CUR_ADD = 2;
WOE_CUR_ADD = -0.298981628;
end;
else
if 12 <= CUR_ADD AND CUR_ADD < 24 then do;
GRP_CUR_ADD = 3;
WOE_CUR_ADD = 1.1335744512;
end;
else
if 24 <= CUR_ADD AND CUR_ADD < 94 then do;
GRP_CUR_ADD = 4;
WOE_CUR_ADD = -0.479033036;
end;
else
if 94 <= CUR_ADD then do;
GRP_CUR_ADD = 5;
WOE_CUR_ADD = 0.2072881795;
end;
end;
 
*------------------------------------------------------------*;
* Variable: DEPNDT;
*------------------------------------------------------------*;
LABEL GRP_DEPNDT =
"Grouped: DEPNDT";
LABEL WOE_DEPNDT =
"Weight of Evidence: DEPNDT";
 
if MISSING(DEPNDT) then do;
GRP_DEPNDT = 1;
WOE_DEPNDT = -0.133531393;
end;
else if NOT MISSING(DEPNDT) then do;
if DEPNDT < 1 then do;
GRP_DEPNDT = 1;
WOE_DEPNDT = -0.133531393;
end;
else
if 1 <= DEPNDT AND DEPNDT < 2 then do;
GRP_DEPNDT = 2;
WOE_DEPNDT = -0.016997576;
end;
else
if 2 <= DEPNDT AND DEPNDT < 3 then do;
GRP_DEPNDT = 3;
WOE_DEPNDT = 0.2045446936;
end;
else
if 3 <= DEPNDT AND DEPNDT < 4 then do;
GRP_DEPNDT = 4;
WOE_DEPNDT = -0.089568269;
end;
else
if 4 <= DEPNDT then do;
GRP_DEPNDT = 5;
WOE_DEPNDT = 1.5763109541;
end;
end;
 
*------------------------------------------------------------*;
* Variable: EXP_INC;
*------------------------------------------------------------*;
LABEL GRP_EXP_INC =
"Grouped: EXP_INC";
LABEL WOE_EXP_INC =
"Weight of Evidence: EXP_INC";
 
if MISSING(EXP_INC) then do;
GRP_EXP_INC = 5;
WOE_EXP_INC = -0.096040784;
end;
else if NOT MISSING(EXP_INC) then do;
if EXP_INC < 0.04 then do;
GRP_EXP_INC = 1;
WOE_EXP_INC = -0.245418185;
end;
else
if 0.04 <= EXP_INC AND EXP_INC < 0.05 then do;
GRP_EXP_INC = 2;
WOE_EXP_INC = 1.8700720727;
end;
else
if 0.05 <= EXP_INC AND EXP_INC < 0.06 then do;
GRP_EXP_INC = 3;
WOE_EXP_INC = -0.240141128;
end;
else
if 0.06 <= EXP_INC AND EXP_INC < 0.07 then do;
GRP_EXP_INC = 4;
WOE_EXP_INC = 1.9402763313;
end;
else
if 0.07 <= EXP_INC then do;
GRP_EXP_INC = 5;
WOE_EXP_INC = -0.096040784;
end;
end;
 
*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
LABEL GRP_INCOME =
"Grouped: INCOME";
LABEL WOE_INCOME =
"Weight of Evidence: INCOME";
 
if MISSING(INCOME) then do;
GRP_INCOME = 3;
WOE_INCOME = 0.0468053802;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.68 then do;
GRP_INCOME = 1;
WOE_INCOME = 0.8071778666;
end;
else
if 1.68 <= INCOME AND INCOME < 2.1 then do;
GRP_INCOME = 2;
WOE_INCOME = -0.750966751;
end;
else
if 2.1 <= INCOME AND INCOME < 3.11 then do;
GRP_INCOME = 3;
WOE_INCOME = 0.0468053802;
end;
else
if 3.11 <= INCOME AND INCOME < 5.92 then do;
GRP_INCOME = 4;
WOE_INCOME = 0.5407116333;
end;
else
if 5.92 <= INCOME then do;
GRP_INCOME = 5;
WOE_INCOME = -0.900498485;
end;
end;
 
*------------------------------------------------------------*;
* Variable: INC_PER;
*------------------------------------------------------------*;
LABEL GRP_INC_PER =
"Grouped: INC_PER";
LABEL WOE_INC_PER =
"Weight of Evidence: INC_PER";
 
if MISSING(INC_PER) then do;
GRP_INC_PER = 1;
WOE_INC_PER = 0.4620558884;
end;
else if NOT MISSING(INC_PER) then do;
if INC_PER < 1.68 then do;
GRP_INC_PER = 1;
WOE_INC_PER = 0.4620558884;
end;
else
if 1.68 <= INC_PER AND INC_PER < 1.86 then do;
GRP_INC_PER = 2;
WOE_INC_PER = -1.038648824;
end;
else
if 1.86 <= INC_PER AND INC_PER < 2.5 then do;
GRP_INC_PER = 3;
WOE_INC_PER = 0.3336592952;
end;
else
if 2.5 <= INC_PER AND INC_PER < 3.75 then do;
GRP_INC_PER = 4;
WOE_INC_PER = -0.122358092;
end;
else
if 3.75 <= INC_PER then do;
GRP_INC_PER = 5;
WOE_INC_PER = -0.750966751;
end;
end;
 
*------------------------------------------------------------*;
* Valores de código especiales
*------------------------------------------------------------*;
