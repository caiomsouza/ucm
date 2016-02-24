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
   H101  =     0.26981354501445 * S_Age  +    -0.31099263306634 * S_Height ;
   H102  =    -1.36814248483594 * S_Age  +    -0.71913993463825 * S_Height ;
   H103  =     4.58517060605906 * S_Age  +     4.56456466820306 * S_Height ;
   H104  =     1.61114381068037 * S_Age  +     0.07635062960592 * S_Height ;
   H105  =    -0.24468152390428 * S_Age  +     0.56884173633515 * S_Height ;
   H106  =     -2.0320766640952 * S_Age  +    -4.95546655290169 * S_Height ;
   H107  =    -2.58388661282036 * S_Age  +    -1.08471687277307 * S_Height ;
   H108  =    -1.10552324810078 * S_Age  +     2.71991677074198 * S_Height ;
   H109  =     0.27825498012763 * S_Age  +     1.03398888282522 * S_Height ;
   H110  =     1.43335732420879 * S_Age  +     1.75899820283152 * S_Height ;
   H101  = H101  +    -0.17542807260536 * SexFemale  +     0.95484352261227 * 
        SmokerCurrent ;
   H102  = H102  +     1.71420908475185 * SexFemale  +    -1.31450936419177 * 
        SmokerCurrent ;
   H103  = H103  +    -2.37309189757656 * SexFemale  +     6.90725817035042 * 
        SmokerCurrent ;
   H104  = H104  +    -0.34224707295673 * SexFemale  +     0.04116256814513 * 
        SmokerCurrent ;
   H105  = H105  +     0.18127245608526 * SexFemale  +    -0.57265935554774 * 
        SmokerCurrent ;
   H106  = H106  +    -4.15543156031112 * SexFemale  +     0.94481169220608 * 
        SmokerCurrent ;
   H107  = H107  +    -0.91281472713626 * SexFemale  +    -1.65969784005055 * 
        SmokerCurrent ;
   H108  = H108  +     1.30054456478223 * SexFemale  +     1.37344334348113 * 
        SmokerCurrent ;
   H109  = H109  +     0.27311733455402 * SexFemale  +    -0.09205029055975 * 
        SmokerCurrent ;
   H110  = H110  +     1.16039353000476 * SexFemale  +     0.01985288909961 * 
        SmokerCurrent ;
   H101  =     0.75288076338245 + H101 ;
   H102  =     0.26281034983211 + H102 ;
   H103  =     -3.5731498769493 + H103 ;
   H104  =    -0.21462427200712 + H104 ;
   H105  =     0.25822544055318 + H105 ;
   H106  =     2.82751895865679 + H106 ;
   H107  =     0.67490413213379 + H107 ;
   H108  =    -3.47134775092838 + H108 ;
   H109  =    -2.19327785811038 + H109 ;
   H110  =    -4.18751936751943 + H110 ;
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
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_FEV  =     2.48399979446934 * H101  +    -0.85255571165331 * H102
          +    -0.67897792100541 * H103  +    -0.86223267932035 * H104
          +     2.29867112370766 * H105  +    -0.44051806060799 * H106
          +    -0.50929358090768 * H107  +    -1.13041185531808 * H108
          +     2.22892294362668 * H109  +    -0.66561153648602 * H110 ;
   P_FEV  =     1.88782655263281 + P_FEV ;
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
