*------------------------------------------------------------*;
* Configuración fuente de datos;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: creando datos DATA;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set REDES.CALIFORNIAHOUSING;
run;
