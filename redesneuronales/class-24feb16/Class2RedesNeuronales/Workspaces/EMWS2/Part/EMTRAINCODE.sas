*------------------------------------------------------------*;
* Part: Create random partition;
*------------------------------------------------------------*;
data
EMWS2.Part_TRAIN(label="")
EMWS2.Part_TEST(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS2.Varsel_TRAIN;
if (2930 +1-_n_)*_genvalue_ <= (2051 - _C000001) then do;
_C000001 + 1;
output EMWS2.Part_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS2.Part_TEST;
end;
run;
run;
