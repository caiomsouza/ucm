*------------------------------------------------------------*;
* Configuración fuente de datos;
*------------------------------------------------------------*;
libname EMWS3 "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-24feb16\Class2RedesNeuronales\Workspaces\EMWS3";
*------------------------------------------------------------*;
* Ids2: creando datos DATA;
*------------------------------------------------------------*;
data EMWS3.Ids2_DATA (label="")
/ view=EMWS3.Ids2_DATA
;
set REDES.FEV;
run;
