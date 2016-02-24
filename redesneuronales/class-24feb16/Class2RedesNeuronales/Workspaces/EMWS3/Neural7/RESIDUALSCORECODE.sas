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
   S_Age  =    -3.31074175814484 +     0.32658672463627 * Age ;
   S_Height  =    -10.7000540731053 +     0.17397922035272 * Height ;
END;
ELSE DO;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -3.31074175814484 +     0.32658672463627 * Age ;
   IF MISSING( Height ) THEN S_Height  = . ;
   ELSE S_Height  =    -10.7000540731053 +     0.17397922035272 * Height ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.61478143515236 * S_Age  +    -0.51685880486683 * S_Height ;
   H12  =     0.10950813557729 * S_Age  +     0.51297264014773 * S_Height ;
   H11  = H11  +     -0.9467154333356 * SexFemale  +    -0.83679753115405 * 
        SmokerCurrent ;
   H12  = H12  +    -0.70098985094018 * SexFemale  +     -0.5444210257079 * 
        SmokerCurrent ;
   H11  =     -0.4336060632011 + H11 ;
   H12  =    -1.23701408998659 + H12 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_FEV  =    -0.83108418311651 * H11  +     1.22010430258784 * H12 ;
   P_FEV  =     3.33060253570048 + P_FEV ;
END;
ELSE DO;
   P_FEV  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_FEV  =     2.68699999999999;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( FEV ) THEN R_FEV  = . ;
ELSE R_FEV  = FEV  - P_FEV ;
********************************;
*** End Scoring Code for Neural;
********************************;
