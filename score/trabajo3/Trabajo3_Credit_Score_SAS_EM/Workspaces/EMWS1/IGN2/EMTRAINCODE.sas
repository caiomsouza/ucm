%macro main;

  filename temp catalog 'sashelp.emcredit.ign_macros.source';
  %include temp;
  filename temp;

  %setProperties;

  %if %upcase(&EM_ACTION) = CREATE %then %do;
    filename temp catalog 'sashelp.emcredit.ign_create.source';
    %include temp;
    filename temp;

    %create;
  %end;

   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;

       filename temp catalog 'sashelp.emcredit.ign_train.source';
       %include temp;
       filename temp;
       %train;
   %end;

  %else
  %if %upcase(&EM_ACTION) = SCORE %then %do;
    filename temp catalog 'sashelp.emcredit.ign_score.source';
    %include temp;
    filename temp;

    %score;

  %end;

  %else
  %if %upcase(&EM_ACTION) = REPORT %then %do;

       filename temp catalog 'sashelp.emcredit.ign_report.source';
       %include temp;
       filename temp;

       %report;
   %end;

   %else
   %if %upcase(&EM_ACTION) = OPENOPTPARAMETERSTABLE %then %do;

       filename temp catalog 'sashelp.emcredit.ign_actions.source';
       %include temp;
       filename temp;

       %openOptParametersTable;
   %end;
   %else
   %if %upcase(&EM_ACTION) = CLOSEOPTPARAMETERSTABLE %then %do;

       filename temp catalog 'sashelp.emcredit.ign_actions.source';
       %include temp;
       filename temp;

       %closeOptParametersTable;
   %end;


   %doendm:
%mend main;

%main;

