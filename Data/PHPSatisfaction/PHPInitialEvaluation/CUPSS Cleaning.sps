* Encoding: UTF-8.
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHPCUPSSsat_1.sav'.
SORT CASES BY ID1.
COMPUTE ID=ID1.
SAVE OUTFILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHPCUPSS_verification_temp.sav'. 
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHPCUPSSsat_2.sav'.
SORT CASES BY ID2.
COMPUTE ID=ID2.
MATCH FILES FILE=*
    /FILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHPCUPSS_verification_temp.sav'
    /BY ID.

SAVE OUTFILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHP_verification_temp.sav'.
GET FILE='P:\Satisfaction\Databases\PHP Satisfaction\PHP Initial Evaluation\PHP_verification_temp.sav'. 

RECODE ID1 (SYSMIS=999999).
RECODE ID2 (SYSMIS=999999).
COMPUTE MISSID=(ID1-ID2).
TEMPORARY.
SELECT IF (MISSID NE 0).
LIST ID1 ID2.

MISSING VALUES ALL ().
RECODE ALL (SYSMIS=999999).

COMPUTE A1=(P_date_1 - P_date_2).
COMPUTE A2=(P_doc_1 - P_doc_2).
COMPUTE A3=(Psat1_1 - Psat1_2).
COMPUTE A4=(Psat2_1 - Psat2_2).
COMPUTE A5=(Psat3_1 - Psat3_2).
COMPUTE A6=(Psat4_1 - Psat4_2).
COMPUTE A7=(Psat5_1 - Psat5_2).
COMPUTE A8=(Psat6_1 - Psat6_2).
COMPUTE A9=(Psat7_1 - Psat7_2).
COMPUTE A10=(Psat8_1 - Psat8_2).
COMPUTE A11=(Psat9_1 - Psat9_2).
COMPUTE A12=(Psat10_1 - Psat10_2).
COMPUTE A13=(Psat11_1 - Psat11_2).
COMPUTE A14=(Psat12_1 - Psat12_2).
COMPUTE A15=(Psat13_1 - Psat13_2).
COMPUTE A16=(Psat14_1 - Psat14_2).
COMPUTE A17=(Psat15_1 - Psat15_2).
COMPUTE A18=(Psat16_1 - Psat16_2).
COMPUTE A19=(Psat17_1 - Psat17_2).
COMPUTE A20=(Psat18_1 - Psat18_2).
COMPUTE A21=(Anonym_1 - Anonym_2).
COMPUTE A22=(Not_Consented_1 - Not_Consented_2).
COMPUTE A23=(PHP_ID_1 - PHP_ID_1).

EXECUTE.

TEMPORARY.
SELECT IF (A1 NE 0).
LIST ID P_date_1  P_date_2.

TEMPORARY.
SELECT IF (A2 NE 0).
LIST ID P_doc_1  P_doc_2.

TEMPORARY.
SELECT IF (A3 NE 0).
LIST ID Psat1_1  Psat1_2.

TEMPORARY.
SELECT IF (A4 NE 0).
LIST ID Psat2_1  Psat2_2.

TEMPORARY.
SELECT IF (A5 NE 0).
LIST ID Psat3_1  Psat3_2.

TEMPORARY.
SELECT IF (A6 NE 0).
LIST ID Psat4_1 Psat4_2.

TEMPORARY.
SELECT IF (A7 NE 0).
LIST ID Psat5_1  Psat5_2.

TEMPORARY.
SELECT IF (A8 NE 0).
LIST ID Psat6_1  Psat6_2. 

TEMPORARY.
SELECT IF (A9 NE 0).
LIST ID Psat7_1 Psat7_2.

TEMPORARY.
SELECT IF (A10 NE 0).
LIST ID Psat8_1  Psat8_2.

TEMPORARY.
SELECT IF (A11 NE 0).
LIST ID Psat9_1  Psat9_2. 

TEMPORARY.
SELECT IF (A12 NE 0).
LIST ID Psat10_1  Psat10_2.

TEMPORARY.
SELECT IF (A13 NE 0).
LIST ID Psat11_1  Psat11_2.

TEMPORARY.
SELECT IF (A14 NE 0).
LIST ID  Psat12_1  Psat12_2.

TEMPORARY.
SELECT IF (A15 NE 0).
LIST ID Psat13_1  Psat13_2.

TEMPORARY.
SELECT IF (A16 NE 0).
LIST ID Psat14_1  Psat14_2.

TEMPORARY.
SELECT IF (A17 NE 0).
LIST ID Psat15_1 Psat15_2.

TEMPORARY.
SELECT IF (A18 NE 0).
LIST ID Psat16_1  Psat16_2.

TEMPORARY.
SELECT IF (A19 NE 0).
LIST ID Psat17_1  Psat17_2.

TEMPORARY.
SELECT IF (A20 NE 0).
LIST ID Psat18_1  Psat18_2.

TEMPORARY.
SELECT IF (A21 NE 0).
LIST ID Anonym_1  Anonym_2.

TEMPORARY.
SELECT IF (A22 NE 0).
LIST ID Not_Consented_1  Not_Consented_2.

TEMPORARY.
SELECT IF (A23 NE 0).
LIST ID PHP_ID_1  PHP_ID_2.
