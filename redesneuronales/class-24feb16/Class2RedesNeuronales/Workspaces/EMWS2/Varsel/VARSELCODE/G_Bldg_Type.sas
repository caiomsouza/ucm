*;
/*----G_Bldg_Type begin----*/
length _NORM6 $ 6;
_NORM6 = put( Bldg_Type , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
when("1FAM  " ) G_Bldg_Type = 2;
when("2FMCON" ) G_Bldg_Type = 0;
when("DUPLEX" ) G_Bldg_Type = 1;
when("TWNHS " ) G_Bldg_Type = 1;
when("TWNHSE" ) G_Bldg_Type = 3;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Bldg_Type="Grouped Levels for Bldg_Type";
/*----G_Bldg_Type end----*/
