/*****************************************************************************
/* MACRO CONTARVALORES

La macro contarvalores cuenta valores distintos de cada variable de la lista.

Esta macro permitirá observar si hay alguna variable inicialmente declarada como continua
que puede ser utilizada como nominal 

archivo=,
listavar=lista de variables, pueden ser de tipo numérica o alfanumérica
*******
SALIDA
*******
Archivo uni , contiene el número de valores distintos de cada variable de la lista.
También saca en el LOG la lista de variables ordenada de más valores a menos (por
si se quiere hacer un gráfico de nube de puntos)
****************************************************************************/

%macro contarvalores(archivo=,listavar=);
data _null_;
length clase $ 6000;
clase="&listavar";
  nconti= 1;
  do while (scanq(clase, nconti) ^= '');
    nconti+1;
  end;
  nconti+(-1);
  call symput('nconti',left(nconti));
run;
data uni;run;
%do i=1 %to &nconti;
	%let vari=%qscan(&listavar,&i);

proc freq data=&archivo noprint;tables &vari / out=sal1;run;
data sal1 (keep=variable valoresdistintos);length variable $ 200 ;set sal1 nobs=nume;variable="&vari";valoresdistintos=nume;output;
if _n_=1 then stop;run;
data uni;set uni sal1;run;
%end;
data uni;set uni;if _n_=1 then delete;
proc sort data=uni;by descending valoresdistintos;run;
data _null;set uni; put variable @@;run;
proc print data=uni;run;
%mend;

/* EJEMPLO

%contarvalores(archivo=ames,
listavar=Bedroom_AbvGr BsmtFin_SF_1 BsmtFin_SF_2 Bsmt_Full_Bath Bsmt_Half_Bath Bsmt_Unf_SF Enclosed_Porch Fireplaces Full_Bath Garage_Area Garage_Cars Garage_Yr_Blt
Gr_Liv_Area Half_Bath Kitchen_AbvGr Lot_Area Lot_Frontage Low_Qual_Fin_SF Mas_Vnr_Area Misc_Val Mo_Sold Open_Porch_SF Order Overall_Cond Overall_Qual Pool_Area
SalePrice Screen_Porch TotRms_AbvGrd Total_Bsmt_SF Wood_Deck_SF Year_Built Year_Remod_Add Yr_Sold _Ssn_Porch _nd_Flr_SF _st_Flr_SF
Alley Bldg_Type BsmtFin_Type_1 BsmtFin_Type_2 Bsmt_Cond Bsmt_Exposure Bsmt_Qual Central_Air Condition_1 Condition_2 Electrical Exter_Cond Exter_Qual
Exterior_1st Exterior_2nd Fence Fireplace_Qu Foundation Functional Garage_Cond Garage_Finish Garage_Qual Garage_Type Heating Heating_QC House_Style Kitchen_Qual
Land_Contour Land_Slope Lot_Config Lot_Shape MS_SubClass MS_Zoning Mas_Vnr_Type Misc_Feature Neighborhood PID Paved_Drive Pool_QC Roof_Matl Roof_Style
Sale_Condition Sale_Type Street Utilities
);

proc sgscatter data=ames;
  title "Scatterplot Ameshousing";
  plot saleprice*(Bsmt_Half_Bath Kitchen_AbvGr Exter_Qual
Land_Contour Lot_Shape Half_Bath Alley Land_Slope Paved_Drive Utilities Central_Air Street Heating_QC Kitchen_Qual Lot_Config Pool_QC 
);
run;

