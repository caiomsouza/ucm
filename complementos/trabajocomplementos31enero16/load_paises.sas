PROC IMPORT OUT= ucm.paises 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\complementos\trabajocomplementos31enero16\DatosPaises-SAS.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;
