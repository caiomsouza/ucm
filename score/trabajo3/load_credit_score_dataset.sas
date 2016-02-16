PROC IMPORT OUT= riesgo.cs_all 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\datospracticas_alumnos_OK_excel95.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= riesgo.cs_all_without_new_clients 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\datospracticas_alumnos_OK_excel95_accepts_rejects_without_new_clients.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= riesgo.cs_rejects 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\datospracticas_alumnos_OK_excel95_rejects.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;


PROC IMPORT OUT= riesgo.cs_accepts 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\datospracticas_alumnos_OK_excel95_accepts.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= riesgo.cs_new_clients 
            DATAFILE= "C:\Users\win\Documents\GitHub\ucm\score\trabajo3\datospracticas_alumnos_OK_excel95_new_clients.xls" 
            DBMS=EXCEL5 REPLACE;
     GETNAMES=YES;
RUN;
