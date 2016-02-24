*;
/*----G_Kitchen_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Kitchen_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
when("EX" ) G_Kitchen_Qual = 3;
when("FA" ) G_Kitchen_Qual = 0;
when("GD" ) G_Kitchen_Qual = 2;
when("PO" ) G_Kitchen_Qual = 0;
when("TA" ) G_Kitchen_Qual = 1;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Kitchen_Qual="Grouped Levels for Kitchen_Qual";
/*----G_Kitchen_Qual end----*/
