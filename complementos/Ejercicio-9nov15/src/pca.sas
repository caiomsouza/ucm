proc princomp DATA= pca.barriosmadrid plots=All OUTSTAT=ESTEJ1 out=PROEJ1;
VAR P_TOT P_14 P_65 P_10 ANAL NES OCU OCUIN OCUSER TEC PD TM;
ID BARRIO;
run;



proc princomp DATA= pca.barriosmadrid n=3 plots=(Matrix PatternProfile
Score(ellipse)) OUTSTAT=ESTEJ1 out=PROEJ1;
VAR P_TOT--TM;
ID BARRIO;
run;

