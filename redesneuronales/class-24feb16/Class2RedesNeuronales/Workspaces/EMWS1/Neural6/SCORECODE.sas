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
      label S_households = 'Standard: households' ;

      label S_housing_median_age = 'Standard: housing_median_age' ;

      label S_latitude = 'Standard: latitude' ;

      label S_longitude = 'Standard: longitude' ;

      label S_median_income = 'Standard: median_income' ;

      label S_population = 'Standard: population' ;

      label S_total_bedrooms = 'Standard: total_bedrooms' ;

      label S_total_rooms = 'Standard: total_rooms' ;

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

      label P_Median_House_value = 'Predicted: Median_House_value' ;

      label  _WARN_ = "Warnings"; 

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   households , 
   housing_median_age , 
   latitude , 
   longitude , 
   median_income , 
   population , 
   total_bedrooms , 
   total_rooms   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_households  =    -1.29997818721118 +      0.0026065004079 * households ;
   S_housing_median_age  =    -2.27677153380373 +     0.07936381913862 * 
        housing_median_age ;
   S_latitude  =    -16.6649471152464 +     0.46747964209475 * latitude ;
   S_longitude  =     59.5836310473449 +     0.49824964763511 * longitude ;
   S_median_income  =    -2.03564975116779 +     0.52665936004583 * 
        median_income ;
   S_population  =    -1.24024869648448 +     0.00087354886781 * population ;
   S_total_bedrooms  =    -1.26755137087645 +     0.00235881525967 * 
        total_bedrooms ;
   S_total_rooms  =    -1.20796160992754 +     0.00045978816048 * total_rooms
         ;
END;
ELSE DO;
   IF MISSING( households ) THEN S_households  = . ;
   ELSE S_households  =    -1.29997818721118 +      0.0026065004079 * 
        households ;
   IF MISSING( housing_median_age ) THEN S_housing_median_age  = . ;
   ELSE S_housing_median_age  =    -2.27677153380373 +     0.07936381913862 * 
        housing_median_age ;
   IF MISSING( latitude ) THEN S_latitude  = . ;
   ELSE S_latitude  =    -16.6649471152464 +     0.46747964209475 * latitude ;
   IF MISSING( longitude ) THEN S_longitude  = . ;
   ELSE S_longitude  =     59.5836310473449 +     0.49824964763511 * longitude
         ;
   IF MISSING( median_income ) THEN S_median_income  = . ;
   ELSE S_median_income  =    -2.03564975116779 +     0.52665936004583 * 
        median_income ;
   IF MISSING( population ) THEN S_population  = . ;
   ELSE S_population  =    -1.24024869648448 +     0.00087354886781 * 
        population ;
   IF MISSING( total_bedrooms ) THEN S_total_bedrooms  = . ;
   ELSE S_total_bedrooms  =    -1.26755137087645 +     0.00235881525967 * 
        total_bedrooms ;
   IF MISSING( total_rooms ) THEN S_total_rooms  = . ;
   ELSE S_total_rooms  =    -1.20796160992754 +     0.00045978816048 * 
        total_rooms ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H101  =     1.68900048919583 * S_households  +    -0.40006305352033 * 
        S_housing_median_age  +    -2.24310316207337 * S_latitude
          +    -2.00999786223465 * S_longitude  +     0.08743619656953 * 
        S_median_income  +    -8.17884695070406 * S_population
          +    -1.70658609446593 * S_total_bedrooms  +     6.11497225708279 * 
        S_total_rooms ;
   H102  =       1.295692869634 * S_households  +    -1.46544878102441 * 
        S_housing_median_age  +    -0.58441266773487 * S_latitude
          +     1.76437114550359 * S_longitude  +     0.38486659035653 * 
        S_median_income  +     1.11475062377658 * S_population
          +     1.45966967032797 * S_total_bedrooms  +      0.7984163870442 * 
        S_total_rooms ;
   H103  =    -2.69396607281414 * S_households  +    -0.38135349892943 * 
        S_housing_median_age  +    -5.07367403180782 * S_latitude
          +    -4.26103445874791 * S_longitude  +    -1.15467094440068 * 
        S_median_income  +    -0.05377188293535 * S_population
          +     3.33166522875421 * S_total_bedrooms  +     0.03353765967398 * 
        S_total_rooms ;
   H104  =    -2.99729568381722 * S_households  +     0.61719257714043 * 
        S_housing_median_age  +     0.52366986371358 * S_latitude
          +     1.46967423133116 * S_longitude  +    -2.27398440704917 * 
        S_median_income  +     0.30234744607965 * S_population
          +     0.34395416981111 * S_total_bedrooms  +     3.78276609473456 * 
        S_total_rooms ;
   H105  =     -3.9651950529373 * S_households  +    -2.22326710144042 * 
        S_housing_median_age  +     -0.3674468293326 * S_latitude
          +    -1.32971980556324 * S_longitude  +    -0.36159980888237 * 
        S_median_income  +     3.82160924723126 * S_population
          +    -4.73631374122788 * S_total_bedrooms  +     3.14465192406058 * 
        S_total_rooms ;
   H106  =     1.37588075570066 * S_households  +     0.32472343212231 * 
        S_housing_median_age  +     0.87272272349854 * S_latitude
          +     0.37924197208564 * S_longitude  +    -1.43984643706724 * 
        S_median_income  +     0.55165476748767 * S_population
          +     0.32772086595131 * S_total_bedrooms  +    -2.61885515980397 * 
        S_total_rooms ;
   H107  =    -1.44869464355034 * S_households  +    -3.25827643996745 * 
        S_housing_median_age  +     0.52687757408327 * S_latitude
          +      1.5988417106358 * S_longitude  +    -2.31900674307175 * 
        S_median_income  +    -4.17728433756799 * S_population
          +     1.22153215400561 * S_total_bedrooms  +     -0.7018151705126 * 
        S_total_rooms ;
   H108  =     0.92083328436177 * S_households  +     0.26849413971777 * 
        S_housing_median_age  +    -14.4405276485872 * S_latitude
          +    -10.6012134726013 * S_longitude  +     0.03274612232984 * 
        S_median_income  +    -0.07037146261965 * S_population
          +     -0.7513056755105 * S_total_bedrooms  +    -0.08657431239534 * 
        S_total_rooms ;
   H109  =    -1.13309587570623 * S_households  +    -0.99906147295643 * 
        S_housing_median_age  +     1.98398158998213 * S_latitude
          +      1.4677892981767 * S_longitude  +    -1.09647989123128 * 
        S_median_income  +     2.79910725695647 * S_population
          +    -2.48274612368994 * S_total_bedrooms  +     1.47168780281928 * 
        S_total_rooms ;
   H110  =     0.76559302859476 * S_households  +       -0.66609228351 * 
        S_housing_median_age  +    -7.49118395402054 * S_latitude
          +     4.88191574010332 * S_longitude  +     1.00076781770241 * 
        S_median_income  +     0.92963636402052 * S_population
          +      0.8993541054804 * S_total_bedrooms  +    -3.13197674428371 * 
        S_total_rooms ;
   H111  =     2.57796392815333 * S_households  +    -0.03128177018456 * 
        S_housing_median_age  +    -2.59546909886358 * S_latitude
          +     5.65890793872013 * S_longitude  +     0.64029376541486 * 
        S_median_income  +    -2.59157312242019 * S_population
          +     1.40221390751832 * S_total_bedrooms  +    -1.21551221051555 * 
        S_total_rooms ;
   H112  =     3.38822820506311 * S_households  +     -1.7248793917669 * 
        S_housing_median_age  +     1.23424389417364 * S_latitude
          +     2.10844180204224 * S_longitude  +     0.65716284127268 * 
        S_median_income  +    -9.27526208580849 * S_population
          +       3.087139038863 * S_total_bedrooms  +      1.3047732642577 * 
        S_total_rooms ;
   H113  =     2.47909564183829 * S_households  +     0.79620613800389 * 
        S_housing_median_age  +     0.63587130537931 * S_latitude
          +     0.05467863515991 * S_longitude  +       1.316832537653 * 
        S_median_income  +     -5.4676663668859 * S_population
          +    -0.32569653962988 * S_total_bedrooms  +     3.82936951296586 * 
        S_total_rooms ;
   H114  =      0.4183713983153 * S_households  +    -0.33351342101105 * 
        S_housing_median_age  +     1.84867591018061 * S_latitude
          +     3.47014093300881 * S_longitude  +    -0.88295633971191 * 
        S_median_income  +    -3.43566964775911 * S_population
          +     0.70551381934243 * S_total_bedrooms  +     5.73427414446966 * 
        S_total_rooms ;
   H115  =    -0.02547242009815 * S_households  +    -2.00416139741647 * 
        S_housing_median_age  +     0.71174440435451 * S_latitude
          +    -3.52340590666638 * S_longitude  +     -2.0846781378827 * 
        S_median_income  +    -5.65681449375557 * S_population
          +     4.56617208192515 * S_total_bedrooms  +    -0.00003923629672 * 
        S_total_rooms ;
   H116  =    -3.40292542424639 * S_households  +     4.19439685433759 * 
        S_housing_median_age  +     1.48294009001415 * S_latitude
          +    -1.08756425178258 * S_longitude  +    -4.77659008045722 * 
        S_median_income  +     1.82025586900681 * S_population
          +    -2.18563048961489 * S_total_bedrooms  +      1.3587438101109 * 
        S_total_rooms ;
   H117  =     0.15734147966586 * S_households  +      2.1034968119754 * 
        S_housing_median_age  +     0.70599036185485 * S_latitude
          +     0.21744231534257 * S_longitude  +     3.08876425626439 * 
        S_median_income  +    -0.48293230290285 * S_population
          +     2.27851838471154 * S_total_bedrooms  +    -0.65818904137955 * 
        S_total_rooms ;
   H118  =    -2.70668634262157 * S_households  +     0.91004841521907 * 
        S_housing_median_age  +    -9.97307874819937 * S_latitude
          +     7.62732759443757 * S_longitude  +    -1.88350169070715 * 
        S_median_income  +     1.90673170213703 * S_population
          +    -0.29993146948382 * S_total_bedrooms  +     1.39181095312214 * 
        S_total_rooms ;
   H119  =     0.00593183169595 * S_households  +     0.02266639727079 * 
        S_housing_median_age  +     0.05793876742668 * S_latitude
          +    -0.91561937429081 * S_longitude  +     0.85725040798984 * 
        S_median_income  +     0.41813720989224 * S_population
          +    -0.65100711062207 * S_total_bedrooms  +    -0.63813672017635 * 
        S_total_rooms ;
   H120  =     2.54842591575269 * S_households  +     0.20287598236139 * 
        S_housing_median_age  +     -3.6254231852132 * S_latitude
          +    -2.38173103888273 * S_longitude  +     0.41081572335352 * 
        S_median_income  +     1.50829188124222 * S_population
          +     -3.7414716984837 * S_total_bedrooms  +    -1.85084091029429 * 
        S_total_rooms ;
   H121  =    -1.53351372687375 * S_households  +    -0.27185158379226 * 
        S_housing_median_age  +    -6.07784327046313 * S_latitude
          +    -6.01903296101448 * S_longitude  +     0.56061896792068 * 
        S_median_income  +     0.35833216797464 * S_population
          +     2.42202509086531 * S_total_bedrooms  +    -0.98525365379096 * 
        S_total_rooms ;
   H122  =    -0.58377601377932 * S_households  +     0.69159313825515 * 
        S_housing_median_age  +    -1.57246862701759 * S_latitude
          +     2.27775815322893 * S_longitude  +    -7.22102429158822 * 
        S_median_income  +     2.12536488393147 * S_population
          +    -0.66340043195391 * S_total_bedrooms  +     -0.0351073782555 * 
        S_total_rooms ;
   H123  =    -0.21218974372749 * S_households  +     0.11346195739106 * 
        S_housing_median_age  +    -1.52395985334753 * S_latitude
          +     6.68632162710619 * S_longitude  +     0.77631272979521 * 
        S_median_income  +    -1.15990726216114 * S_population
          +     1.85088611230959 * S_total_bedrooms  +    -0.89120541425325 * 
        S_total_rooms ;
   H124  =     0.48717743345273 * S_households  +    -0.80116589654096 * 
        S_housing_median_age  +     0.23631442541803 * S_latitude
          +    -0.62802046088898 * S_longitude  +     1.27386870285304 * 
        S_median_income  +     0.35239691619195 * S_population
          +    -0.49723095505987 * S_total_bedrooms  +     0.46968831273653 * 
        S_total_rooms ;
   H125  =    -0.18996152566917 * S_households  +    -0.22162120478965 * 
        S_housing_median_age  +    -0.35221020023558 * S_latitude
          +     0.07840066472387 * S_longitude  +     0.00939754233479 * 
        S_median_income  +    -0.28800916621911 * S_population
          +     0.42034020954667 * S_total_bedrooms  +    -0.10424244599458 * 
        S_total_rooms ;
   H126  =     0.08805391726173 * S_households  +    -3.14409171112343 * 
        S_housing_median_age  +     0.95393178795619 * S_latitude
          +     1.71375064516843 * S_longitude  +    -4.29897767071217 * 
        S_median_income  +    -2.37102554580482 * S_population
          +     1.87876074009646 * S_total_bedrooms  +     -0.6326543740581 * 
        S_total_rooms ;
   H127  =    -1.43625297698085 * S_households  +     5.28543382768128 * 
        S_housing_median_age  +     0.71415939283349 * S_latitude
          +    -1.56451381935897 * S_longitude  +     4.30074861487807 * 
        S_median_income  +    -2.30541119383295 * S_population
          +    -1.90325476983538 * S_total_bedrooms  +    -0.40238674662853 * 
        S_total_rooms ;
   H128  =     1.46213963702497 * S_households  +    -1.76880594145434 * 
        S_housing_median_age  +     1.83316091716261 * S_latitude
          +     0.70738588983582 * S_longitude  +    -0.30226933752263 * 
        S_median_income  +     1.38574995605824 * S_population
          +     3.02746478711935 * S_total_bedrooms  +    -2.15316426317667 * 
        S_total_rooms ;
   H129  =     0.05609739253563 * S_households  +    -0.71096186137319 * 
        S_housing_median_age  +     0.32096984090565 * S_latitude
          +    -0.66742630093956 * S_longitude  +     0.19111830262755 * 
        S_median_income  +    -0.34994121925247 * S_population
          +      0.3811412861433 * S_total_bedrooms  +     0.09675358108057 * 
        S_total_rooms ;
   H130  =     2.34399819383624 * S_households  +    -0.43957754417119 * 
        S_housing_median_age  +     3.12202515980945 * S_latitude
          +     6.12000624351847 * S_longitude  +    -0.27001463655115 * 
        S_median_income  +    -0.68570418445263 * S_population
          +        0.44442498632 * S_total_bedrooms  +    -1.46268132442371 * 
        S_total_rooms ;
   H101  =    -2.10366755531147 + H101 ;
   H102  =     5.00226563533621 + H102 ;
   H103  =    -3.06547439515634 + H103 ;
   H104  =    -1.43323392865218 + H104 ;
   H105  =     6.74026511187881 + H105 ;
   H106  =     2.55834317188949 + H106 ;
   H107  =     4.98615817396336 + H107 ;
   H108  =    -0.39407917282218 + H108 ;
   H109  =     2.49220409720121 + H109 ;
   H110  =     8.67327821408238 + H110 ;
   H111  =    -4.95998833839414 + H111 ;
   H112  =     0.12059268004839 + H112 ;
   H113  =    -1.33100403421689 + H113 ;
   H114  =      2.6052510250195 + H114 ;
   H115  =     -9.2803609336592 + H115 ;
   H116  =    -2.58393253539334 + H116 ;
   H117  =    -3.96408799937504 + H117 ;
   H118  =    -7.91622493284628 + H118 ;
   H119  =     4.41972409660915 + H119 ;
   H120  =    -2.87409385448806 + H120 ;
   H121  =     -1.2278091774224 + H121 ;
   H122  =     1.50209983351657 + H122 ;
   H123  =     -6.3138355542136 + H123 ;
   H124  =    -1.95559292372356 + H124 ;
   H125  =    -0.86576357668372 + H125 ;
   H126  =    -1.98696392289279 + H126 ;
   H127  =     0.73711332078131 + H127 ;
   H128  =     3.12827186950415 + H128 ;
   H129  =      1.5231549488772 + H129 ;
   H130  =    -2.96333893055282 + H130 ;
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
   P_Median_House_value  =     24501.8535472657 * H101
          +     7758.53850048269 * H102  +    -28980.5833441562 * H103
          +     -9198.0623137718 * H104  +     10913.0595540518 * H105
          +    -18204.4297201924 * H106  +    -8370.64682235052 * H107
          +     19805.9588059789 * H108  +    -50475.1639597778 * H109
          +    -5097.71340269533 * H110  +     37017.9860021577 * H111
          +     9623.91760057853 * H112  +     16923.4164776598 * H113
          +    -9737.67189892901 * H114  +    -17660.4997474023 * H115
          +    -5678.08321004284 * H116  +     19092.2280468877 * H117
          +     10755.4616275911 * H118  +     1763.44659585325 * H119
          +    -25885.5745101339 * H120  +     36887.8539811884 * H121
          +    -5218.90465206534 * H122  +    -25344.3095756261 * H123
          +     491.918103149241 * H124  +    -289.721277226165 * H125
          +    -5464.21850809807 * H126  +     2971.59233469896 * H127
          +     7893.38037480819 * H128  +      90.482162290516 * H129
          +    -19568.3588373608 * H130 ;
   P_Median_House_value  =     207030.544175053 + P_Median_House_value ;
END;
ELSE DO;
   P_Median_House_value  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Median_House_value  =     207030.543673864;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
