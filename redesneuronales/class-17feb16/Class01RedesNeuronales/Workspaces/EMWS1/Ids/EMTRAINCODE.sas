*------------------------------------------------------------*;
* Configuración fuente de datos;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\win\Documents\GitHub\ucm\redesneuronales\class-17feb16\Class01RedesNeuronales\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: creando datos DATA;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set UCM.FITNESS;
run;
