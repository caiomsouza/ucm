PROC IMPORT OUT= VIAJEROS.ZARAGOZA 
            DATAFILE= "C:\Users\win\Desktop\UCM\COMPLEMENTOS\Ejercicio-9
nov15\dat\ViajerosZaragozaArrumado.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;
