*------------------------------------------------------------*;
* Configuración fuente de datos;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\Trabajo3_Credit_Score_SAS_EM\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: creando datos DATA;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set RIESGOS.CS_ACCEPTS;
run;
