DATA EJ2;
INPUT EDAD_SEXO $ COCHE_PREF $ FRECUENCIA;
DATALINES; 
JOV_FEM OPEL 25
JOV_FEM PEUGEOT 18
JOV_FEM HYUNDAI 36
JOV_FEM RENAULT 8
JOV_MAS OPEL 10
JOV_MAS PEUGEOT 26
JOV_MAS HYUNDAI 25
JOV_MAS RENAULT 30
MAD_FEM OPEL 5
MAD_FEM PEUGEOT 8
MAD_FEM HYUNDAI 2
MAD_FEM RENAULT 4
MAD_MAS OPEL 35 
MAD_MAS PEUGEOT 20
MAD_MAS HYUNDAI 7
MAD_MAS RENAULT 60
MAY_FEM OPEL 6
MAY_FEM PEUGEOT 6
MAY_FEM HYUNDAI 1
MAY_FEM RENAULT 6
MAY_MAS OPEL 10
MAY_MAS PEUGEOT 16
MAY_MAS HYUNDAI 3
MAY_MAS RENAULT 25
;

ods graphics on;
proc corresp data=EJ2 all chi2p print=both; 
tables EDAD_SEXO, COCHE_PREF; 
WEIGHT FRECUENCIA;
run;
