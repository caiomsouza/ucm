PROC IMPORT OUT= UCM.Nacidos 
            DATAFILE= "C:\Users\win\Desktop\trabajo\DatosCaio-sumados.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;
