drop _temp_;
if (P_AERO ge 52.4140759649153) then do;
b_AERO = 1;
end;
else
if (P_AERO ge 45.908251341265) then do;
_temp_ = dmran(1234);
b_AERO = floor(2 + 2*_temp_);
end;
else
if (P_AERO ge 41.6913039344432) then do;
b_AERO = 4;
end;
else
if (P_AERO ge 38.9256563939795) then do;
b_AERO = 5;
end;
else
if (P_AERO ge 37.2254859026011) then do;
b_AERO = 6;
end;
else
if (P_AERO ge 36.9103233891481) then do;
b_AERO = 7;
end;
else
if (P_AERO ge 35.637834423362) then do;
b_AERO = 8;
end;
else
if (P_AERO ge 33.0291083969521) then do;
b_AERO = 9;
end;
else
if (P_AERO ge 32.3595546170941) then do;
b_AERO = 10;
end;
else
if (P_AERO ge 30.6813522458837) then do;
b_AERO = 11;
end;
else
if (P_AERO ge 30.1241629945341) then do;
b_AERO = 12;
end;
else
if (P_AERO ge 29.000364501687) then do;
b_AERO = 13;
end;
else
if (P_AERO ge 25.6200822079133) then do;
b_AERO = 14;
end;
else
if (P_AERO ge 23.7017192560832) then do;
b_AERO = 15;
end;
else
if (P_AERO ge 22.6947705982137) then do;
b_AERO = 16;
end;
else
if (P_AERO ge 21.9011398519061) then do;
b_AERO = 17;
end;
else
if (P_AERO ge 20.4038178402757) then do;
b_AERO = 18;
end;
else
if (P_AERO ge 16.870310750866) then do;
b_AERO = 19;
end;
else
do;
b_AERO = 20;
end;
