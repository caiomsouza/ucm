*;
/*----G_Condition_1 begin----*/
length _NORM6 $ 6;
_NORM6 = put( Condition_1 , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
when("ARTERY" ) G_Condition_1 = 0;
when("FEEDR " ) G_Condition_1 = 1;
when("NORM  " ) G_Condition_1 = 2;
when("POSA  " ) G_Condition_1 = 4;
when("POSN  " ) G_Condition_1 = 4;
when("RRAE  " ) G_Condition_1 = 1;
when("RRAN  " ) G_Condition_1 = 2;
when("RRNE  " ) G_Condition_1 = 1;
when("RRNN  " ) G_Condition_1 = 3;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Condition_1="Grouped Levels for Condition_1";
/*----G_Condition_1 end----*/
