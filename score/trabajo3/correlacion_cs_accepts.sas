data cs_accepts;
set riesgo.Cs_accepts;
run;

proc corr data=cs_accepts outp=cs_accepts_corr;
run;
