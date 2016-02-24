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

      label H131 = 'Hidden: H1=31' ;

      label H132 = 'Hidden: H1=32' ;

      label H133 = 'Hidden: H1=33' ;

      label H134 = 'Hidden: H1=34' ;

      label H135 = 'Hidden: H1=35' ;

      label H136 = 'Hidden: H1=36' ;

      label H137 = 'Hidden: H1=37' ;

      label H138 = 'Hidden: H1=38' ;

      label H139 = 'Hidden: H1=39' ;

      label H140 = 'Hidden: H1=40' ;

      label P_hat = 'Predicted: hat' ;

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
   H101  =    -0.82124321411821 * S_x1  +    -0.39332840823613 * S_x2 ;
   H102  =     0.50541199536068 * S_x1  +     0.13088480724235 * S_x2 ;
   H103  =    -1.46693051494621 * S_x1  +    -1.29976992406746 * S_x2 ;
   H104  =    -0.66183026969992 * S_x1  +    -0.74843415713659 * S_x2 ;
   H105  =      0.2505658212456 * S_x1  +    -0.42405144595929 * S_x2 ;
   H106  =     0.78797706933436 * S_x1  +     -0.2099194600674 * S_x2 ;
   H107  =    -0.66438630565199 * S_x1  +     0.59688767446249 * S_x2 ;
   H108  =    -0.12111177225836 * S_x1  +    -1.38063216862916 * S_x2 ;
   H109  =    -1.39215099963073 * S_x1  +     1.51207167225694 * S_x2 ;
   H110  =     0.44098995874719 * S_x1  +     0.75277126317443 * S_x2 ;
   H111  =     1.32432827850986 * S_x1  +     0.03197838365333 * S_x2 ;
   H112  =    -0.39017961911212 * S_x1  +     0.07662911243099 * S_x2 ;
   H113  =     0.97170912142263 * S_x1  +     0.01790441051046 * S_x2 ;
   H114  =     0.93698483033477 * S_x1  +    -0.03565364798566 * S_x2 ;
   H115  =     0.87106845228017 * S_x1  +    -0.76151973237962 * S_x2 ;
   H116  =     0.03821766672214 * S_x1  +     1.10722047325194 * S_x2 ;
   H117  =     0.14561902631818 * S_x1  +     -1.5864382015103 * S_x2 ;
   H118  =     0.29180920575808 * S_x1  +     -0.8021919513429 * S_x2 ;
   H119  =    -1.59708087591137 * S_x1  +    -0.07032638921084 * S_x2 ;
   H120  =    -0.09053447728924 * S_x1  +     0.40232881664876 * S_x2 ;
   H121  =     1.41555210615288 * S_x1  +     1.05091182088913 * S_x2 ;
   H122  =    -0.62930461911162 * S_x1  +     0.56425843620476 * S_x2 ;
   H123  =     0.52229873250433 * S_x1  +    -0.01596303516743 * S_x2 ;
   H124  =     0.55614492188462 * S_x1  +      0.4994686345469 * S_x2 ;
   H125  =     0.03762834760945 * S_x1  +    -1.11258681545678 * S_x2 ;
   H126  =    -0.06344895217359 * S_x1  +     1.02827091721882 * S_x2 ;
   H127  =     0.75542396917434 * S_x1  +     0.79217299585371 * S_x2 ;
   H128  =     -1.4153514893063 * S_x1  +    -0.87684512210206 * S_x2 ;
   H129  =    -0.66869328890843 * S_x1  +     0.47514335576604 * S_x2 ;
   H130  =    -0.02639617076642 * S_x1  +    -1.21415804876798 * S_x2 ;
   H131  =    -1.51670682777974 * S_x1  +     1.51800518104477 * S_x2 ;
   H132  =     0.06108715260207 * S_x1  +    -0.85317979303988 * S_x2 ;
   H133  =     0.45118063918685 * S_x1  +     1.10476523866521 * S_x2 ;
   H134  =     0.81088135673404 * S_x1  +     0.15385272997683 * S_x2 ;
   H135  =     0.64590434956606 * S_x1  +    -0.28016265319803 * S_x2 ;
   H136  =    -0.20641339484813 * S_x1  +     0.54789857728047 * S_x2 ;
   H137  =     0.98674361664828 * S_x1  +    -0.00520687980823 * S_x2 ;
   H138  =    -0.70059648798484 * S_x1  +     0.70145271966746 * S_x2 ;
   H139  =     0.35354803381073 * S_x1  +     0.40382876091135 * S_x2 ;
   H140  =    -0.97222270486287 * S_x1  +    -0.53587105908832 * S_x2 ;
   H101  =     0.96559297463372 + H101 ;
   H102  =     0.17000472627787 + H102 ;
   H103  =     2.19255845808898 + H103 ;
   H104  =    -1.31090999281049 + H104 ;
   H105  =    -0.46748941687754 + H105 ;
   H106  =     0.91061757741447 + H106 ;
   H107  =     1.61944069840696 + H107 ;
   H108  =    -2.46230169844648 + H108 ;
   H109  =     2.06319060658554 + H109 ;
   H110  =     1.10338935297412 + H110 ;
   H111  =    -2.22051279489993 + H111 ;
   H112  =    -0.32175070794102 + H112 ;
   H113  =     0.93624209077014 + H113 ;
   H114  =    -0.58082006358404 + H114 ;
   H115  =    -0.91118933955002 + H115 ;
   H116  =    -1.82453952231008 + H116 ;
   H117  =     1.04370689174525 + H117 ;
   H118  =     0.85485269143788 + H118 ;
   H119  =    -2.74891872402372 + H119 ;
   H120  =    -0.03631656828505 + H120 ;
   H121  =     1.92583474822712 + H121 ;
   H122  =     0.31709761752577 + H122 ;
   H123  =     0.32150351020489 + H123 ;
   H124  =     1.41892233707661 + H124 ;
   H125  =    -1.69411220105403 + H125 ;
   H126  =     1.53831305660936 + H126 ;
   H127  =     1.33991804266125 + H127 ;
   H128  =     -1.9276237065503 + H128 ;
   H129  =     1.32877081919041 + H129 ;
   H130  =     0.42653926053276 + H130 ;
   H131  =    -2.28311692076727 + H131 ;
   H132  =    -1.21928130916959 + H132 ;
   H133  =    -0.46847825057449 + H133 ;
   H134  =    -1.10077804926747 + H134 ;
   H135  =    -1.16241113431038 + H135 ;
   H136  =     0.21194805701616 + H136 ;
   H137  =    -0.99725519855581 + H137 ;
   H138  =    -0.55910469579742 + H138 ;
   H139  =     0.49698268305174 + H139 ;
   H140  =     0.86367041649179 + H140 ;
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
   H131  = TANH(H131 );
   H132  = TANH(H132 );
   H133  = TANH(H133 );
   H134  = TANH(H134 );
   H135  = TANH(H135 );
   H136  = TANH(H136 );
   H137  = TANH(H137 );
   H138  = TANH(H138 );
   H139  = TANH(H139 );
   H140  = TANH(H140 );
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
   H131  = .;
   H132  = .;
   H133  = .;
   H134  = .;
   H135  = .;
   H136  = .;
   H137  = .;
   H138  = .;
   H139  = .;
   H140  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_hat  =      0.3500264614805 * H101  +     0.10111395183386 * H102
          +     1.49688710340689 * H103  +     0.23743960960484 * H104
          +     0.04780340709155 * H105  +     0.34150145278787 * H106
          +     1.27785448137069 * H107  +     1.41033668162812 * H108
          +     1.37834410635428 * H109  +     0.69039148953028 * H110
          +     1.96174069844893 * H111  +     0.06058227657223 * H112
          +    -0.30763060396086 * H113  +    -0.64540781175315 * H114
          +    -0.10222322600172 * H115  +      1.4790629889864 * H116
          +      0.4446096955261 * H117  +    -0.26538768960588 * H118
          +      2.3606876008888 * H119  +     0.21789347986318 * H120
          +     1.77815092705978 * H121  +     0.41174192314793 * H122
          +    -0.05198525149591 * H123  +     1.09081438675001 * H124
          +      0.8581472475355 * H125  +    -0.71428482230702 * H126
          +     1.31364041757007 * H127  +     0.79496731209165 * H128
          +    -0.45947265986171 * H129  +     0.42923870760389 * H130
          +    -1.39546901273588 * H131  +     0.47475065808159 * H132
          +     0.00276986911067 * H133  +     0.86925190052299 * H134
          +    -1.20071052952661 * H135  +    -0.00780453521782 * H136
          +     0.72712766021079 * H137  +    -0.28000511251772 * H138
          +     0.34682136482617 * H139  +     0.35987915415645 * H140 ;
   P_hat  =     0.31516162549103 + P_hat ;
END;
ELSE DO;
   P_hat  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_hat  =    -0.27662261117926;
END;
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
H121
H122
H123
H124
H125
H126
H127
H128
H129
H130
H131
H132
H133
H134
H135
H136
H137
H138
H139
H140
;
drop S_:;
