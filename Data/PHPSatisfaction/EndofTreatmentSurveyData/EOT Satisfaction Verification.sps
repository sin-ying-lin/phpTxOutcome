* Encoding: UTF-8.
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\End of Treatment_1.sav'.
SORT CASES BY ID_1.
RECODE PHP_ID_1 TO Anonymity_1 (SYSMIS=0).
RECODE OS_1 TO IMPRV_1 (SYSMIS=0).
COMPUTE ID=ID_1.
EXECUTE.
SAVE OUTFILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\EOT Verfication.sav'.
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\End of Treatment_2.sav'.
SORT CASES BY ID_2.
RECODE PHP_ID_2 TO Anonymity_2 (SYSMIS=0).
RECODE OS_2 TO IMPRV_2 (SYSMIS=0).
COMPUTE ID=ID_2.
MATCH FILES FILE=*
    /FILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\EOT Verfication.sav'
    /BY ID.

SAVE OUTFILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\EOT Verfication.sav'.
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\End of Treatment Survey Data (Therapist)\EOT Verfication.sav'. 

RECODE ID_1 (SYSMIS=0).
RECODE ID_2 (SYSMIS=0).
COMPUTE MISSID=(ID_1-ID_2).
TEMPORARY.
SELECT IF (MISSID NE 0).
LIST ID_1 ID_2.

COMPUTE A1=(PHP_ID_1-PHP_ID_2).
COMPUTE A2=(Not_consented_1-Not_consented_2).
COMPUTE A3=(Therapist_1-Therapist_2).
COMPUTE A4=(Psychiatrist_1-Psychiatrist_2).
COMPUTE A5=(TRACK_1-TRACK_2).
COMPUTE A6 = (BT_1 - BT_2).
COMPUTE A7=(Anonymity_1-Anonymity_2).
COMPUTE A8=(OS_1-OS_2).
COMPUTE A9=(ACT_1-ACT_2).
COMPUTE A10=(IPT_1	-IPT_2).
COMPUTE A11=(SKILLS_1-SKILLS_2).
COMPUTE A12=(MD_1	-MD_2).
COMPUTE A13=(md_sessions_1-md_sessions_2).
COMPUTE A14=(THERAPY_1-THERAPY_2).
COMPUTE A15=(tx_sessions_1-tx_sessions_2).
COMPUTE A16=(LUNCH_1-LUNCH_2).
COMPUTE A17=(Meditation_1-Meditation_2).
COMPUTE A18=(OVERALL_1-OVERALL_2).
COMPUTE A19=(RECC_1-RECC_2).
COMPUTE A20=(IMPRV_1-IMPRV_2).


TEMPORARY. 	
SELECT IF	(A1 NE 0).	
LIST ID PHP_ID_1 PHP_ID_2.

TEMPORARY. 	
SELECT IF	(A2 NE 0).	
LIST ID Not_consented_1 Not_consented_2.

TEMPORARY. 	
SELECT IF	(A3 NE 0).	
LIST ID Therapist_1 Therapist_2.

TEMPORARY. 	
SELECT IF	(A4 NE 0).	
LIST ID Psychiatrist_1 Psychiatrist_2.

TEMPORARY. 	
SELECT IF	(A5 NE 0).	
LIST ID TRACK_1 TRACK_2.

TEMPORARY. 	
SELECT IF	(A6 NE 0).	
LIST ID BT_1 BT_2.

TEMPORARY.
SELECT IF (A7 NE 0).
LIST ID Anonymity_1 Anonymity_2.

TEMPORARY. 	
SELECT IF	(A8 NE 0).	
LIST ID OS_1 OS_2.

TEMPORARY. 	
SELECT IF	(A9 NE 0).	
LIST ID ACT_1 ACT_2.

TEMPORARY. 	
SELECT IF	(A10 NE 0).	
LIST ID IPT_1 IPT_2.

TEMPORARY.
SELECT IF (A11 NE 0) .
LIST ID SKILLS_1 SKILLS_2 .

TEMPORARY. 	
SELECT IF	(A12 NE 0).	
LIST ID MD_1 MD_2.

TEMPORARY. 	
SELECT IF	(A13 NE 0).	
LIST ID md_sessions_1	md_sessions_2.

TEMPORARY. 	
SELECT IF	(A14 NE 0).	
LIST ID THERAPY_1 THERAPY_2.

TEMPORARY. 	
SELECT IF	(A15 NE 0).	
LIST ID tx_sessions_1 tx_sessions_2.

TEMPORARY. 	
SELECT IF	(A16 NE 0).	
LIST ID LUNCH_1 LUNCH_2.

TEMPORARY.
SELECT IF (A17 NE 0) .
LIST ID meditation_1 meditation_2 .

TEMPORARY.
SELECT IF (A18 NE 0) .
LIST ID OVERALL_1 OVERALL_2 .

TEMPORARY.
SELECT IF (A19 NE 0) .
LIST ID RECC_1 RECC_2 .

TEMPORARY.
SELECT IF (A20 NE 0) .
LIST ID IMPRV_1 IMPRV_2 .

TEMPORARY.
SELECT IF (MONTH_1 NE MONTH_2) .
LIST ID MONTH_1 MONTH_2 .
