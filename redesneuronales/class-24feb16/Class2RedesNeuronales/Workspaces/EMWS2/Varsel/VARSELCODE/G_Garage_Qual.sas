*;
/*----G_Garage_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Garage_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
when("  " ) G_Garage_Qual = 1;
when("EX" ) G_Garage_Qual = 3;
when("FA" ) G_Garage_Qual = 1;
when("GD" ) G_Garage_Qual = 3;
when("NA" ) G_Garage_Qual = 0;
when("PO" ) G_Garage_Qual = 0;
when("TA" ) G_Garage_Qual = 2;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Garage_Qual="Grouped Levels for Garage_Qual";
/*----G_Garage_Qual end----*/
