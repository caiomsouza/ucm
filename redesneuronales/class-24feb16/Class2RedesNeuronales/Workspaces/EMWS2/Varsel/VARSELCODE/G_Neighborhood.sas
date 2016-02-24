/*----G_Neighborhood begin----*/
length _NORM7 $ 7;
_NORM7 = put( Neighborhood , $7. );
%DMNORMIP( _NORM7 )
drop _NORM7;
select(_NORM7);
when("BLMNGTN" ) G_Neighborhood = 8;
when("BLUESTE" ) G_Neighborhood = 4;
when("BRDALE " ) G_Neighborhood = 0;
when("BRKSIDE" ) G_Neighborhood = 1;
when("CLEARCR" ) G_Neighborhood = 9;
when("COLLGCR" ) G_Neighborhood = 8;
when("CRAWFOR" ) G_Neighborhood = 9;
when("EDWARDS" ) G_Neighborhood = 2;
when("GILBERT" ) G_Neighborhood = 7;
when("GREENS " ) G_Neighborhood = 8;
when("GRNHILL" ) G_Neighborhood = 11;
when("IDOTRR " ) G_Neighborhood = 0;
when("LANDMRK" ) G_Neighborhood = 3;
when("MEADOWV" ) G_Neighborhood = 0;
when("MITCHEL" ) G_Neighborhood = 5;
when("NAMES  " ) G_Neighborhood = 4;
when("NPKVILL" ) G_Neighborhood = 3;
when("NWAMES " ) G_Neighborhood = 7;
when("NORIDGE" ) G_Neighborhood = 13;
when("NRIDGHT" ) G_Neighborhood = 12;
when("OLDTOWN" ) G_Neighborhood = 1;
when("SWISU  " ) G_Neighborhood = 3;
when("SAWYER " ) G_Neighborhood = 3;
when("SAWYERW" ) G_Neighborhood = 6;
when("SOMERST" ) G_Neighborhood = 10;
when("STONEBR" ) G_Neighborhood = 12;
when("TIMBER " ) G_Neighborhood = 11;
when("VEENKER" ) G_Neighborhood = 11;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Neighborhood="Grouped Levels for Neighborhood";
/*----G_Neighborhood end----*/
