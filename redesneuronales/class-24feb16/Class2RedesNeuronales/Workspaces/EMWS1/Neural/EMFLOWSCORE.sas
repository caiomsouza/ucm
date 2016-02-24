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
      label S_x1 = 'Standard: x1' ;

      label S_x2 = 'Standard: x2' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label P_hat = 'Predicted: hat' ;

      label R_hat = 'Residual: hat' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   x1 ,
   x2   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_x1  =                    0 +     0.32991443953692 * x1 ;
   S_x2  =                    0 +     0.32991443953692 * x2 ;
END;
ELSE DO;
   IF MISSING( x1 ) THEN S_x1  = . ;
   ELSE S_x1  =                    0 +     0.32991443953692 * x1 ;
   IF MISSING( x2 ) THEN S_x2  = . ;
   ELSE S_x2  =                    0 +     0.32991443953692 * x2 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.87634120390932 * S_x1  +    -0.32787163332349 * S_x2 ;
   H12  =       -0.69934392884 * S_x1  +  -1.4584531508898E-8 * S_x2 ;
   H13  =    -0.87634122612385 * S_x1  +     0.32787165598599 * S_x2 ;
   H11  =    -1.00609616208987 + H11 ;
   H12  =    -0.88028053360858 + H12 ;
   H13  =    -1.00609617912952 + H13 ;
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
   P_hat  =    -11.9783569167539 * H11  +     26.6688263473114 * H12
          +     -11.978354938661 * H13 ;
   P_hat  =     1.49903087106549 + P_hat ;
END;
ELSE DO;
   P_hat  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_hat  =    -0.27662261117926;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( hat ) THEN R_hat  = . ;
ELSE R_hat  = hat  - P_hat ;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
drop S_:;
