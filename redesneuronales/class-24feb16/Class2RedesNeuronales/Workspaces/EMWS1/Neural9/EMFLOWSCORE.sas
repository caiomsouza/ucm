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
   H101  =    -3.69431156887208 * S_households  +    -0.17131514803868 *
        S_housing_median_age  +    -1.63907737101081 * S_latitude
          +    -1.64339878058849 * S_longitude  +    -0.14315563307201 *
        S_median_income  +    -3.74043807335019 * S_population
          +     0.60127192697811 * S_total_bedrooms  +     6.96436290067436 *
        S_total_rooms ;
   H102  =    -1.38531372088456 * S_households  +    -1.50593042722719 *
        S_housing_median_age  +     4.50600142477326 * S_latitude
          +     3.17978815006952 * S_longitude  +    -1.96922213314095 *
        S_median_income  +    -0.95709824435768 * S_population
          +     2.34101970449669 * S_total_bedrooms  +     1.46921787090614 *
        S_total_rooms ;
   H103  =     0.36069146680559 * S_households  +    -2.99601756434894 *
        S_housing_median_age  +     3.15777292718469 * S_latitude
          +     3.04140029923305 * S_longitude  +    -2.42615931371369 *
        S_median_income  +     0.48255920077074 * S_population
          +    -1.64495304763238 * S_total_bedrooms  +    -0.80148227970249 *
        S_total_rooms ;
   H104  =    -3.14089279755792 * S_households  +    -3.82725074564313 *
        S_housing_median_age  +      0.1653311434758 * S_latitude
          +     1.36194552633678 * S_longitude  +     -2.8013869873836 *
        S_median_income  +     1.21747458264009 * S_population
          +    -2.34613501851873 * S_total_bedrooms  +    -0.05187740355736 *
        S_total_rooms ;
   H105  =     0.52774629126757 * S_households  +    -0.22657151559963 *
        S_housing_median_age  +      5.6999206575035 * S_latitude
          +    -0.49592718150001 * S_longitude  +    -0.71383425138045 *
        S_median_income  +    -0.66983546577454 * S_population
          +    -1.96692567409846 * S_total_bedrooms  +     1.90957520136583 *
        S_total_rooms ;
   H106  =    -0.31450048335616 * S_households  +     -1.7057446946377 *
        S_housing_median_age  +    -1.16097881724821 * S_latitude
          +    -0.88369516596102 * S_longitude  +     -0.8092760306582 *
        S_median_income  +    -1.96017266210071 * S_population
          +     3.04790034744107 * S_total_bedrooms  +    -1.41362060079648 *
        S_total_rooms ;
   H107  =    -0.85400535543634 * S_households  +     0.19160516330036 *
        S_housing_median_age  +     3.11891941368955 * S_latitude
          +     0.41427748692353 * S_longitude  +    -0.36656036374208 *
        S_median_income  +     -2.8184912307821 * S_population
          +     3.27748281561366 * S_total_bedrooms  +     0.23491341047876 *
        S_total_rooms ;
   H108  =    -1.02783568393827 * S_households  +     0.04327973738678 *
        S_housing_median_age  +    -12.7625087129598 * S_latitude
          +    -9.91744429273195 * S_longitude  +     0.32089573393233 *
        S_median_income  +     0.18918177758595 * S_population
          +     0.30072492171284 * S_total_bedrooms  +     0.59207526710942 *
        S_total_rooms ;
   H109  =      4.8306245935282 * S_households  +     0.28128912089769 *
        S_housing_median_age  +    -1.04279652266321 * S_latitude
          +     4.73804576796013 * S_longitude  +     0.00809942768652 *
        S_median_income  +    -2.62601184273795 * S_population
          +    -0.73806928912363 * S_total_bedrooms  +    -1.70443515329819 *
        S_total_rooms ;
   H110  =     0.64468879115942 * S_households  +     0.46451165038658 *
        S_housing_median_age  +    -0.80418595191931 * S_latitude
          +     0.17764829733078 * S_longitude  +    -0.32008351713735 *
        S_median_income  +     -1.0988303262517 * S_population
          +     0.90244622794958 * S_total_bedrooms  +     0.51501995770994 *
        S_total_rooms ;
   H111  =     2.63685830766389 * S_households  +      1.4186166754105 *
        S_housing_median_age  +    -3.10165428793374 * S_latitude
          +    -1.86771995691037 * S_longitude  +     2.53484182616111 *
        S_median_income  +     -6.7377760234075 * S_population
          +      0.0381264877937 * S_total_bedrooms  +     1.07279343246735 *
        S_total_rooms ;
   H112  =     1.10467441696915 * S_households  +    -2.06931507296403 *
        S_housing_median_age  +    -1.32826286345315 * S_latitude
          +    -0.59096621521414 * S_longitude  +     0.56793059111452 *
        S_median_income  +    -2.73485199811572 * S_population
          +     1.85357313844108 * S_total_bedrooms  +     -0.9539127024862 *
        S_total_rooms ;
   H113  =    -3.67837074852113 * S_households  +     1.32370406949374 *
        S_housing_median_age  +    -0.53105500999044 * S_latitude
          +    -1.20676522451068 * S_longitude  +    -0.30954687436797 *
        S_median_income  +      2.9017007158795 * S_population
          +     1.28153502673496 * S_total_bedrooms  +     2.82240884989314 *
        S_total_rooms ;
   H114  =     -0.8306785097415 * S_households  +    -0.08946041487173 *
        S_housing_median_age  +     2.00516646939033 * S_latitude
          +     2.22656110260273 * S_longitude  +    -1.39693114940181 *
        S_median_income  +     0.02640456040892 * S_population
          +    -1.62703469423449 * S_total_bedrooms  +     2.98969328824071 *
        S_total_rooms ;
   H115  =    -2.00789954643749 * S_households  +     0.00302461013627 *
        S_housing_median_age  +    -1.19667110099377 * S_latitude
          +    -0.99216203974944 * S_longitude  +    -2.45508042152655 *
        S_median_income  +    -1.44952337431946 * S_population
          +     1.29784823012721 * S_total_bedrooms  +     2.60357639953469 *
        S_total_rooms ;
   H116  =     0.02191945865984 * S_households  +     2.12035979083279 *
        S_housing_median_age  +    -0.61998058779073 * S_latitude
          +    -1.02366235251722 * S_longitude  +     -0.6508141834652 *
        S_median_income  +     1.52434420817277 * S_population
          +    -1.28417448978605 * S_total_bedrooms  +    -0.22802333108039 *
        S_total_rooms ;
   H117  =    -3.09359733216344 * S_households  +    -2.12092270588813 *
        S_housing_median_age  +     1.57407062751844 * S_latitude
          +     0.91714266250668 * S_longitude  +    -2.33126572903488 *
        S_median_income  +     0.58937821109811 * S_population
          +     2.08060919464728 * S_total_bedrooms  +     3.20552100460378 *
        S_total_rooms ;
   H118  =    -1.24651477382991 * S_households  +    -0.10174294939394 *
        S_housing_median_age  +    -9.35408392378822 * S_latitude
          +     2.84153090487535 * S_longitude  +     -0.8057634240644 *
        S_median_income  +     1.08022068804016 * S_population
          +     -0.3009723615962 * S_total_bedrooms  +     0.44177955882008 *
        S_total_rooms ;
   H119  =     1.41829775658283 * S_households  +     0.26489573215225 *
        S_housing_median_age  +    -1.05908630149974 * S_latitude
          +    -0.96973110251732 * S_longitude  +     0.14068259802859 *
        S_median_income  +     3.64953416183398 * S_population
          +    -3.15984228434425 * S_total_bedrooms  +      -0.906531369581 *
        S_total_rooms ;
   H120  =     1.19889213045928 * S_households  +    -0.41033816274307 *
        S_housing_median_age  +     1.21873814017113 * S_latitude
          +     0.18252119055742 * S_longitude  +     -2.0704408565274 *
        S_median_income  +    -1.36998212840592 * S_population
          +     1.40007218467793 * S_total_bedrooms  +    -0.97723423768703 *
        S_total_rooms ;
   H121  =     0.88223695669138 * S_households  +     0.32858792065778 *
        S_housing_median_age  +    -0.06305452608602 * S_latitude
          +    -0.03254332224931 * S_longitude  +     1.43344073881076 *
        S_median_income  +    -1.93354787182881 * S_population
          +      0.6275476150925 * S_total_bedrooms  +     0.29615931826948 *
        S_total_rooms ;
   H122  =    -0.84263113654967 * S_households  +    -0.07411152930458 *
        S_housing_median_age  +     15.0381278577296 * S_latitude
          +      10.573386756024 * S_longitude  +    -0.21429995939326 *
        S_median_income  +    -1.68545276143568 * S_population
          +    -0.41537581009646 * S_total_bedrooms  +     2.74961115309228 *
        S_total_rooms ;
   H123  =     0.40243544198715 * S_households  +    -0.33300361114422 *
        S_housing_median_age  +     2.51345388306025 * S_latitude
          +     2.91413396847654 * S_longitude  +    -0.86009235592671 *
        S_median_income  +    -0.76784880522507 * S_population
          +     0.03744129605692 * S_total_bedrooms  +     0.04642432121311 *
        S_total_rooms ;
   H124  =     0.31824189113501 * S_households  +    -0.53005492139656 *
        S_housing_median_age  +     1.76448342508863 * S_latitude
          +     0.37103639783669 * S_longitude  +    -0.01649741131217 *
        S_median_income  +     0.23955190515659 * S_population
          +    -1.41327434269784 * S_total_bedrooms  +     0.50863289576001 *
        S_total_rooms ;
   H125  =     0.41240245943845 * S_households  +     0.42239228851077 *
        S_housing_median_age  +    -0.20150421625291 * S_latitude
          +    -1.15578367145619 * S_longitude  +    -0.74150193996034 *
        S_median_income  +     0.44738133741301 * S_population
          +     0.54283355601548 * S_total_bedrooms  +    -1.47923756947047 *
        S_total_rooms ;
   H126  =    -0.36637832561232 * S_households  +    -0.05986141930575 *
        S_housing_median_age  +     1.10188703102377 * S_latitude
          +    -2.09770553728518 * S_longitude  +     0.61234929511888 *
        S_median_income  +     11.0070759212581 * S_population
          +    -4.22918448890954 * S_total_bedrooms  +    -3.68813562382698 *
        S_total_rooms ;
   H127  =    -0.20551785951688 * S_households  +     2.35853704805727 *
        S_housing_median_age  +    -0.89934419742073 * S_latitude
          +     -1.8906815509378 * S_longitude  +     3.84523976132837 *
        S_median_income  +    -0.72128492860542 * S_population
          +    -0.94701336064292 * S_total_bedrooms  +     1.33883090242152 *
        S_total_rooms ;
   H128  =     0.39478265714496 * S_households  +    -0.71203241434975 *
        S_housing_median_age  +    -0.41517880702279 * S_latitude
          +     -0.7797954152653 * S_longitude  +    -0.11999123639502 *
        S_median_income  +     0.01859482582409 * S_population
          +     0.35467009960163 * S_total_bedrooms  +     0.71436205109444 *
        S_total_rooms ;
   H129  =     0.24144257114091 * S_households  +    -0.67078748546317 *
        S_housing_median_age  +     0.65110914170505 * S_latitude
          +    -0.95649138619594 * S_longitude  +    -1.78214624859423 *
        S_median_income  +      0.1393523872733 * S_population
          +     0.43138317553132 * S_total_bedrooms  +    -0.67680705383549 *
        S_total_rooms ;
   H130  =    -1.74525133994091 * S_households  +     0.27669158762119 *
        S_housing_median_age  +    -2.46205165041386 * S_latitude
          +    -1.98904745001523 * S_longitude  +    -0.27540060271973 *
        S_median_income  +     1.24943053614451 * S_population
          +    -0.34498694855769 * S_total_bedrooms  +     0.57656362553319 *
        S_total_rooms ;
   H131  =     2.19719480269103 * S_households  +     1.24267120495311 *
        S_housing_median_age  +    -3.62119755416336 * S_latitude
          +     -2.9487446483739 * S_longitude  +     1.24165354806345 *
        S_median_income  +    -4.63915373737717 * S_population
          +     3.26728732041567 * S_total_bedrooms  +    -3.10241196530963 *
        S_total_rooms ;
   H132  =     0.80339601530194 * S_households  +     0.13774612392139 *
        S_housing_median_age  +      -1.530379435635 * S_latitude
          +    -1.07256724396293 * S_longitude  +     0.27181790319938 *
        S_median_income  +     0.88240494562507 * S_population
          +    -2.11371061394693 * S_total_bedrooms  +    -1.96366590396815 *
        S_total_rooms ;
   H133  =    -0.35005021184067 * S_households  +     0.21830231690316 *
        S_housing_median_age  +     7.45552810595841 * S_latitude
          +    -2.77027917085394 * S_longitude  +     0.59026487257219 *
        S_median_income  +     1.01320191302354 * S_population
          +    -0.80562118611396 * S_total_bedrooms  +     0.87218385063605 *
        S_total_rooms ;
   H134  =    -0.13533609517631 * S_households  +    -0.95235275812001 *
        S_housing_median_age  +     5.47104520806071 * S_latitude
          +     3.80733822343181 * S_longitude  +       1.207770611277 *
        S_median_income  +     3.43396513546357 * S_population
          +     -1.8633888525205 * S_total_bedrooms  +    -1.54490374760409 *
        S_total_rooms ;
   H135  =    -3.46412049324945 * S_households  +    -0.18109215898473 *
        S_housing_median_age  +     -0.3954957419321 * S_latitude
          +    -1.15475019292038 * S_longitude  +     0.88937985657276 *
        S_median_income  +     4.02938362346921 * S_population
          +    -1.11365654384248 * S_total_bedrooms  +     2.53934195746351 *
        S_total_rooms ;
   H136  =     -1.9228448211764 * S_households  +      1.2369727555102 *
        S_housing_median_age  +     0.74615475554867 * S_latitude
          +     0.36825303169531 * S_longitude  +     0.32197719404104 *
        S_median_income  +     5.40800586929089 * S_population
          +    -4.20267074912544 * S_total_bedrooms  +     1.79387957212277 *
        S_total_rooms ;
   H137  =     0.01480809928517 * S_households  +    -0.04067242711641 *
        S_housing_median_age  +     0.28042116336331 * S_latitude
          +     0.26835764371372 * S_longitude  +      0.9740575316394 *
        S_median_income  +    -0.14417055092797 * S_population
          +    -0.30065159539455 * S_total_bedrooms  +     0.45243378727097 *
        S_total_rooms ;
   H138  =     0.19753107755888 * S_households  +    -0.27132782574139 *
        S_housing_median_age  +     0.19656981441766 * S_latitude
          +    -0.45249093142906 * S_longitude  +     0.44122720530747 *
        S_median_income  +     0.18839442891842 * S_population
          +     -0.6110181506391 * S_total_bedrooms  +    -0.71029408042588 *
        S_total_rooms ;
   H139  =     2.41036376890544 * S_households  +     1.93086753919175 *
        S_housing_median_age  +     0.14138009502162 * S_latitude
          +     1.15690386163193 * S_longitude  +    -0.47567437815329 *
        S_median_income  +     -0.4069815236668 * S_population
          +     2.41790994137715 * S_total_bedrooms  +    -2.79217282146707 *
        S_total_rooms ;
   H140  =     0.95925465935611 * S_households  +    -1.51481866138613 *
        S_housing_median_age  +    -0.94822817474562 * S_latitude
          +     4.12402921625607 * S_longitude  +     0.10870953986063 *
        S_median_income  +     1.53069220064272 * S_population
          +    -2.60635229715974 * S_total_bedrooms  +    -1.73494248489245 *
        S_total_rooms ;
   H101  =     -1.0079533564567 + H101 ;
   H102  =     3.72398311283875 + H102 ;
   H103  =     5.33769138076456 + H103 ;
   H104  =    -0.15786069723049 + H104 ;
   H105  =    -4.53304330990287 + H105 ;
   H106  =    -1.77311392872505 + H106 ;
   H107  =    -5.02846807949517 + H107 ;
   H108  =    -0.55135395108657 + H108 ;
   H109  =    -6.58447426801818 + H109 ;
   H110  =    -1.61045402368369 + H110 ;
   H111  =    -5.95683152662433 + H111 ;
   H112  =      0.3501251993918 + H112 ;
   H113  =     2.70533151191467 + H113 ;
   H114  =    -0.08907988363077 + H114 ;
   H115  =    -1.83801830842827 + H115 ;
   H116  =    -1.29871072154997 + H116 ;
   H117  =     5.00991328344916 + H117 ;
   H118  =    -3.74678670479642 + H118 ;
   H119  =     2.78389508247096 + H119 ;
   H120  =     4.09661165071423 + H120 ;
   H121  =    -1.41679316236223 + H121 ;
   H122  =    -0.35607065108547 + H122 ;
   H123  =     1.82670623828027 + H123 ;
   H124  =     2.22565951538155 + H124 ;
   H125  =     1.13248359987592 + H125 ;
   H126  =     5.41011008865969 + H126 ;
   H127  =     1.31549521438428 + H127 ;
   H128  =     3.17712418260785 + H128 ;
   H129  =     1.02389915747783 + H129 ;
   H130  =    -1.31717522314213 + H130 ;
   H131  =    -3.74180534737396 + H131 ;
   H132  =    -3.49479353182649 + H132 ;
   H133  =      3.8471020258445 + H133 ;
   H134  =     5.49552840069911 + H134 ;
   H135  =     1.95881956480089 + H135 ;
   H136  =     0.82741215337937 + H136 ;
   H137  =    -0.90025195623902 + H137 ;
   H138  =     1.46264341822384 + H138 ;
   H139  =     3.15333251143054 + H139 ;
   H140  =    -3.13142353992353 + H140 ;
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
   P_Median_House_value  =     21174.3146312208 * H101
          +     13129.6786910458 * H102  +    -27316.6151815038 * H103
          +    -9331.75265785948 * H104  +     22696.4432517615 * H105
          +    -18150.6167966841 * H106  +     -12929.160133066 * H107
          +      21970.379618414 * H108  +    -30629.7037554603 * H109
          +    -2999.78374623463 * H110  +     28965.6987981398 * H111
          +     8518.51587113021 * H112  +     13384.1492457937 * H113
          +    -9882.91549540608 * H114  +    -21257.3730594721 * H115
          +     -5262.2590879366 * H116  +     14566.7688804975 * H117
          +     10218.9997672207 * H118  +       9205.830598184 * H119
          +    -3920.77806809847 * H120  +     36300.8843004716 * H121
          +    -21187.6148924114 * H122  +    -25964.5406079615 * H123
          +     3151.37490672147 * H124  +    -1259.83438405362 * H125
          +    -16495.7564049373 * H126  +     3475.19721994634 * H127
          +     8228.91021560064 * H128  +    -821.927071910899 * H129
          +    -17572.8296722377 * H130  +     30552.6293595321 * H131
          +    -9051.72488313535 * H132  +    -8786.40223253479 * H133
          +     15235.6122636423 * H134  +    -13910.4123077443 * H135
          +    -25280.1278891531 * H136  +     516.666261466814 * H137
          +     1064.78083466188 * H138  +    -8185.91437885201 * H139
          +    -6938.96214231754 * H140 ;
   P_Median_House_value  =     207030.545101502 + P_Median_House_value ;
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
