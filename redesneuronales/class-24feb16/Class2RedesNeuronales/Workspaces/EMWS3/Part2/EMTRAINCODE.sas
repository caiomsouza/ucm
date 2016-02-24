*------------------------------------------------------------*;
* Part2: Create random partition;
*------------------------------------------------------------*;
data
EMWS3.Part2_TRAIN(label="")
EMWS3.Part2_VALIDATE(label="")
EMWS3.Part2_TEST(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS3.Ids2_DATA;
if (654+1-_n_)*_genvalue_ <= (262 - _C000001) then do;
_C000001 + 1;
output EMWS3.Part2_TRAIN;
end;
else if (654+1-_n_)*_genvalue_ <= (262 - _C000001 + 196 - _C000002) then do;
_C000002 + 1;
output EMWS3.Part2_VALIDATE;
end;
else do;
_C000003 + 1;
output EMWS3.Part2_TEST;
end;
run;
run;
