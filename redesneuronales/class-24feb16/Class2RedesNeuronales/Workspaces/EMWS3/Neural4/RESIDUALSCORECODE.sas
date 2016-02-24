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
   H101  =    -1.08290590344908 * S_Age  +     0.82185082655774 * S_Height ;
   H102  =     0.36874631354821 * S_Age  +     0.28999775297627 * S_Height ;
   H103  =    -0.40813613682971 * S_Age  +     0.27561718091163 * S_Height ;
   H104  =     0.40710042513237 * S_Age  +     -0.4298820352096 * S_Height ;
   H105  =     -0.8157920229997 * S_Age  +     -0.4905783929196 * S_Height ;
   H106  =    -1.02250108165158 * S_Age  +     0.17342869026695 * S_Height ;
   H107  =     0.00967455768966 * S_Age  +     0.11064068789304 * S_Height ;
   H108  =     0.78049796405792 * S_Age  +    -0.04133087295262 * S_Height ;
   H109  =     1.05912588603069 * S_Age  +     0.32191441516348 * S_Height ;
   H110  =    -0.48642996123445 * S_Age  +     0.31576170112226 * S_Height ;
   H111  =    -0.88284669511383 * S_Age  +     0.64805052005278 * S_Height ;
   H112  =    -0.05956131982267 * S_Age  +    -0.39847602682213 * S_Height ;
   H113  =     0.05301656968731 * S_Age  +      0.3135855897556 * S_Height ;
   H114  =    -0.73063677841706 * S_Age  +    -0.12365361591341 * S_Height ;
   H115  =    -1.46419857419918 * S_Age  +     0.64434162441229 * S_Height ;
   H116  =     0.33378419914222 * S_Age  +     0.09154307988709 * S_Height ;
   H117  =    -1.41170526494148 * S_Age  +      0.3254210668726 * S_Height ;
   H118  =     0.12493204794408 * S_Age  +    -0.23931647788827 * S_Height ;
   H119  =    -0.09455312044652 * S_Age  +    -0.28733228859708 * S_Height ;
   H120  =     0.17811104876447 * S_Age  +      0.6267083703096 * S_Height ;
   H121  =    -0.10024846300103 * S_Age  +    -0.17141553612048 * S_Height ;
   H122  =     0.48556723124343 * S_Age  +     -0.1416574101224 * S_Height ;
   H123  =    -0.70619488177889 * S_Age  +    -0.11099441133041 * S_Height ;
   H124  =    -0.01409889991466 * S_Age  +     0.14101861865072 * S_Height ;
   H125  =    -0.12933822871015 * S_Age  +    -0.55676802458878 * S_Height ;
   H126  =    -0.68134917593638 * S_Age  +     0.56189011787734 * S_Height ;
   H127  =    -0.73106893697332 * S_Age  +    -0.04620372424202 * S_Height ;
   H128  =       0.024205257739 * S_Age  +    -0.08012686111062 * S_Height ;
   H129  =     0.47206591026698 * S_Age  +    -0.87573528832973 * S_Height ;
   H130  =     0.99088744805954 * S_Age  +    -0.34168283809629 * S_Height ;
   H131  =     0.66586194161705 * S_Age  +     1.25165449967366 * S_Height ;
   H132  =     -0.0499423057209 * S_Age  +    -0.63909722141554 * S_Height ;
   H133  =    -0.59197263480076 * S_Age  +     0.93467135599042 * S_Height ;
   H134  =     0.16326482451097 * S_Age  +    -0.34415392514713 * S_Height ;
   H135  =     0.30261844671782 * S_Age  +     0.09254501784803 * S_Height ;
   H136  =    -0.31884058039016 * S_Age  +     -0.4707303677389 * S_Height ;
   H137  =     0.50323207187025 * S_Age  +      0.3545323567026 * S_Height ;
   H138  =    -0.41439371802161 * S_Age  +    -0.26089822795624 * S_Height ;
   H139  =    -0.05852288159723 * S_Age  +     0.59468423099665 * S_Height ;
   H140  =    -1.46083502133371 * S_Age  +     0.11779007267324 * S_Height ;
   H101  = H101  +     0.35582486044751 * SexFemale  +    -0.21274391878385 * 
        SmokerCurrent ;
   H102  = H102  +    -0.23124788838468 * SexFemale  +     0.23225094728596 * 
        SmokerCurrent ;
   H103  = H103  +     0.15547777716631 * SexFemale  +     0.25861136402357 * 
        SmokerCurrent ;
   H104  = H104  +    -0.83685480396885 * SexFemale  +    -0.19830694952849 * 
        SmokerCurrent ;
   H105  = H105  +     0.25133167167511 * SexFemale  +     0.06467619149134 * 
        SmokerCurrent ;
   H106  = H106  +    -0.58217786944121 * SexFemale  +    -0.86472266452021 * 
        SmokerCurrent ;
   H107  = H107  +    -0.54161105903614 * SexFemale  +    -0.71247910882596 * 
        SmokerCurrent ;
   H108  = H108  +    -0.07730326043619 * SexFemale  +    -0.34583445884189 * 
        SmokerCurrent ;
   H109  = H109  +     0.51262665361651 * SexFemale  +      0.6148863089894 * 
        SmokerCurrent ;
   H110  = H110  +    -0.78234454487902 * SexFemale  +    -0.20817355794684 * 
        SmokerCurrent ;
   H111  = H111  +     0.77460980155278 * SexFemale  +    -0.17824087864048 * 
        SmokerCurrent ;
   H112  = H112  +    -0.10383857005923 * SexFemale  +    -0.52926920494686 * 
        SmokerCurrent ;
   H113  = H113  +    -0.32376919712773 * SexFemale  +    -0.75149203594604 * 
        SmokerCurrent ;
   H114  = H114  +    -0.22297830246849 * SexFemale  +    -0.07673164029628 * 
        SmokerCurrent ;
   H115  = H115  +    -0.18104738581916 * SexFemale  +     0.70847413676149 * 
        SmokerCurrent ;
   H116  = H116  +    -0.41345250546634 * SexFemale  +    -0.56295401496924 * 
        SmokerCurrent ;
   H117  = H117  +     0.12484511861931 * SexFemale  +     0.14123129046513 * 
        SmokerCurrent ;
   H118  = H118  +     0.45448023591061 * SexFemale  +     0.04963068260077 * 
        SmokerCurrent ;
   H119  = H119  +    -0.25721782469516 * SexFemale  +     0.56475534404206 * 
        SmokerCurrent ;
   H120  = H120  +     -0.9224680021689 * SexFemale  +     0.41684583199562 * 
        SmokerCurrent ;
   H121  = H121  +    -0.58529771353994 * SexFemale  +    -0.51608119780166 * 
        SmokerCurrent ;
   H122  = H122  +     0.02322843797154 * SexFemale  +     0.37742883783226 * 
        SmokerCurrent ;
   H123  = H123  +    -0.07329287019043 * SexFemale  +     0.15042129706752 * 
        SmokerCurrent ;
   H124  = H124  +    -0.55612077636849 * SexFemale  +    -0.58557927573061 * 
        SmokerCurrent ;
   H125  = H125  +     0.46465743479391 * SexFemale  +    -0.08605872398124 * 
        SmokerCurrent ;
   H126  = H126  +     0.45271701681686 * SexFemale  +    -0.12109067756871 * 
        SmokerCurrent ;
   H127  = H127  +    -0.44681197548301 * SexFemale  +    -0.28046213539403 * 
        SmokerCurrent ;
   H128  = H128  +    -0.29385535656047 * SexFemale  +     0.46051012334347 * 
        SmokerCurrent ;
   H129  = H129  +    -0.63813043237753 * SexFemale  +     0.29831491383549 * 
        SmokerCurrent ;
   H130  = H130  +     1.04106694933908 * SexFemale  +     0.34332343813373 * 
        SmokerCurrent ;
   H131  = H131  +     0.49923027104006 * SexFemale  +     0.02574503480627 * 
        SmokerCurrent ;
   H132  = H132  +       0.277964472323 * SexFemale  +     0.18618512944247 * 
        SmokerCurrent ;
   H133  = H133  +    -0.29059416609679 * SexFemale  +    -0.37271628523804 * 
        SmokerCurrent ;
   H134  = H134  +     0.29923697995782 * SexFemale  +     0.42282822690475 * 
        SmokerCurrent ;
   H135  = H135  +    -0.42450167929831 * SexFemale  +    -0.51071127741876 * 
        SmokerCurrent ;
   H136  = H136  +     0.58542873190234 * SexFemale  +     0.03553313997318 * 
        SmokerCurrent ;
   H137  = H137  +    -0.18008308766756 * SexFemale  +    -1.04996310187519 * 
        SmokerCurrent ;
   H138  = H138  +    -0.44748714254165 * SexFemale  +     0.25019630733112 * 
        SmokerCurrent ;
   H139  = H139  +    -0.68870892190858 * SexFemale  +    -0.53327608955681 * 
        SmokerCurrent ;
   H140  = H140  +      0.4001250260234 * SexFemale  +     0.04678879590755 * 
        SmokerCurrent ;
   H101  =     0.56846882726938 + H101 ;
   H102  =    -1.62040501848371 + H102 ;
   H103  =    -1.44652097659139 + H103 ;
   H104  =    -0.97558472871446 + H104 ;
   H105  =     2.12867494129914 + H105 ;
   H106  =    -0.91101607306971 + H106 ;
   H107  =     1.68883084132937 + H107 ;
   H108  =     1.23134914391988 + H108 ;
   H109  =    -0.35331398559771 + H109 ;
   H110  =    -0.34510092074136 + H110 ;
   H111  =    -0.47721733774131 + H111 ;
   H112  =    -0.86012928565692 + H112 ;
   H113  =    -0.32332232841901 + H113 ;
   H114  =     1.14688352471584 + H114 ;
   H115  =     1.02460403301792 + H115 ;
   H116  =     1.85261617283046 + H116 ;
   H117  =    -2.05169210094925 + H117 ;
   H118  =    -1.95770465871956 + H118 ;
   H119  =     0.10773614253936 + H119 ;
   H120  =    -0.75626465041689 + H120 ;
   H121  =     0.42235202356824 + H121 ;
   H122  =    -1.28806046883231 + H122 ;
   H123  =    -2.05031107911315 + H123 ;
   H124  =    -1.41372935740926 + H124 ;
   H125  =     2.03720889717996 + H125 ;
   H126  =    -1.65015728630828 + H126 ;
   H127  =     1.04186862956439 + H127 ;
   H128  =    -1.10028284629791 + H128 ;
   H129  =     2.15586940725653 + H129 ;
   H130  =     1.33695616934656 + H130 ;
   H131  =    -0.10278567386995 + H131 ;
   H132  =     2.08969914274624 + H132 ;
   H133  =    -0.04208817715269 + H133 ;
   H134  =    -0.93116003180812 + H134 ;
   H135  =     1.02779693289577 + H135 ;
   H136  =    -1.54736644092078 + H136 ;
   H137  =    -0.69535734866055 + H137 ;
   H138  =     0.78913239194601 + H138 ;
   H139  =    -2.32644970984034 + H139 ;
   H140  =    -3.40145900620722 + H140 ;
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
   P_FEV  =    -0.75279294541342 * H101  +      0.3339965070942 * H102
          +     0.02939060079885 * H103  +     -0.5535006553834 * H104
          +    -0.65745541527071 * H105  +    -0.42527248870331 * H106
          +    -0.20051906268158 * H107  +    -0.05215084435824 * H108
          +     0.32805926893499 * H109  +     0.30223132944615 * H110
          +      0.1897492510345 * H111  +     0.19441733604887 * H112
          +     0.11485507414597 * H113  +     0.26052126969618 * H114
          +     0.51596457237172 * H115  +     -0.0859363102519 * H116
          +    -0.09887547670261 * H117  +     0.05789500893613 * H118
          +    -0.20413070339348 * H119  +    -0.37694974617106 * H120
          +    -0.22496884936296 * H121  +    -0.07325455551935 * H122
          +    -0.14264404112213 * H123  +     0.19860445427905 * H124
          +     -0.6644202485984 * H125  +    -0.39897744304201 * H126
          +     0.35539432403206 * H127  +    -0.15503052950777 * H128
          +     1.28847869982132 * H129  +    -0.07035863682327 * H130
          +     0.35361148335614 * H131  +     -0.3309170963974 * H132
          +     0.48827807330319 * H133  +     0.23798133164703 * H134
          +    -0.23444263969261 * H135  +    -0.07310624875348 * H136
          +     0.38753247608607 * H137  +     0.09340297200411 * H138
          +     0.03706971261908 * H139  +     -0.1449705471916 * H140 ;
   P_FEV  =     2.65451338613343 + P_FEV ;
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
