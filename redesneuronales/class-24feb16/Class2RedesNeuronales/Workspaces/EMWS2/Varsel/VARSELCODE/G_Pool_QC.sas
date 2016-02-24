*;
/*----G_Pool_QC begin----*/
length _NORM2 $ 2;
_NORM2 = put( Pool_QC , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
when("EX" ) G_Pool_QC = 2;
when("FA" ) G_Pool_QC = 1;
when("GD" ) G_Pool_QC = 1;
when("NA" ) G_Pool_QC = 0;
when("TA" ) G_Pool_QC = 0;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Pool_QC="Grouped Levels for Pool_QC";
/*----G_Pool_QC end----*/
