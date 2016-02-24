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
   H101  =      2.7109605820699 * S_households  +    -0.14807202081156 * 
        S_housing_median_age  +     4.43757384794541 * S_latitude
          +     3.51545081285743 * S_longitude  +     0.04117528194863 * 
        S_median_income  +    -1.06052611593778 * S_population
          +    -1.75522834601459 * S_total_bedrooms  +    -0.00988952408632 * 
        S_total_rooms ;
   H102  =    -1.39119650223033 * S_households  +    -0.64800473172884 * 
        S_housing_median_age  +     -0.0697270155653 * S_latitude
          +     0.00241844922332 * S_longitude  +    -1.15379381699911 * 
        S_median_income  +     2.36588432558597 * S_population
          +    -0.62597430347976 * S_total_bedrooms  +    -0.13577092714083 * 
        S_total_rooms ;
   H103  =     2.87596381137107 * S_households  +     0.72883862618745 * 
        S_housing_median_age  +     2.21031623364879 * S_latitude
          +     2.04878069237977 * S_longitude  +     1.03739463561624 * 
        S_median_income  +     0.60826389104803 * S_population
          +    -3.30944505615546 * S_total_bedrooms  +    -0.53260437478463 * 
        S_total_rooms ;
   H104  =    -1.46096055864576 * S_households  +    -1.28784139031672 * 
        S_housing_median_age  +     0.14131527529844 * S_latitude
          +    -0.23409077273972 * S_longitude  +     -0.5870430526646 * 
        S_median_income  +    -0.08707326860627 * S_population
          +    -4.22573265047186 * S_total_bedrooms  +     5.47175553073681 * 
        S_total_rooms ;
   H105  =     -1.6347715893427 * S_households  +     0.13228439026008 * 
        S_housing_median_age  +     -0.7351866001265 * S_latitude
          +    -0.47265112488228 * S_longitude  +    -0.45440930765635 * 
        S_median_income  +     0.61622832867414 * S_population
          +     0.49540172081759 * S_total_bedrooms  +     0.62948136875863 * 
        S_total_rooms ;
   H106  =    -4.02899698917244 * S_households  +     -0.3492315833977 * 
        S_housing_median_age  +    -3.17037424821675 * S_latitude
          +    -3.01279719766534 * S_longitude  +      0.3082052345364 * 
        S_median_income  +    -2.33035996474472 * S_population
          +      6.0912662522608 * S_total_bedrooms  +     0.80434024229201 * 
        S_total_rooms ;
   H107  =     0.95256186541986 * S_households  +    -0.36215101331261 * 
        S_housing_median_age  +    -1.57794723200069 * S_latitude
          +    -1.11537901699895 * S_longitude  +     0.75430965583433 * 
        S_median_income  +     0.91374482390041 * S_population
          +    -0.96486999102215 * S_total_bedrooms  +    -1.24872485301072 * 
        S_total_rooms ;
   H108  =    -0.32925953512544 * S_households  +    -1.44482832370763 * 
        S_housing_median_age  +     0.98224398758638 * S_latitude
          +    -0.16253364031949 * S_longitude  +    -1.01001764792863 * 
        S_median_income  +     0.81926797484536 * S_population
          +     0.05055342660829 * S_total_bedrooms  +    -0.63052973838411 * 
        S_total_rooms ;
   H109  =    -0.49758952821609 * S_households  +     0.24941064314335 * 
        S_housing_median_age  +     1.63411870880163 * S_latitude
          +    -2.36557724225307 * S_longitude  +     0.20219993148309 * 
        S_median_income  +     0.67256826082897 * S_population
          +    -0.97976000329087 * S_total_bedrooms  +     0.67215956847162 * 
        S_total_rooms ;
   H110  =     0.22322670678983 * S_households  +    -0.80871457383006 * 
        S_housing_median_age  +    -1.39818724195618 * S_latitude
          +    -0.95498095998091 * S_longitude  +    -0.61339384843014 * 
        S_median_income  +     0.65490084837726 * S_population
          +    -2.80054039105598 * S_total_bedrooms  +      1.4507228871486 * 
        S_total_rooms ;
   H101  =     -0.0334958277499 + H101 ;
   H102  =     1.64931328564728 + H102 ;
   H103  =     1.37731808117543 + H103 ;
   H104  =    -2.62056517210088 + H104 ;
   H105  =    -0.53304239763685 + H105 ;
   H106  =     -0.5480615577028 + H106 ;
   H107  =     1.15439517651227 + H107 ;
   H108  =    -4.30842114325723 + H108 ;
   H109  =     4.82768121003612 + H109 ;
   H110  =      3.1908529921724 + H110 ;
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
   P_Median_House_value  =    -53376.9637418199 * H101
          +    -95660.1733670325 * H102  +     37182.6578367105 * H103
          +     27760.9176232004 * H104  +     -55646.179255876 * H105
          +     52986.4107062098 * H106  +     10756.0571524482 * H107
          +     -6799.5664022772 * H108  +     10511.6422923358 * H109
          +     20517.3608852097 * H110 ;
   P_Median_House_value  =     207030.545414482 + P_Median_House_value ;
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
