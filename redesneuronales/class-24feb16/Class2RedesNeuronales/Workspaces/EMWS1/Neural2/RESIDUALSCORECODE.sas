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
   H101  =    -1.14762454895247 * S_x1  +    -1.59664445368845 * S_x2 ;
   H102  =     1.57357599134286 * S_x1  +     0.28557484695292 * S_x2 ;
   H103  =     -1.5971074369714 * S_x1  +    -1.55862997582517 * S_x2 ;
   H104  =     0.38393130504241 * S_x1  +      2.3442256254497 * S_x2 ;
   H105  =     -1.8017038717201 * S_x1  +     0.59768040193809 * S_x2 ;
   H106  =    -0.16095008309518 * S_x1  +    -1.12706011344997 * S_x2 ;
   H107  =    -2.47772738123518 * S_x1  +     1.00831761866348 * S_x2 ;
   H108  =     1.73862693856893 * S_x1  +     0.07480621312194 * S_x2 ;
   H109  =     1.08120737391455 * S_x1  +    -0.40912660540573 * S_x2 ;
   H110  =     0.96464012064216 * S_x1  +     -1.8874549603474 * S_x2 ;
   H111  =     0.27789019170098 * S_x1  +      2.8705937363091 * S_x2 ;
   H112  =    -0.65365822520851 * S_x1  +     2.09163360254553 * S_x2 ;
   H113  =    -2.21521453422545 * S_x1  +     2.10199222213539 * S_x2 ;
   H114  =    -1.98794356491884 * S_x1  +    -0.65601868868627 * S_x2 ;
   H115  =     2.06056473170179 * S_x1  +    -1.13764323653408 * S_x2 ;
   H101  =     1.96878889721875 + H101 ;
   H102  =    -2.73090245905032 + H102 ;
   H103  =    -2.15863374481559 + H103 ;
   H104  =     0.71770549485026 + H104 ;
   H105  =     0.62112847315595 + H105 ;
   H106  =    -2.17056034720996 + H106 ;
   H107  =    -4.90249972528153 + H107 ;
   H108  =     1.60552155421931 + H108 ;
   H109  =    -0.52612199979772 + H109 ;
   H110  =    -2.04379604611102 + H110 ;
   H111  =    -4.49303165840938 + H111 ;
   H112  =    -2.12924197359076 + H112 ;
   H113  =    -0.94020843391647 + H113 ;
   H114  =     0.64115291601992 + H114 ;
   H115  =     3.37203431014505 + H115 ;
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
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_hat  =     1.91376849292468 * H101  +     3.41932382233737 * H102
          +    -1.59340956973464 * H103  +    -1.10224846598315 * H104
          +     -3.0810756549822 * H105  +     5.22986736673978 * H106
          +     1.36465985580194 * H107  +     1.92612140076372 * H108
          +    -6.32349021007336 * H109  +    -1.58150731618344 * H110
          +     0.78937294412175 * H111  +    -1.41141794812519 * H112
          +     0.59587241293609 * H113  +    -1.34462080318774 * H114
          +    -0.91658020882306 * H115 ;
   P_hat  =     4.57619223140688 + P_hat ;
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
