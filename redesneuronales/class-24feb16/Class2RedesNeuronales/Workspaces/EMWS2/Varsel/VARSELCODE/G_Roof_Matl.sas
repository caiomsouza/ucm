*;
/*----G_Roof_Matl begin----*/
length _NORM7 $ 7;
_NORM7 = put( Roof_Matl , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
when("CLYTILE" ) G_Roof_Matl = 0;
when("COMPSHG" ) G_Roof_Matl = 0;
when("MEMBRAN" ) G_Roof_Matl = 1;
when("METAL  " ) G_Roof_Matl = 0;
when("ROLL   " ) G_Roof_Matl = 0;
when("TAR&GRV" ) G_Roof_Matl = 0;
when("WDSHAKE" ) G_Roof_Matl = 1;
when("WDSHNGL" ) G_Roof_Matl = 2;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Roof_Matl="Grouped Levels for Roof_Matl";
/*----G_Roof_Matl end----*/
