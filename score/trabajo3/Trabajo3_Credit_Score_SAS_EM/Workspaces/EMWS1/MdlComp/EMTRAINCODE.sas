data EMWS1.MdlComp_EMRANK;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard3" MODEL "Scorecard3" MODELDESCRIPTION "Scorecard - Backward" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard3_EMRANK;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMSCOREDIST;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard3" MODEL "Scorecard3" MODELDESCRIPTION "Scorecard - Backward" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard3_EMSCOREDIST;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMOUTFIT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard3" MODEL "Scorecard3" MODELDESCRIPTION "Scorecard - Backward" TARGETLABEL "DEFAULT";
set WORK.Scorecard3_OUTFIT;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMCLASSIFICATION;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard3" MODEL "Scorecard3" MODELDESCRIPTION "Scorecard - Backward" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard3_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMEVENTREPORT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard3" MODEL "Scorecard3" MODELDESCRIPTION "Scorecard - Backward" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard3_EMEVENTREPORT;
where upcase(TARGET) = upcase("DEFAULT");
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard" MODEL "Scorecard" MODELDESCRIPTION "Scorecard" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard_EMRANK;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMRANK;
set EMWS1.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard" MODEL "Scorecard" MODELDESCRIPTION "Scorecard" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard_EMSCOREDIST;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMSCOREDIST;
set EMWS1.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard" MODEL "Scorecard" MODELDESCRIPTION "Scorecard" TARGETLABEL "DEFAULT";
set WORK.Scorecard_OUTFIT;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMOUTFIT;
set EMWS1.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard" MODEL "Scorecard" MODELDESCRIPTION "Scorecard" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMCLASSIFICATION;
set EMWS1.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Scorecard" MODEL "Scorecard" MODELDESCRIPTION "Scorecard" TARGETLABEL "DEFAULT";
set EMWS1.Scorecard_EMEVENTREPORT;
where upcase(TARGET) = upcase("DEFAULT");
run;
data EMWS1.MdlComp_EMEVENTREPORT;
set EMWS1.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
