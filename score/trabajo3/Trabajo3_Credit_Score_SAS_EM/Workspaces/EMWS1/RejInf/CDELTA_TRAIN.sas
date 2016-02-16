if NAME="ACTIVE"  then ROLE="INPUT ";
else
if NAME="AGE"  then ROLE="INPUT ";
else
if NAME="AVGEXP"  then ROLE="INPUT ";
else
if NAME="CARDHLDR"  then ROLE="INPUT ";
else
if NAME="CUR_ADD"  then ROLE="INPUT ";
else
if NAME="DEFAULT"  then ROLE="TARGET ";
else
if NAME="DEPNDT"  then ROLE="INPUT ";
else
if NAME="EXP_INC"  then ROLE="INPUT ";
else
if NAME="ID"  then ROLE="ID ";
else
if NAME="INCOME"  then ROLE="INPUT ";
else
if NAME="INC_PER"  then ROLE="INPUT ";
else
if NAME="MAJOR"  then ROLE="INPUT ";
else
if NAME="OWNRENT"  then ROLE="INPUT ";
else
if NAME="SELFEMPL"  then ROLE="INPUT ";
else
if NAME="_dataobs_"  then ROLE="ID ";
else
if  upcase(NAME) = "_FREQ_" then
ROLE='FREQ';
else
if (ksubstr(NAME, 1, 4) in('WOE_', 'GRP_', 'LBL_')) then
   delete;
else
if upcase(NAME) in('_SCORECARD_POINTS_', 'SCORECARD_POINTS','_ACTUAL_INFERRED_') then
   ROLE='REJECTED';
if strip(role)='TARGET' and level='INTERVAL' then
   ROLE='REJECTED';
else if upcase(NAME) ne "_FREQ_"
   and strip(role)="FREQ" then role="REJECTED";
