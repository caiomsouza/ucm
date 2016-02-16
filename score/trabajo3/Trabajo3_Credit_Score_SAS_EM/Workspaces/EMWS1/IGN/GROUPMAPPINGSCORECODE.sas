 length _LABEL_ $200;
 label _LABEL_='Valores de grupo';
 
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 1 then do;
_LABEL_='ACTIVE< 2';
UB=2;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 2 then do;
_LABEL_='2<= ACTIVE< 7';
UB=7;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 3 then do;
_LABEL_='7<= ACTIVE< 11';
UB=11;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 4 then do;
_LABEL_='11<= ACTIVE< 12';
UB=12;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 5 then do;
_LABEL_='12<= ACTIVE';
UB=.;
end;
 
if DISPLAY_VAR='AGE' and _GROUP_ = 1 then do;
_LABEL_='AGE< 27.75';
UB=27.75;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 2 then do;
_LABEL_='27.75<= AGE< 29.83';
UB=29.83;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 3 then do;
_LABEL_='29.83<= AGE< 32.33';
UB=32.33;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 4 then do;
_LABEL_='32.33<= AGE< 44.92';
UB=44.92;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 5 then do;
_LABEL_='44.92<= AGE';
UB=.;
end;
 
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 1 then do;
_LABEL_='AVGEXP< 87.15';
UB=87.15;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 2 then do;
_LABEL_='87.15<= AVGEXP< 132.85';
UB=132.85;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 3 then do;
_LABEL_='132.85<= AVGEXP< 175.44';
UB=175.44;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 4 then do;
_LABEL_='175.44<= AVGEXP< 420.58';
UB=420.58;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 5 then do;
_LABEL_='420.58<= AVGEXP';
UB=.;
end;
 
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 1 then do;
_LABEL_='CUR_ADD< 6';
UB=6;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 2 then do;
_LABEL_='6<= CUR_ADD< 12';
UB=12;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 3 then do;
_LABEL_='12<= CUR_ADD< 24';
UB=24;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 4 then do;
_LABEL_='24<= CUR_ADD< 94';
UB=94;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 5 then do;
_LABEL_='94<= CUR_ADD';
UB=.;
end;
 
if DISPLAY_VAR='DEPNDT' and _GROUP_ = 1 then do;
_LABEL_='DEPNDT< 1';
UB=1;
end;
else
if DISPLAY_VAR='DEPNDT' and _GROUP_ = 2 then do;
_LABEL_='1<= DEPNDT< 2';
UB=2;
end;
else
if DISPLAY_VAR='DEPNDT' and _GROUP_ = 3 then do;
_LABEL_='2<= DEPNDT< 3';
UB=3;
end;
else
if DISPLAY_VAR='DEPNDT' and _GROUP_ = 4 then do;
_LABEL_='3<= DEPNDT< 4';
UB=4;
end;
else
if DISPLAY_VAR='DEPNDT' and _GROUP_ = 5 then do;
_LABEL_='4<= DEPNDT';
UB=.;
end;
 
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 1 then do;
_LABEL_='EXP_INC< 0.04';
UB=0.04;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 2 then do;
_LABEL_='0.04<= EXP_INC< 0.05';
UB=0.05;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 3 then do;
_LABEL_='0.05<= EXP_INC< 0.06';
UB=0.06;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 4 then do;
_LABEL_='0.06<= EXP_INC< 0.07';
UB=0.07;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 5 then do;
_LABEL_='0.07<= EXP_INC';
UB=.;
end;
 
if DISPLAY_VAR='INCOME' and _GROUP_ = 1 then do;
_LABEL_='INCOME< 1.68';
UB=1.68;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 2 then do;
_LABEL_='1.68<= INCOME< 2.1';
UB=2.1;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 3 then do;
_LABEL_='2.1<= INCOME< 3.11';
UB=3.11;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 4 then do;
_LABEL_='3.11<= INCOME< 5.92';
UB=5.92;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 5 then do;
_LABEL_='5.92<= INCOME';
UB=.;
end;
 
if DISPLAY_VAR='INC_PER' and _GROUP_ = 1 then do;
_LABEL_='INC_PER< 1.68';
UB=1.68;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 2 then do;
_LABEL_='1.68<= INC_PER< 1.86';
UB=1.86;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 3 then do;
_LABEL_='1.86<= INC_PER< 2.5';
UB=2.5;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 4 then do;
_LABEL_='2.5<= INC_PER< 3.75';
UB=3.75;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 5 then do;
_LABEL_='3.75<= INC_PER';
UB=.;
end;
 
if DISPLAY_VAR='MAJOR' and _GROUP_ = 1 then do;
_LABEL_='MAJOR< 1';
UB=1;
end;
else
if DISPLAY_VAR='MAJOR' and _GROUP_ = 2 then do;
_LABEL_='1<= MAJOR';
UB=.;
end;
 
if DISPLAY_VAR='CARDHLDR' and _GROUP_ = 1 then
_LABEL_='1.0000000';
 
if DISPLAY_VAR='OWNRENT' and _GROUP_ = 1 then
_LABEL_='1.0000000';
else
if DISPLAY_VAR='OWNRENT' and _GROUP_ = 2 then
_LABEL_='0.0000000';
 
if DISPLAY_VAR='SELFEMPL' and _GROUP_ = 1 then
_LABEL_='1.0000000';
else
if DISPLAY_VAR='SELFEMPL' and _GROUP_ = 2 then
_LABEL_='0.0000000';
