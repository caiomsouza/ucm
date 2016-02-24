*;
/*----G_Bsmt_Exposure begin----*/
length _NORM2 $ 2;
_NORM2 = put( Bsmt_Exposure , $2. );
%DMNORMIP( _NORM2 )
drop _NORM2;
select(_NORM2);
when("  " ) G_Bsmt_Exposure = 2;
when("AV" ) G_Bsmt_Exposure = 3;
when("GD" ) G_Bsmt_Exposure = 4;
when("MN" ) G_Bsmt_Exposure = 2;
when("NA" ) G_Bsmt_Exposure = 0;
when("NO" ) G_Bsmt_Exposure = 1;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Bsmt_Exposure="Grouped Levels for Bsmt_Exposure";
/*----G_Bsmt_Exposure end----*/
