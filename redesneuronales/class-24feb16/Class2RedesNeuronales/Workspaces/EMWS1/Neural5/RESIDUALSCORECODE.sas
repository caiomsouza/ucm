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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
   H11  =     0.37160946776891 * S_households  +     0.50953184455661 * 
        S_housing_median_age  +     -0.5162247359858 * S_latitude
          +    -0.51813675338882 * S_longitude  +     0.28411890127106 * 
        S_median_income  +     5.01213306230927 * S_population
          +    -5.18336298268466 * S_total_bedrooms  +     0.11929791044519 * 
        S_total_rooms ;
   H12  =     0.17632578734565 * S_households  +     0.10110857181965 * 
        S_housing_median_age  +    -1.67862458861334 * S_latitude
          +    -1.52587822904388 * S_longitude  +     1.00763021709408 * 
        S_median_income  +     0.91116247531588 * S_population
          +    -0.28348841602773 * S_total_bedrooms  +    -0.81742747191528 * 
        S_total_rooms ;
   H13  =     0.48908274293229 * S_households  +     0.31119800461911 * 
        S_housing_median_age  +    -1.00764220845647 * S_latitude
          +    -0.90742973567129 * S_longitude  +     0.70846433740998 * 
        S_median_income  +     -0.7255815768973 * S_population
          +    -0.02948958169819 * S_total_bedrooms  +     0.28936764684424 * 
        S_total_rooms ;
   H11  =     0.33714445727538 + H11 ;
   H12  =     0.62436332437131 + H12 ;
   H13  =      -1.174038536013 + H13 ;
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
   P_Median_House_value  =    -41464.9519783981 * H11
          +     70831.6486358323 * H12  +     162322.418745614 * H13 ;
   P_Median_House_value  =     295270.148089782 + P_Median_House_value ;
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
