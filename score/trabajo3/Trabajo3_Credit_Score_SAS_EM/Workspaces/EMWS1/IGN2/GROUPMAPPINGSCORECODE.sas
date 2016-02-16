 length _LABEL_ $200;
 label _LABEL_='Valores de grupo';
 
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 1 then do;
_LABEL_='ACTIVE< 2';
UB=2;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 2 then do;
_LABEL_='2<= ACTIVE< 12';
UB=12;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 3 then do;
_LABEL_='12<= ACTIVE< 16';
UB=16;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 4 then do;
_LABEL_='16<= ACTIVE< 19';
UB=19;
end;
else
if DISPLAY_VAR='ACTIVE' and _GROUP_ = 5 then do;
_LABEL_='19<= ACTIVE';
UB=.;
end;
 
if DISPLAY_VAR='AGE' and _GROUP_ = 1 then do;
_LABEL_='AGE< 27.58';
UB=27.58;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 2 then do;
_LABEL_='27.58<= AGE< 32.58';
UB=32.58;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 3 then do;
_LABEL_='32.58<= AGE< 37.25';
UB=37.25;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 4 then do;
_LABEL_='37.25<= AGE< 52.42';
UB=52.42;
end;
else
if DISPLAY_VAR='AGE' and _GROUP_ = 5 then do;
_LABEL_='52.42<= AGE';
UB=.;
end;
 
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 1 then do;
_LABEL_='AVGEXP< 12.65';
UB=12.65;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 2 then do;
_LABEL_='12.65<= AVGEXP< 57.44';
UB=57.44;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 3 then do;
_LABEL_='57.44<= AVGEXP< 101.76';
UB=101.76;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 4 then do;
_LABEL_='101.76<= AVGEXP< 352.17';
UB=352.17;
end;
else
if DISPLAY_VAR='AVGEXP' and _GROUP_ = 5 then do;
_LABEL_='352.17<= AVGEXP';
UB=.;
end;
 
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 1 then do;
_LABEL_='CUR_ADD< 24';
UB=24;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 2 then do;
_LABEL_='24<= CUR_ADD< 49';
UB=49;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 3 then do;
_LABEL_='49<= CUR_ADD< 108';
UB=108;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 4 then do;
_LABEL_='108<= CUR_ADD< 192';
UB=192;
end;
else
if DISPLAY_VAR='CUR_ADD' and _GROUP_ = 5 then do;
_LABEL_='192<= CUR_ADD';
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
_LABEL_='3<= DEPNDT';
UB=.;
end;
 
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 1 then do;
_LABEL_='EXP_INC< 0.01';
UB=0.01;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 2 then do;
_LABEL_='0.01<= EXP_INC< 0.03';
UB=0.03;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 3 then do;
_LABEL_='0.03<= EXP_INC< 0.09';
UB=0.09;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 4 then do;
_LABEL_='0.09<= EXP_INC< 0.17';
UB=0.17;
end;
else
if DISPLAY_VAR='EXP_INC' and _GROUP_ = 5 then do;
_LABEL_='0.17<= EXP_INC';
UB=.;
end;
 
if DISPLAY_VAR='INCOME' and _GROUP_ = 1 then do;
_LABEL_='INCOME< 1.8';
UB=1.8;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 2 then do;
_LABEL_='1.8<= INCOME< 2.06';
UB=2.06;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 3 then do;
_LABEL_='2.06<= INCOME< 4.8';
UB=4.8;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 4 then do;
_LABEL_='4.8<= INCOME< 5.48';
UB=5.48;
end;
else
if DISPLAY_VAR='INCOME' and _GROUP_ = 5 then do;
_LABEL_='5.48<= INCOME';
UB=.;
end;
 
if DISPLAY_VAR='INC_PER' and _GROUP_ = 1 then do;
_LABEL_='INC_PER< 1.07';
UB=1.07;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 2 then do;
_LABEL_='1.07<= INC_PER< 1.3';
UB=1.3;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 3 then do;
_LABEL_='1.3<= INC_PER< 1.59';
UB=1.59;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 4 then do;
_LABEL_='1.59<= INC_PER< 1.85';
UB=1.85;
end;
else
if DISPLAY_VAR='INC_PER' and _GROUP_ = 5 then do;
_LABEL_='1.85<= INC_PER';
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
_LABEL_='0.0000000';
else
if DISPLAY_VAR='CARDHLDR' and _GROUP_ = 2 then
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
