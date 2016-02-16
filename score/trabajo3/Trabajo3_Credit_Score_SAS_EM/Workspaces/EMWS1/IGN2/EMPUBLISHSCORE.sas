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
WOE_ACTIVE = -0.028067235;
end;
else if NOT MISSING(ACTIVE) then do;
if ACTIVE < 2 then do;
GRP_ACTIVE = 1;
WOE_ACTIVE = 3.6995307206;
end;
else
if 2 <= ACTIVE AND ACTIVE < 12 then do;
GRP_ACTIVE = 2;
WOE_ACTIVE = -0.028067235;
end;
else
if 12 <= ACTIVE AND ACTIVE < 16 then do;
GRP_ACTIVE = 3;
WOE_ACTIVE = -0.989965504;
end;
else
if 16 <= ACTIVE AND ACTIVE < 19 then do;
GRP_ACTIVE = 4;
WOE_ACTIVE = -0.275327763;
end;
else
if 19 <= ACTIVE then do;
GRP_ACTIVE = 5;
WOE_ACTIVE =  -1.00825793;
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
WOE_AGE = 0.6003011055;
end;
else if NOT MISSING(AGE) then do;
if AGE < 27.58 then do;
GRP_AGE = 1;
WOE_AGE = 0.6003011055;
end;
else
if 27.58 <= AGE AND AGE < 32.58 then do;
GRP_AGE = 2;
WOE_AGE =  0.130780767;
end;
else
if 32.58 <= AGE AND AGE < 37.25 then do;
GRP_AGE = 3;
WOE_AGE = -0.502657689;
end;
else
if 37.25 <= AGE AND AGE < 52.42 then do;
GRP_AGE = 4;
WOE_AGE = -0.227437735;
end;
else
if 52.42 <= AGE then do;
GRP_AGE = 5;
WOE_AGE = -0.573134755;
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
WOE_AVGEXP = -0.038146471;
end;
else if NOT MISSING(AVGEXP) then do;
if AVGEXP < 12.65 then do;
GRP_AVGEXP = 1;
WOE_AVGEXP = -0.038146471;
end;
else
if 12.65 <= AVGEXP AND AVGEXP < 57.44 then do;
GRP_AVGEXP = 2;
WOE_AVGEXP = 0.7190904124;
end;
else
if 57.44 <= AVGEXP AND AVGEXP < 101.76 then do;
GRP_AVGEXP = 3;
WOE_AVGEXP = -0.035614661;
end;
else
if 101.76 <= AVGEXP AND AVGEXP < 352.17 then do;
GRP_AVGEXP = 4;
WOE_AVGEXP = 0.2241113341;
end;
else
if 352.17 <= AVGEXP then do;
GRP_AVGEXP = 5;
WOE_AVGEXP = -0.534076026;
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
GRP_CUR_ADD = 1;
WOE_CUR_ADD = 0.6668815422;
end;
else if NOT MISSING(CUR_ADD) then do;
if CUR_ADD < 24 then do;
GRP_CUR_ADD = 1;
WOE_CUR_ADD = 0.6668815422;
end;
else
if 24 <= CUR_ADD AND CUR_ADD < 49 then do;
GRP_CUR_ADD = 2;
WOE_CUR_ADD =  -0.20537362;
end;
else
if 49 <= CUR_ADD AND CUR_ADD < 108 then do;
GRP_CUR_ADD = 3;
WOE_CUR_ADD = -0.386407782;
end;
else
if 108 <= CUR_ADD AND CUR_ADD < 192 then do;
GRP_CUR_ADD = 4;
WOE_CUR_ADD = -0.093365009;
end;
else
if 192 <= CUR_ADD then do;
GRP_CUR_ADD = 5;
WOE_CUR_ADD = -0.610244006;
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
WOE_INCOME = 0.0680795741;
end;
else if NOT MISSING(INCOME) then do;
if INCOME < 1.8 then do;
GRP_INCOME = 1;
WOE_INCOME = 0.7162559049;
end;
else
if 1.8 <= INCOME AND INCOME < 2.06 then do;
GRP_INCOME = 2;
WOE_INCOME = -0.167356326;
end;
else
if 2.06 <= INCOME AND INCOME < 4.8 then do;
GRP_INCOME = 3;
WOE_INCOME = 0.0680795741;
end;
else
if 4.8 <= INCOME AND INCOME < 5.48 then do;
GRP_INCOME = 4;
WOE_INCOME =  0.809508884;
end;
else
if 5.48 <= INCOME then do;
GRP_INCOME = 5;
WOE_INCOME = -0.772831578;
end;
end;

*------------------------------------------------------------*;
* Valores de código especiales
*------------------------------------------------------------*;
