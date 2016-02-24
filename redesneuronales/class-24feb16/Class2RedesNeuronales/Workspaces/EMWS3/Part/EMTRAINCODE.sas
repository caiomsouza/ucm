*------------------------------------------------------------*;
* Part: Create random partition;
*------------------------------------------------------------*;
data
EMWS3.Part_TRAIN(label="")
EMWS3.Part_TEST(label="")
;
retain _seed_ 31523;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS3.Ids_DATA;
if (654 +1-_n_)*_genvalue_ <= (458 - _C000001) then do;
_C000001 + 1;
output EMWS3.Part_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS3.Part_TEST;
end;
run;
run;
