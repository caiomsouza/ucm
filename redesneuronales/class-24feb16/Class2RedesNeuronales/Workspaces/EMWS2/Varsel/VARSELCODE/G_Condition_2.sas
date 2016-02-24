*;
/*----G_Condition_2 begin----*/
length _NORM6 $ 6;
_NORM6 = put( Condition_2 , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
when("ARTERY" ) G_Condition_2 = 0;
when("FEEDR " ) G_Condition_2 = 0;
when("NORM  " ) G_Condition_2 = 1;
when("POSA  " ) G_Condition_2 = 3;
when("POSN  " ) G_Condition_2 = 2;
when("RRAE  " ) G_Condition_2 = 1;
when("RRAN  " ) G_Condition_2 = 0;
when("RRNN  " ) G_Condition_2 = 0;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Condition_2="Grouped Levels for Condition_2";
/*----G_Condition_2 end----*/
