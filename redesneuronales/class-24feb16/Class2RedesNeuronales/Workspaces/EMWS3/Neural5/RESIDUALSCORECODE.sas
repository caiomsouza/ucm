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

      label H121 = 'Hidden: H1=21' ;

      label H122 = 'Hidden: H1=22' ;

      label H123 = 'Hidden: H1=23' ;

      label H124 = 'Hidden: H1=24' ;

      label H125 = 'Hidden: H1=25' ;

      label H126 = 'Hidden: H1=26' ;

      label H127 = 'Hidden: H1=27' ;

      label H128 = 'Hidden: H1=28' ;

      label H129 = 'Hidden: H1=29' ;

      label H130 = 'Hidden: H1=30' ;

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
   H101  =    -0.87553366889792 * S_Age  +    -0.31153771811889 * S_Height ;
   H102  =     0.52761202506524 * S_Age  +    -0.17304698198151 * S_Height ;
   H103  =     -0.7496278815946 * S_Age  +    -0.68837270620969 * S_Height ;
   H104  =     0.65970742861357 * S_Age  +     0.20508572064538 * S_Height ;
   H105  =    -0.71271777346415 * S_Age  +     0.09144015019577 * S_Height ;
   H106  =     0.12919368315597 * S_Age  +     0.13460365203651 * S_Height ;
   H107  =     0.25577444684324 * S_Age  +     0.15429008795026 * S_Height ;
   H108  =    -0.70789610251569 * S_Age  +     0.95670661928597 * S_Height ;
   H109  =     0.12248524486522 * S_Age  +    -1.33273443081668 * S_Height ;
   H110  =     1.27296433818524 * S_Age  +      0.2260531865168 * S_Height ;
   H111  =    -0.14055013048361 * S_Age  +    -0.63156928395805 * S_Height ;
   H112  =     -0.1192089952769 * S_Age  +    -0.46931182159899 * S_Height ;
   H113  =    -0.36133750751128 * S_Age  +      0.4047794204891 * S_Height ;
   H114  =    -0.71324722152585 * S_Age  +    -0.28710913512992 * S_Height ;
   H115  =     0.08831654071049 * S_Age  +     0.27941172559587 * S_Height ;
   H116  =    -0.20554580886881 * S_Age  +     0.73101354713666 * S_Height ;
   H117  =     0.56095684470251 * S_Age  +    -1.54476243153584 * S_Height ;
   H118  =     0.38701371152916 * S_Age  +    -0.28379992574826 * S_Height ;
   H119  =    -0.74784757350118 * S_Age  +     0.18962873349096 * S_Height ;
   H120  =     0.16083014929069 * S_Age  +     0.78705245855929 * S_Height ;
   H121  =    -0.25541019105811 * S_Age  +    -0.04899891346753 * S_Height ;
   H122  =     0.06841140736162 * S_Age  +    -0.60062951556283 * S_Height ;
   H123  =     0.48992884415218 * S_Age  +     0.27152326118011 * S_Height ;
   H124  =    -0.78540796672819 * S_Age  +    -0.01700604645312 * S_Height ;
   H125  =     0.18065360152019 * S_Age  +    -0.27579456281168 * S_Height ;
   H126  =     0.24877600555757 * S_Age  +    -0.79661648777483 * S_Height ;
   H127  =    -0.04049791567574 * S_Age  +    -0.12424235778277 * S_Height ;
   H128  =     0.73900101818824 * S_Age  +    -0.03014399523252 * S_Height ;
   H129  =    -0.01332193249891 * S_Age  +    -0.36409677637678 * S_Height ;
   H130  =    -0.05832334182488 * S_Age  +     0.63638701523405 * S_Height ;
   H101  = H101  +    -0.05614475589367 * SexFemale  +     1.65198748576108 * 
        SmokerCurrent ;
   H102  = H102  +    -0.05967452774455 * SexFemale  +    -0.14170414826371 * 
        SmokerCurrent ;
   H103  = H103  +    -0.02211057877307 * SexFemale  +    -0.41203495771487 * 
        SmokerCurrent ;
   H104  = H104  +     0.43134717921377 * SexFemale  +     0.72705843215601 * 
        SmokerCurrent ;
   H105  = H105  +    -0.04739992781701 * SexFemale  +     0.76667023315411 * 
        SmokerCurrent ;
   H106  = H106  +    -0.23354386193812 * SexFemale  +     0.33688723910036 * 
        SmokerCurrent ;
   H107  = H107  +     0.10388346264543 * SexFemale  +    -0.44128203267161 * 
        SmokerCurrent ;
   H108  = H108  +     0.26598289204148 * SexFemale  +     0.05981332610237 * 
        SmokerCurrent ;
   H109  = H109  +     0.12003022180813 * SexFemale  +    -0.73400221416359 * 
        SmokerCurrent ;
   H110  = H110  +      -0.551368987723 * SexFemale  +     0.04163632463328 * 
        SmokerCurrent ;
   H111  = H111  +    -0.48754487846061 * SexFemale  +     0.16476728317734 * 
        SmokerCurrent ;
   H112  = H112  +      0.0776927681296 * SexFemale  +     0.74653006821449 * 
        SmokerCurrent ;
   H113  = H113  +    -0.48218216828563 * SexFemale  +     1.11858421720816 * 
        SmokerCurrent ;
   H114  = H114  +    -0.06380720987379 * SexFemale  +     0.10860451982033 * 
        SmokerCurrent ;
   H115  = H115  +    -0.63844466247792 * SexFemale  +    -0.50446946747499 * 
        SmokerCurrent ;
   H116  = H116  +     0.40039223182471 * SexFemale  +    -0.33393436025258 * 
        SmokerCurrent ;
   H117  = H117  +    -0.62842571547019 * SexFemale  +    -0.57466638864378 * 
        SmokerCurrent ;
   H118  = H118  +     0.39008216532075 * SexFemale  +    -0.39278424499441 * 
        SmokerCurrent ;
   H119  = H119  +    -0.00963190808646 * SexFemale  +    -0.34003505351212 * 
        SmokerCurrent ;
   H120  = H120  +     0.49592967990519 * SexFemale  +    -0.67618477438076 * 
        SmokerCurrent ;
   H121  = H121  +     0.11737574180421 * SexFemale  +    -0.40958142835913 * 
        SmokerCurrent ;
   H122  = H122  +     0.31205450223568 * SexFemale  +     0.68138349057071 * 
        SmokerCurrent ;
   H123  = H123  +    -0.01635066186225 * SexFemale  +     0.06575850680256 * 
        SmokerCurrent ;
   H124  = H124  +      0.4730631725645 * SexFemale  +     -0.5525297690334 * 
        SmokerCurrent ;
   H125  = H125  +    -0.76143370450351 * SexFemale  +     0.72812240558169 * 
        SmokerCurrent ;
   H126  = H126  +     0.94951957254852 * SexFemale  +    -0.38322954520781 * 
        SmokerCurrent ;
   H127  = H127  +     0.98438069395965 * SexFemale  +     0.47073203722068 * 
        SmokerCurrent ;
   H128  = H128  +    -0.04403314066639 * SexFemale  +    -0.06189215371762 * 
        SmokerCurrent ;
   H129  = H129  +    -0.07130855138408 * SexFemale  +    -0.44227106844354 * 
        SmokerCurrent ;
   H130  = H130  +    -0.32052433872926 * SexFemale  +     0.17193636079535 * 
        SmokerCurrent ;
   H101  =     0.07783725976805 + H101 ;
   H102  =    -0.75904601904899 + H102 ;
   H103  =    -0.48946668632304 + H103 ;
   H104  =     0.36473818586104 + H104 ;
   H105  =    -1.09200092926169 + H105 ;
   H106  =     0.17031904259054 + H106 ;
   H107  =    -0.60948138594534 + H107 ;
   H108  =     0.97620369474883 + H108 ;
   H109  =     0.93411161084033 + H109 ;
   H110  =    -2.52753976284202 + H110 ;
   H111  =    -2.02050539389358 + H111 ;
   H112  =    -0.11308854032617 + H112 ;
   H113  =    -0.87627269160885 + H113 ;
   H114  =     1.12936611054085 + H114 ;
   H115  =    -0.24618638414338 + H115 ;
   H116  =     1.07728362630865 + H116 ;
   H117  =     0.41614774722523 + H117 ;
   H118  =    -0.67656921382183 + H118 ;
   H119  =    -1.22229435817429 + H119 ;
   H120  =    -0.84729298487803 + H120 ;
   H121  =     0.24049361977465 + H121 ;
   H122  =    -0.13010256102978 + H122 ;
   H123  =     1.43904683906744 + H123 ;
   H124  =    -1.64691977067222 + H124 ;
   H125  =      1.5132023460018 + H125 ;
   H126  =    -0.58253462956745 + H126 ;
   H127  =      1.2928508177543 + H127 ;
   H128  =     1.67831819379361 + H128 ;
   H129  =    -0.25820262912963 + H129 ;
   H130  =    -1.38726243132801 + H130 ;
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
   H121  = TANH(H121 );
   H122  = TANH(H122 );
   H123  = TANH(H123 );
   H124  = TANH(H124 );
   H125  = TANH(H125 );
   H126  = TANH(H126 );
   H127  = TANH(H127 );
   H128  = TANH(H128 );
   H129  = TANH(H129 );
   H130  = TANH(H130 );
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
   H121  = .;
   H122  = .;
   H123  = .;
   H124  = .;
   H125  = .;
   H126  = .;
   H127  = .;
   H128  = .;
   H129  = .;
   H130  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_FEV  =      0.5232544621475 * H101  +    -0.01373754241368 * H102
          +    -0.15675875156265 * H103  +     0.09505559881372 * H104
          +    -0.20438315316967 * H105  +    -0.09090579028025 * H106
          +     0.31645679699181 * H107  +     0.40831340328196 * H108
          +     0.50517133342651 * H109  +     0.97488609053313 * H110
          +    -0.51201341940714 * H111  +    -0.34122899621174 * H112
          +     0.42964066977356 * H113  +     0.28770341584303 * H114
          +    -0.10705452517099 * H115  +     0.39700977287421 * H116
          +     -0.6154613009485 * H117  +    -0.12129721693252 * H118
          +    -0.32429287554476 * H119  +     0.33782316461407 * H120
          +    -0.00683085922416 * H121  +    -0.11399074159243 * H122
          +    -0.02832982873234 * H123  +    -0.32260842217245 * H124
          +     0.73689685617026 * H125  +     0.70186569605068 * H126
          +    -0.85928717566935 * H127  +     0.05149178166665 * H128
          +     0.31384990480511 * H129  +     0.33929949240294 * H130 ;
   P_FEV  =     2.37506915966362 + P_FEV ;
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
