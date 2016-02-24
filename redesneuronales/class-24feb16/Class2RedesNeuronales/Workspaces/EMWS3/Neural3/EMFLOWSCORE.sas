***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
;
      label S_Age = 'Standard: Age' ;

      label S_Height = 'Standard: Height' ;

      label SexFemale = 'Dummy: Sex=Female' ;

      label SmokerCurrent = 'Dummy: Smoker=Current' ;

      label H101 = 'Hidden: H1=1' ;

      label H102 = 'Hidden: H1=2' ;

      label H103 = 'Hidden: H1=3' ;

      label H104 = 'Hidden: H1=4' ;

      label H105 = 'Hidden: H1=5' ;

      label H106 = 'Hidden: H1=6' ;

      label H107 = 'Hidden: H1=7' ;

      label H108 = 'Hidden: H1=8' ;

      label H109 = 'Hidden: H1=9' ;

      label H110 = 'Hidden: H1=10' ;

      label H111 = 'Hidden: H1=11' ;

      label H112 = 'Hidden: H1=12' ;

      label H113 = 'Hidden: H1=13' ;

      label H114 = 'Hidden: H1=14' ;

      label H115 = 'Hidden: H1=15' ;

      label H116 = 'Hidden: H1=16' ;

      label H117 = 'Hidden: H1=17' ;

      label H118 = 'Hidden: H1=18' ;

      label H119 = 'Hidden: H1=19' ;

      label H120 = 'Hidden: H1=20' ;

      label P_FEV = 'Predicted: FEV' ;

      label R_FEV = 'Residual: FEV' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Sex ;
drop SexFemale ;
if missing( Sex ) then do;
   SexFemale = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( Sex , _dm8 )
   if _dm8 = 'MALE'  then do;
      SexFemale = -1;
   end;
   else if _dm8 = 'FEMALE'  then do;
      SexFemale = 1;
   end;
   else do;
      SexFemale = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Smoker ;
drop SmokerCurrent ;
if missing( Smoker ) then do;
   SmokerCurrent = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( Smoker , _dm8 )
   if _dm8 = 'NON'  then do;
      SmokerCurrent = -1;
   end;
   else if _dm8 = 'CURRENT'  then do;
      SmokerCurrent = 1;
   end;
   else do;
      SmokerCurrent = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Age ,
   Height   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Age  =    -3.27887299252531 +     0.33305030618243 * Age ;
   S_Height  =    -10.6099231195388 +     0.17409892691691 * Height ;
END;
ELSE DO;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -3.27887299252531 +     0.33305030618243 * Age ;
   IF MISSING( Height ) THEN S_Height  = . ;
   ELSE S_Height  =    -10.6099231195388 +     0.17409892691691 * Height ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H101  =     0.08336224733894 * S_Age  +    -0.27404355580908 * S_Height ;
   H102  =    -0.38397451324847 * S_Age  +    -0.15772184768509 * S_Height ;
   H103  =     0.31344090219845 * S_Age  +     1.09953438889615 * S_Height ;
   H104  =     0.31810187108795 * S_Age  +    -0.32163557123246 * S_Height ;
   H105  =    -0.68031416847575 * S_Age  +     1.25901527422921 * S_Height ;
   H106  =    -1.60742415426539 * S_Age  +    -0.18895970440983 * S_Height ;
   H107  =     0.11439315179404 * S_Age  +    -0.86269643147037 * S_Height ;
   H108  =    -0.27042335324713 * S_Age  +     0.39909180697045 * S_Height ;
   H109  =      0.3386140281533 * S_Age  +     1.42294240478845 * S_Height ;
   H110  =     0.54694481773923 * S_Age  +    -0.10322126910686 * S_Height ;
   H111  =    -0.13539565640682 * S_Age  +     0.46005425104114 * S_Height ;
   H112  =     0.54930866797456 * S_Age  +     0.30715633419911 * S_Height ;
   H113  =    -0.43395408337576 * S_Age  +     0.55664985350602 * S_Height ;
   H114  =    -0.30801802009824 * S_Age  +     0.43276720247112 * S_Height ;
   H115  =    -0.13640719007839 * S_Age  +    -0.59691126150611 * S_Height ;
   H116  =     0.04331006731611 * S_Age  +    -0.56441817133734 * S_Height ;
   H117  =    -0.30396964668497 * S_Age  +    -0.75099104911378 * S_Height ;
   H118  =       0.141135388053 * S_Age  +    -0.12783418975982 * S_Height ;
   H119  =     0.12297824247426 * S_Age  +     0.16061337304709 * S_Height ;
   H120  =     0.61948491585673 * S_Age  +     0.29668770348889 * S_Height ;
   H101  = H101  +     0.46186635430999 * SexFemale  +    -0.00801627448042 *
        SmokerCurrent ;
   H102  = H102  +    -0.08973928607373 * SexFemale  +     0.33751760554139 *
        SmokerCurrent ;
   H103  = H103  +     0.01798114464198 * SexFemale  +     0.04322249755765 *
        SmokerCurrent ;
   H104  = H104  +     0.14090110628715 * SexFemale  +    -0.45065421259659 *
        SmokerCurrent ;
   H105  = H105  +     -0.5361399949905 * SexFemale  +     -0.5396900661082 *
        SmokerCurrent ;
   H106  = H106  +    -1.61060295770618 * SexFemale  +    -0.67252361433498 *
        SmokerCurrent ;
   H107  = H107  +    -1.32626547627434 * SexFemale  +    -0.15001092732063 *
        SmokerCurrent ;
   H108  = H108  +    -0.32890284498238 * SexFemale  +     0.24435845863767 *
        SmokerCurrent ;
   H109  = H109  +     0.28860527454487 * SexFemale  +     0.90815984470369 *
        SmokerCurrent ;
   H110  = H110  +    -1.17982761614149 * SexFemale  +    -0.23521493338071 *
        SmokerCurrent ;
   H111  = H111  +    -0.58332750285602 * SexFemale  +    -0.47109730710957 *
        SmokerCurrent ;
   H112  = H112  +    -1.58716903586229 * SexFemale  +    -0.30772833681885 *
        SmokerCurrent ;
   H113  = H113  +     1.14622188514168 * SexFemale  +    -0.23229159603536 *
        SmokerCurrent ;
   H114  = H114  +     0.60945487380215 * SexFemale  +    -0.29892881348867 *
        SmokerCurrent ;
   H115  = H115  +     0.09513388123397 * SexFemale  +    -1.21798128938572 *
        SmokerCurrent ;
   H116  = H116  +    -0.70577290044122 * SexFemale  +      0.0183057519201 *
        SmokerCurrent ;
   H117  = H117  +    -0.15705708419391 * SexFemale  +      0.4678596188148 *
        SmokerCurrent ;
   H118  = H118  +     -0.4207697796582 * SexFemale  +    -0.02902452936813 *
        SmokerCurrent ;
   H119  = H119  +    -0.84638470412448 * SexFemale  +     0.49631955413668 *
        SmokerCurrent ;
   H120  = H120  +    -0.10953100943747 * SexFemale  +    -0.25683786351916 *
        SmokerCurrent ;
   H101  =     1.03732211357159 + H101 ;
   H102  =     1.35975300506057 + H102 ;
   H103  =     0.15744296762375 + H103 ;
   H104  =     0.77003339921403 + H104 ;
   H105  =    -0.12989869393219 + H105 ;
   H106  =     0.20702175016287 + H106 ;
   H107  =     0.18677888567067 + H107 ;
   H108  =     0.93122589880142 + H108 ;
   H109  =     0.89383595636798 + H109 ;
   H110  =    -0.82768669525239 + H110 ;
   H111  =    -0.61647684846976 + H111 ;
   H112  =     1.49427526392684 + H112 ;
   H113  =    -1.98663507465514 + H113 ;
   H114  =     1.10514499610097 + H114 ;
   H115  =    -0.58617744453685 + H115 ;
   H116  =     0.53813935922931 + H116 ;
   H117  =     -0.6405207605117 + H117 ;
   H118  =     1.34848719321914 + H118 ;
   H119  =    -0.14228227863294 + H119 ;
   H120  =    -0.07158363155678 + H120 ;
   H101  = TANH(H101 );
   H102  = TANH(H102 );
   H103  = TANH(H103 );
   H104  = TANH(H104 );
   H105  = TANH(H105 );
   H106  = TANH(H106 );
   H107  = TANH(H107 );
   H108  = TANH(H108 );
   H109  = TANH(H109 );
   H110  = TANH(H110 );
   H111  = TANH(H111 );
   H112  = TANH(H112 );
   H113  = TANH(H113 );
   H114  = TANH(H114 );
   H115  = TANH(H115 );
   H116  = TANH(H116 );
   H117  = TANH(H117 );
   H118  = TANH(H118 );
   H119  = TANH(H119 );
   H120  = TANH(H120 );
END;
ELSE DO;
   H101  = .;
   H102  = .;
   H103  = .;
   H104  = .;
   H105  = .;
   H106  = .;
   H107  = .;
   H108  = .;
   H109  = .;
   H110  = .;
   H111  = .;
   H112  = .;
   H113  = .;
   H114  = .;
   H115  = .;
   H116  = .;
   H117  = .;
   H118  = .;
   H119  = .;
   H120  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_FEV  =    -0.22993067339759 * H101  +    -0.42561434361906 * H102
          +      0.0824912324714 * H103  +     0.05101691555554 * H104
          +     0.54169010953164 * H105  +    -0.41795567720923 * H106
          +    -0.87512109850029 * H107  +    -0.32009790201719 * H108
          +       0.388154001353 * H109  +     0.89806517816382 * H110
          +    -0.09649421203434 * H111  +     -0.5205606723477 * H112
          +    -1.25236691466039 * H113  +     0.55310497552406 * H114
          +     0.46793329953109 * H115  +     -0.3737552408318 * H116
          +     0.34440604153097 * H117  +     0.15979209172763 * H118
          +     0.91289947869339 * H119  +    -0.32134520855727 * H120 ;
   P_FEV  =     2.65600971161905 + P_FEV ;
END;
ELSE DO;
   P_FEV  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_FEV  =     2.61260262008733;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( FEV ) THEN R_FEV  = . ;
ELSE R_FEV  = FEV  - P_FEV ;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H101
H102
H103
H104
H105
H106
H107
H108
H109
H110
H111
H112
H113
H114
H115
H116
H117
H118
H119
H120
;
drop S_:;
