*;
/*----G_Exterior_1st begin----*/
length _NORM7 $ 7;
_NORM7 = put( Exterior_1st , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
when("ASBSHNG" ) G_Exterior_1st = 0;
when("ASPHSHN" ) G_Exterior_1st = 0;
when("BRKCOMM" ) G_Exterior_1st = 1;
when("BRKFACE" ) G_Exterior_1st = 5;
when("CBLOCK " ) G_Exterior_1st = 0;
when("CEMNTBD" ) G_Exterior_1st = 7;
when("HDBOARD" ) G_Exterior_1st = 3;
when("IMSTUCC" ) G_Exterior_1st = 8;
when("METALSD" ) G_Exterior_1st = 2;
when("PLYWOOD" ) G_Exterior_1st = 4;
when("PRECAST" ) G_Exterior_1st = 8;
when("STONE  " ) G_Exterior_1st = 8;
when("STUCCO " ) G_Exterior_1st = 1;
when("VINYLSD" ) G_Exterior_1st = 6;
when("WD SDNG" ) G_Exterior_1st = 1;
when("WDSHING" ) G_Exterior_1st = 2;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Exterior_1st="Grouped Levels for Exterior_1st";
/*----G_Exterior_1st end----*/
