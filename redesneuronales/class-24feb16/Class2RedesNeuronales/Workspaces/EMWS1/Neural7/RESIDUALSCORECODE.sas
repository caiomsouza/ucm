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

      label P_Median_House_value = 'Predicted: Median_House_value' ;

      label R_Median_House_value = 'Residual: Median_House_value' ;

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
   H101  =     0.19542078991329 * S_households  +     0.48919266005998 * 
        S_housing_median_age  +    -1.48670475692308 * S_latitude
          +     2.06343702956357 * S_longitude  +    -0.60679266750218 * 
        S_median_income  +     0.15159027183934 * S_population
          +     -1.1053258362182 * S_total_bedrooms  +     0.09350457279022 * 
        S_total_rooms ;
   H102  =     1.05826378659402 * S_households  +    -0.57846951572558 * 
        S_housing_median_age  +     1.63413200088859 * S_latitude
          +     1.35439605636781 * S_longitude  +    -0.63434619118332 * 
        S_median_income  +     3.19522774227131 * S_population
          +    -2.75801118270113 * S_total_bedrooms  +    -1.07372783034304 * 
        S_total_rooms ;
   H103  =     1.04445435018241 * S_households  +     0.37998469439137 * 
        S_housing_median_age  +     4.56767943623265 * S_latitude
          +     4.05158176627726 * S_longitude  +     0.87013925903305 * 
        S_median_income  +     1.16214001156532 * S_population
          +    -1.34876994114975 * S_total_bedrooms  +    -1.68651644451023 * 
        S_total_rooms ;
   H104  =    -0.62958440149861 * S_households  +     1.74275259521935 * 
        S_housing_median_age  +     5.56776937189238 * S_latitude
          +    -1.17044146908579 * S_longitude  +     0.67418975751775 * 
        S_median_income  +      3.7213426946207 * S_population
          +     -3.1174108464598 * S_total_bedrooms  +     1.11156531859397 * 
        S_total_rooms ;
   H105  =    -1.22424574080084 * S_households  +    -0.42000415485773 * 
        S_housing_median_age  +      0.7621771627641 * S_latitude
          +     0.61964194179826 * S_longitude  +    -1.95722189466828 * 
        S_median_income  +     1.81316121782117 * S_population
          +    -0.17500774817916 * S_total_bedrooms  +    -0.70454377516803 * 
        S_total_rooms ;
   H106  =     0.17230854277042 * S_households  +     -0.6291579918312 * 
        S_housing_median_age  +     0.21255463078913 * S_latitude
          +     0.55506258836687 * S_longitude  +     -0.1158733762553 * 
        S_median_income  +     -5.3246894141015 * S_population
          +     2.23193913204415 * S_total_bedrooms  +     2.86737112610051 * 
        S_total_rooms ;
   H107  =    -0.19506752599993 * S_households  +     -5.1927564328213 * 
        S_housing_median_age  +      1.6620111874698 * S_latitude
          +     3.43220155357794 * S_longitude  +     2.52474212255582 * 
        S_median_income  +    -1.33413037282279 * S_population
          +    -2.75280527790498 * S_total_bedrooms  +     1.18401704584451 * 
        S_total_rooms ;
   H108  =      0.6581273985339 * S_households  +     1.17361066420539 * 
        S_housing_median_age  +     0.99734087375522 * S_latitude
          +     0.08669884370051 * S_longitude  +     -3.4699989557347 * 
        S_median_income  +    -3.58700604305846 * S_population
          +     2.07132540984954 * S_total_bedrooms  +     1.42580061725903 * 
        S_total_rooms ;
   H109  =     2.26715283071953 * S_households  +     0.57942901957914 * 
        S_housing_median_age  +     0.47345768237334 * S_latitude
          +    -2.14868972598462 * S_longitude  +     2.85293229282838 * 
        S_median_income  +     0.19201678708003 * S_population
          +    -0.80266168792868 * S_total_bedrooms  +    -1.26995544501801 * 
        S_total_rooms ;
   H110  =    -0.54444480020334 * S_households  +      0.1813930021453 * 
        S_housing_median_age  +    -1.50213183833399 * S_latitude
          +    -0.03562667884167 * S_longitude  +     2.08946895914679 * 
        S_median_income  +     5.76984235091516 * S_population
          +    -3.97391893474459 * S_total_bedrooms  +    -4.07281094040475 * 
        S_total_rooms ;
   H111  =     0.54849564758497 * S_households  +    -0.72602155511434 * 
        S_housing_median_age  +    -1.73364123381631 * S_latitude
          +     0.08223395607793 * S_longitude  +    -2.37870338780992 * 
        S_median_income  +      -3.439442476738 * S_population
          +     3.26759838473414 * S_total_bedrooms  +    -0.04656421408727 * 
        S_total_rooms ;
   H112  =     0.12304709456862 * S_households  +     0.06739197992779 * 
        S_housing_median_age  +    -8.80329395672408 * S_latitude
          +    -6.91236526517712 * S_longitude  +     0.06340877308212 * 
        S_median_income  +     0.94243999561579 * S_population
          +    -0.83884654927918 * S_total_bedrooms  +    -0.09576232446763 * 
        S_total_rooms ;
   H113  =      0.2560054347476 * S_households  +     0.00263917913689 * 
        S_housing_median_age  +    -6.79656808898637 * S_latitude
          +     0.49424604415565 * S_longitude  +    -0.13042508072836 * 
        S_median_income  +    -0.97458065145711 * S_population
          +     0.20848915209623 * S_total_bedrooms  +        0.59749216187 * 
        S_total_rooms ;
   H114  =    -0.88989060313365 * S_households  +     1.04742810094707 * 
        S_housing_median_age  +     3.19244224113243 * S_latitude
          +    -0.85644296748897 * S_longitude  +    -0.61879590803519 * 
        S_median_income  +     4.02751595706638 * S_population
          +    -2.33961581987064 * S_total_bedrooms  +      -1.746865972561 * 
        S_total_rooms ;
   H115  =    -0.43007973653186 * S_households  +    -0.51669079255872 * 
        S_housing_median_age  +       3.483961588349 * S_latitude
          +    -0.39223162861417 * S_longitude  +    -1.59221038194452 * 
        S_median_income  +     -5.8483707240242 * S_population
          +     5.05928776665352 * S_total_bedrooms  +     1.90984621288762 * 
        S_total_rooms ;
   H116  =     0.13718979912646 * S_households  +     1.66437436605516 * 
        S_housing_median_age  +     1.81975593649394 * S_latitude
          +    -3.93536282401053 * S_longitude  +     2.10276753403706 * 
        S_median_income  +    -0.97304720491007 * S_population
          +     -0.2982963976852 * S_total_bedrooms  +     0.55943481086179 * 
        S_total_rooms ;
   H117  =     0.39765733142643 * S_households  +    -0.63941359568153 * 
        S_housing_median_age  +    -4.46729107140236 * S_latitude
          +     -5.9576654030781 * S_longitude  +     0.37402657249819 * 
        S_median_income  +    -2.00070765294541 * S_population
          +     1.95966913877819 * S_total_bedrooms  +     0.75585072548026 * 
        S_total_rooms ;
   H118  =     5.42276093291198 * S_households  +     1.61579892284399 * 
        S_housing_median_age  +     0.57273663398297 * S_latitude
          +     0.42659170717304 * S_longitude  +     0.98904918878263 * 
        S_median_income  +    -2.38049875677246 * S_population
          +     2.61608898307012 * S_total_bedrooms  +    -6.65429349261025 * 
        S_total_rooms ;
   H119  =      0.7689177931033 * S_households  +     2.52245918357521 * 
        S_housing_median_age  +    -0.18086440415484 * S_latitude
          +    -1.05613877422323 * S_longitude  +      0.5909056800751 * 
        S_median_income  +     4.62211884032448 * S_population
          +    -0.64446489910229 * S_total_bedrooms  +    -1.27011131410824 * 
        S_total_rooms ;
   H120  =    -4.09882294449504 * S_households  +    -1.97468098437306 * 
        S_housing_median_age  +     1.30209476929527 * S_latitude
          +     1.12273626591625 * S_longitude  +     0.03552994902716 * 
        S_median_income  +     4.39646464858811 * S_population
          +    -4.25074382330301 * S_total_bedrooms  +     2.99220959243186 * 
        S_total_rooms ;
   H101  =     -3.4587187868302 + H101 ;
   H102  =     1.66707894680406 + H102 ;
   H103  =     2.96404197572286 + H103 ;
   H104  =    -2.47914777632832 + H104 ;
   H105  =     2.25662693605645 + H105 ;
   H106  =    -0.05932166913687 + H106 ;
   H107  =     4.78884527262108 + H107 ;
   H108  =     -6.7182564178583 + H108 ;
   H109  =    -2.88582286701042 + H109 ;
   H110  =     2.00836529284432 + H110 ;
   H111  =    -5.10462629754352 + H111 ;
   H112  =    -0.11511407078497 + H112 ;
   H113  =    -3.16765654733007 + H113 ;
   H114  =      7.6394657832891 + H114 ;
   H115  =    -8.38823515405235 + H115 ;
   H116  =     5.71099814744898 + H116 ;
   H117  =    -2.80328791682599 + H117 ;
   H118  =    -2.40202220443194 + H118 ;
   H119  =    -4.59395985034622 + H119 ;
   H120  =    -3.36431351285865 + H120 ;
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
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_Median_House_value  =    -36103.0071199725 * H101
          +     -62945.667759873 * H102  +     29938.8397272484 * H103
          +     31036.6362420692 * H104  +    -37861.6494120158 * H105
          +      34078.235829873 * H106  +      13351.591500154 * H107
          +    -11448.2762117339 * H108  +      17257.926722576 * H109
          +     11382.1711869566 * H110  +    -13254.9696498995 * H111
          +     42506.4045584637 * H112  +     44345.3541952657 * H113
          +     11283.3972409083 * H114  +    -12881.3065497001 * H115
          +     7388.51610041456 * H116  +     26019.8788461786 * H117
          +     21265.9638007336 * H118  +     7173.18984941388 * H119
          +     5792.74947623061 * H120 ;
   P_Median_House_value  =     207030.546454305 + P_Median_House_value ;
END;
ELSE DO;
   P_Median_House_value  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Median_House_value  =     207030.543673864;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( Median_House_value ) THEN R_Median_House_value  = . ;
ELSE R_Median_House_value  = Median_House_value  - P_Median_House_value ;
********************************;
*** End Scoring Code for Neural;
********************************;
