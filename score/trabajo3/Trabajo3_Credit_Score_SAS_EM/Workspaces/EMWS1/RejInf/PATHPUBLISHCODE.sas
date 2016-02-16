*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: CREDSCORE;
* NODE: IGN;
*------------------------------------------------------------*;
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
*------------------------------------------------------------*;
* TOOL: Scorecard;
* TYPE: MODEL;
* NODE: Scorecard3;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Avisos' ;

length I_DEFAULT $ 10;
label I_DEFAULT = 'Into: DEFAULT' ;
*** Target Values;
array SCORECARD3DRF [2] $10 _temporary_ ('1.00' '0.00' );
label U_DEFAULT = 'Unnormalized Into: DEFAULT' ;
format U_DEFAULT COMMA10.2;
*** Unnormalized target values;
ARRAY SCORECARD3DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check WOE_AGE for missing values ;
if missing( WOE_AGE ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WOE_INCOME for missing values ;
if missing( WOE_INCOME ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WOE_ACTIVE for missing values ;
if missing( WOE_ACTIVE ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WOE_AVGEXP for missing values ;
if missing( WOE_AVGEXP ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WOE_CUR_ADD for missing values ;
if missing( WOE_CUR_ADD ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WOE_DEPNDT for missing values ;
if missing( WOE_DEPNDT ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.1055276382;
   _P1 = 0.8944723618;
   goto SCORECARD3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: WOE_AGE ;
_TEMP = WOE_AGE ;
_LP0 = _LP0 + (   -0.91540730259371 * _TEMP);

***  Effect: WOE_INCOME ;
_TEMP = WOE_INCOME ;
_LP0 = _LP0 + (   -0.93002445933467 * _TEMP);

***  Effect: WOE_ACTIVE ;
_TEMP = WOE_ACTIVE ;
_LP0 = _LP0 + (   -1.02847239472468 * _TEMP);

***  Effect: WOE_AVGEXP ;
_TEMP = WOE_AVGEXP ;
_LP0 = _LP0 + (   -1.02429583669503 * _TEMP);

***  Effect: WOE_CUR_ADD ;
_TEMP = WOE_CUR_ADD ;
_LP0 = _LP0 + (   -0.83037702275877 * _TEMP);

***  Effect: WOE_DEPNDT ;
_TEMP = WOE_DEPNDT ;
_LP0 = _LP0 + (   -2.55978353395587 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -2.24522798128165 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

SCORECARD3DR1:


*** Posterior Probabilities and Predicted Level;
label P_DEFAULT1_00 = 'Predicted: DEFAULT=1.00' ;
label P_DEFAULT0_00 = 'Predicted: DEFAULT=0.00' ;
P_DEFAULT1_00 = _P0;
_MAXP = _P0;
_IY = 1;
P_DEFAULT0_00 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DEFAULT = SCORECARD3DRF[_IY];
U_DEFAULT = SCORECARD3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* generateScorepoints_note;
*------------------------------------------------------------*;
SCORECARD_POINTS = 0;

*------------------------------------------------------------*;
* Variable: ACTIVE;
*------------------------------------------------------------*;
if MISSING(ACTIVE) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 27;
SCR_ACTIVE= 27;
end;
else if NOT MISSING(ACTIVE) AND ACTIVE < 2 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 114;
SCR_ACTIVE = 114;
end;
else if NOT MISSING(ACTIVE) and 2 <= ACTIVE AND ACTIVE < 7 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 27;
SCR_ACTIVE = 27;
end;
else if NOT MISSING(ACTIVE) and 7 <= ACTIVE AND ACTIVE < 11 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 20;
SCR_ACTIVE = 20;
end;
else if NOT MISSING(ACTIVE) and 11 <= ACTIVE AND ACTIVE < 12 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 51;
SCR_ACTIVE = 51;
end;
else if NOT MISSING(ACTIVE) and 12 <= ACTIVE then do;
SCORECARD_POINTS = SCORECARD_POINTS + 1;
SCR_ACTIVE = 1;
end;

*------------------------------------------------------------*;
* Variable: AGE;
*------------------------------------------------------------*;
if MISSING(AGE) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 43;
SCR_AGE= 43;
end;
else if NOT MISSING(AGE) AND AGE < 27.75 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 43;
SCR_AGE = 43;
end;
else if NOT MISSING(AGE) and 27.75 <= AGE AND AGE < 29.83 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 6;
SCR_AGE = 6;
end;
else if NOT MISSING(AGE) and 29.83 <= AGE AND AGE < 32.33 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 65;
SCR_AGE = 65;
end;
else if NOT MISSING(AGE) and 32.33 <= AGE AND AGE < 44.92 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 13;
SCR_AGE = 13;
end;
else if NOT MISSING(AGE) and 44.92 <= AGE then do;
SCORECARD_POINTS = SCORECARD_POINTS + 26;
SCR_AGE = 26;
end;

*------------------------------------------------------------*;
* Variable: AVGEXP;
*------------------------------------------------------------*;
if MISSING(AVGEXP) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 17;
SCR_AVGEXP= 17;
end;
else if NOT MISSING(AVGEXP) AND AVGEXP < 87.15 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 17;
SCR_AVGEXP = 17;
end;
else if NOT MISSING(AVGEXP) and 87.15 <= AVGEXP AND AVGEXP < 132.85 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 40;
SCR_AVGEXP = 40;
end;
else if NOT MISSING(AVGEXP) and 132.85 <= AVGEXP AND AVGEXP < 175.44 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 91;
SCR_AVGEXP = 91;
end;
else if NOT MISSING(AVGEXP) and 175.44 <= AVGEXP AND AVGEXP < 420.58 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 33;
SCR_AVGEXP = 33;
end;
else if NOT MISSING(AVGEXP) and 420.58 <= AVGEXP then do;
SCORECARD_POINTS = SCORECARD_POINTS + 3;
SCR_AVGEXP = 3;
end;

*------------------------------------------------------------*;
* Variable: CUR_ADD;
*------------------------------------------------------------*;
if MISSING(CUR_ADD) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 14;
SCR_CUR_ADD= 14;
end;
else if NOT MISSING(CUR_ADD) AND CUR_ADD < 6 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 59;
SCR_CUR_ADD = 59;
end;
else if NOT MISSING(CUR_ADD) and 6 <= CUR_ADD AND CUR_ADD < 12 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 18;
SCR_CUR_ADD = 18;
end;
else if NOT MISSING(CUR_ADD) and 12 <= CUR_ADD AND CUR_ADD < 24 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 52;
SCR_CUR_ADD = 52;
end;
else if NOT MISSING(CUR_ADD) and 24 <= CUR_ADD AND CUR_ADD < 94 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 14;
SCR_CUR_ADD = 14;
end;
else if NOT MISSING(CUR_ADD) and 94 <= CUR_ADD then do;
SCORECARD_POINTS = SCORECARD_POINTS + 30;
SCR_CUR_ADD = 30;
end;

*------------------------------------------------------------*;
* Variable: DEPNDT;
*------------------------------------------------------------*;
if MISSING(DEPNDT) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 15;
SCR_DEPNDT= 15;
end;
else if NOT MISSING(DEPNDT) AND DEPNDT < 1 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 15;
SCR_DEPNDT = 15;
end;
else if NOT MISSING(DEPNDT) and 1 <= DEPNDT AND DEPNDT < 2 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 24;
SCR_DEPNDT = 24;
end;
else if NOT MISSING(DEPNDT) and 2 <= DEPNDT AND DEPNDT < 3 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 40;
SCR_DEPNDT = 40;
end;
else if NOT MISSING(DEPNDT) and 3 <= DEPNDT AND DEPNDT < 4 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 19;
SCR_DEPNDT = 19;
end;
else if NOT MISSING(DEPNDT) and 4 <= DEPNDT then do;
SCORECARD_POINTS = SCORECARD_POINTS + 142;
SCR_DEPNDT = 142;
end;

*------------------------------------------------------------*;
* Variable: INCOME;
*------------------------------------------------------------*;
if MISSING(INCOME) then do;
SCORECARD_POINTS = SCORECARD_POINTS + 27;
SCR_INCOME= 27;
end;
else if NOT MISSING(INCOME) AND INCOME < 1.68 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 47;
SCR_INCOME = 47;
end;
else if NOT MISSING(INCOME) and 1.68 <= INCOME AND INCOME < 2.1 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 5;
SCR_INCOME = 5;
end;
else if NOT MISSING(INCOME) and 2.1 <= INCOME AND INCOME < 3.11 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 27;
SCR_INCOME = 27;
end;
else if NOT MISSING(INCOME) and 3.11 <= INCOME AND INCOME < 5.92 then do;
SCORECARD_POINTS = SCORECARD_POINTS + 40;
SCR_INCOME = 40;
end;
else if NOT MISSING(INCOME) and 5.92 <= INCOME then do;
SCORECARD_POINTS = SCORECARD_POINTS + 1;
SCR_INCOME = 1;
end;
*;
* Assign SCORECARD_BIN values;
*;
if SCORECARD_POINTS < 54 then SCORECARD_BIN = 1;
else if SCORECARD_POINTS < 68 then SCORECARD_BIN = 2;
else if SCORECARD_POINTS < 82 then SCORECARD_BIN = 3;
else if SCORECARD_POINTS < 96 then SCORECARD_BIN = 4;
else if SCORECARD_POINTS < 110 then SCORECARD_BIN = 5;
else if SCORECARD_POINTS < 124 then SCORECARD_BIN = 6;
else if SCORECARD_POINTS < 138 then SCORECARD_BIN = 7;
else if SCORECARD_POINTS < 152 then SCORECARD_BIN = 8;
else if SCORECARD_POINTS < 166 then SCORECARD_BIN = 9;
else if SCORECARD_POINTS < 180 then SCORECARD_BIN = 10;
else if SCORECARD_POINTS < 194 then SCORECARD_BIN = 11;
else if SCORECARD_POINTS < 208 then SCORECARD_BIN = 12;
else if SCORECARD_POINTS < 222 then SCORECARD_BIN = 13;
else if SCORECARD_POINTS < 236 then SCORECARD_BIN = 14;
else if SCORECARD_POINTS < 250 then SCORECARD_BIN = 15;
else if SCORECARD_POINTS < 264 then SCORECARD_BIN = 16;
else if SCORECARD_POINTS < 278 then SCORECARD_BIN = 17;
else if SCORECARD_POINTS < 292 then SCORECARD_BIN = 18;
else if SCORECARD_POINTS < 306 then SCORECARD_BIN = 19;
else if SCORECARD_POINTS < 320 then SCORECARD_BIN = 20;
else if SCORECARD_POINTS < 334 then SCORECARD_BIN = 21;
else if SCORECARD_POINTS < 348 then SCORECARD_BIN = 22;
else if SCORECARD_POINTS < 362 then SCORECARD_BIN = 23;
else if SCORECARD_POINTS < 376 then SCORECARD_BIN = 24;
else SCORECARD_BIN = 25;
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp;
*------------------------------------------------------------*;
if (P_DEFAULT1_00 ge 0.41138273596514) then do;
b_DEFAULT = 1;
end;
else
if (P_DEFAULT1_00 ge 0.32048685031653) then do;
b_DEFAULT = 2;
end;
else
if (P_DEFAULT1_00 ge 0.23322725256239) then do;
b_DEFAULT = 3;
end;
else
if (P_DEFAULT1_00 ge 0.17153332496038) then do;
b_DEFAULT = 4;
end;
else
if (P_DEFAULT1_00 ge 0.13416547100987) then do;
b_DEFAULT = 5;
end;
else
if (P_DEFAULT1_00 ge 0.11080646728366) then do;
b_DEFAULT = 6;
end;
else
if (P_DEFAULT1_00 ge 0.08649882423243) then do;
b_DEFAULT = 7;
end;
else
if (P_DEFAULT1_00 ge 0.07276873794788) then do;
b_DEFAULT = 8;
end;
else
if (P_DEFAULT1_00 ge 0.05709029473234) then do;
b_DEFAULT = 9;
end;
else
if (P_DEFAULT1_00 ge 0.04383741393835) then do;
b_DEFAULT = 10;
end;
else
if (P_DEFAULT1_00 ge 0.0348392593572) then do;
b_DEFAULT = 11;
end;
else
if (P_DEFAULT1_00 ge 0.02516242855703) then do;
b_DEFAULT = 12;
end;
else
if (P_DEFAULT1_00 ge 0.0198447992618) then do;
b_DEFAULT = 13;
end;
else
if (P_DEFAULT1_00 ge 0.01122782281553) then do;
b_DEFAULT = 14;
end;
else
if (P_DEFAULT1_00 ge 0.00714162741789) then do;
b_DEFAULT = 15;
end;
else
if (P_DEFAULT1_00 ge 0.00479617198875) then do;
b_DEFAULT = 16;
end;
else
if (P_DEFAULT1_00 ge 0.00272488381053) then do;
b_DEFAULT = 17;
end;
else
if (P_DEFAULT1_00 ge 0.0017222497555) then do;
b_DEFAULT = 18;
end;
else
if (P_DEFAULT1_00 ge 0.00083711245873) then do;
b_DEFAULT = 19;
end;
else
do;
b_DEFAULT = 20;
end;
