libname disco 'C:\Users\win\Desktop\UCM\SEMMA\Class-11nov15';

proc print data=disco.patatas;
run;

symbol i=rl v=circle;
proc gplot data=disco.patatas;
plot y*cov=trt;
run;

data disco.patatas2;
set disco.patatas;
if trt in (1,2,3) thrn trt2=1;
if trt in (4,5) then trt2=2;
if trt in (6) then trt2=1;
run;



