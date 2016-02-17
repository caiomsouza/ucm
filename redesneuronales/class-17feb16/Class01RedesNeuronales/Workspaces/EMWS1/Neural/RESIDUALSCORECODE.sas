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
      label S_EXER = 'Standard: EXER' ;

      label S_HEART = 'Standard: HEART' ;

      label SEXF = 'Dummy: SEX=F' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label P_AERO = 'Predicted: AERO' ;

      label R_AERO = 'Residual: AERO' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for SEX ;
drop SEXF ;
if missing( SEX ) then do;
   SEXF = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   %DMNORMCP( SEX , _dm8 )
   if _dm8 = 'F'  then do;
      SEXF = 1;
   end;
   else if _dm8 = 'M'  then do;
      SEXF = -1;
   end;
   else do;
      SEXF = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   EXER , 
   HEART   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_EXER  =    -2.20216304921608 +     0.99252419119598 * EXER ;
   S_HEART  =    -5.78129673157078 +     0.08078667921845 * HEART ;
END;
ELSE DO;
   IF MISSING( EXER ) THEN S_EXER  = . ;
   ELSE S_EXER  =    -2.20216304921608 +     0.99252419119598 * EXER ;
   IF MISSING( HEART ) THEN S_HEART  = . ;
   ELSE S_HEART  =    -5.78129673157078 +     0.08078667921845 * HEART ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     3.65291726147156 * S_EXER  +    -7.18247523022276 * S_HEART ;
   H12  =    -2.47102378003121 * S_EXER  +    -0.53310138446338 * S_HEART ;
   H13  =     3.87284351021613 * S_EXER  +     0.49835817750632 * S_HEART ;
   H14  =    -1.41749918816123 * S_EXER  +    -1.34925890210951 * S_HEART ;
   H15  =    -12.8663052357646 * S_EXER  +    -13.3423599579519 * S_HEART ;
   H16  =    -0.97664471405446 * S_EXER  +     6.19921331479679 * S_HEART ;
   H11  = H11  +    -3.12869574089463 * SEXF ;
   H12  = H12  +    -0.56278438087553 * SEXF ;
   H13  = H13  +     3.44619843183706 * SEXF ;
   H14  = H14  +     2.93018164497865 * SEXF ;
   H15  = H15  +     3.07284088179611 * SEXF ;
   H16  = H16  +     2.17809142954006 * SEXF ;
   H11  =     5.45261075154185 + H11 ;
   H12  =    -2.12487852025054 + H12 ;
   H13  =    -0.92939813583155 + H13 ;
   H14  =    -1.70615005251539 + H14 ;
   H15  =     0.34784316530293 + H15 ;
   H16  =    -2.07660435895856 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_AERO  =    -12.9733488579486 * H11  +    -7.73585125018786 * H12
          +     5.36447610229145 * H13  +    -15.7975676454996 * H14
          +      9.6739734833069 * H15  +    -7.84429192343559 * H16 ;
   P_AERO  =     29.6170575280116 + P_AERO ;
END;
ELSE DO;
   P_AERO  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_AERO  =     32.8935483870967;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( AERO ) THEN R_AERO  = . ;
ELSE R_AERO  = AERO  - P_AERO ;
********************************;
*** End Scoring Code for Neural;
********************************;
