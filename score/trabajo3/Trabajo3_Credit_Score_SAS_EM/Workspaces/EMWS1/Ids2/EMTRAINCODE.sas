*------------------------------------------------------------*;
* Configuración fuente de datos;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\Trabajo3_Credit_Score_SAS_EM\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: creando datos DATA;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
;
set RIESGOS.CS_NEW_CLIENTS;
drop DEFAULT;
run;
