PROC IMPORT OUT= DISCO.barrios 
            DATAFILE= "C:\Users\TEMP.AULA.027\Desktop\UCM\Ejercicio16nov
15\barrios_excel95.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;
