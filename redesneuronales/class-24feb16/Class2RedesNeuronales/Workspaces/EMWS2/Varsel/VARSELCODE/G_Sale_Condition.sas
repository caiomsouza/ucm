*;
/*----G_Sale_Condition begin----*/
length _NORM7 $ 7;
_NORM7 = put( Sale_Condition , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
when("ABNORML" ) G_Sale_Condition = 1;
when("ADJLAND" ) G_Sale_Condition = 0;
when("ALLOCA " ) G_Sale_Condition = 2;
when("FAMILY " ) G_Sale_Condition = 2;
when("NORMAL " ) G_Sale_Condition = 3;
when("PARTIAL" ) G_Sale_Condition = 4;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Sale_Condition="Grouped Levels for Sale_Condition";
/*----G_Sale_Condition end----*/
