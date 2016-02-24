*;
/*----G_Bsmt_Qual begin----*/
length _NORM2 $ 2;
_NORM2 = put( Bsmt_Qual , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
when("  " ) G_Bsmt_Qual = 0;
when("EX" ) G_Bsmt_Qual = 3;
when("FA" ) G_Bsmt_Qual = 0;
when("GD" ) G_Bsmt_Qual = 2;
when("NA" ) G_Bsmt_Qual = 0;
when("PO" ) G_Bsmt_Qual = 0;
when("TA" ) G_Bsmt_Qual = 1;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Bsmt_Qual="Grouped Levels for Bsmt_Qual";
/*----G_Bsmt_Qual end----*/
