*------------------------------------------------------------*;
* Score: creando nombres fijos;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Segmento';
EM_SEGMENT = SCORECARD_BIN;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1.00 of DEFAULT';
EM_EVENTPROBABILITY = P_DEFAULT1_00;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_DEFAULT1_00
,
P_DEFAULT0_00
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for DEFAULT";
EM_CLASSIFICATION = I_DEFAULT;
