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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
   H11  =     0.87253248063723 * S_Age  +    -0.98898953934851 * S_Height ;
   H12  =     0.05404955885588 * S_Age  +      0.2492390354594 * S_Height ;
   H13  =    -0.82161261969827 * S_Age  +    -0.66499014214333 * S_Height ;
   H11  = H11  +     6.26007761544008 * SexFemale  +     0.79013702083985 * 
        SmokerCurrent ;
   H12  = H12  +     0.84949958518174 * SexFemale  +    -0.02542136788969 * 
        SmokerCurrent ;
   H13  = H13  +    -1.15281943454293 * SexFemale  +    -0.27975801296168 * 
        SmokerCurrent ;
   H11  =     4.05236347199103 + H11 ;
   H12  =     0.50891223436085 + H12 ;
   H13  =     0.52629214708881 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_FEV  =      -1.819530342071 * H11  +     2.52771655133851 * H12
          +    -0.56284480220236 * H13 ;
   P_FEV  =      2.0014982132121 + P_FEV ;
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
