* Encoding: UTF-8.
DATASET ACTIVATE DataSet18.

**cisgender recodes**

DO IF (Sex_Old_1 = 0).
RECODE Sex_1 (SYSMIS=0).
END IF.
EXECUTE.

DO IF (Sex_Old_1 = 1).
RECODE Sex_1 (SYSMIS=1).
END IF.
EXECUTE.

DO IF (Sex_Old_1 = 0).
RECODE Gender_1 (SYSMIS=0).
END IF.
EXECUTE.

DO IF (Sex_Old_1 = 1).
RECODE Gender_1 (SYSMIS=1).
END IF.
EXECUTE.

**SEX ASSIGNED AT BIRTH for transgender, genderqeer, and other recoded as "Unknown (ID as Trans, genderqueer, or other before 12.18)"

DO IF (Sex_Old_1 = 2 OR Sex_Old_1 = 3 OR Sex_Old_1 = 4).
RECODE Sex_1 (SYSMIS=3).
END IF.
EXECUTE.

**GENDER transgender recoded as "Unknown (ID as Trans Before Demos Change 12.18)" 

DO IF (Sex_Old_1 = 2).
RECODE Gender_1 (SYSMIS=4).
END IF.
EXECUTE.

**GENDER "genderqueer/androgynous" recoded as "other" 

DO IF (Sex_Old_1 = 3 OR Sex_Old_1 = 4).
RECODE Gender_1 (SYSMIS=3).
END IF.
EXECUTE.

***SYNTAX FOR USING THIS DATA***

**Compute a cisgender variable. Note that zero in this variable will include both non-cis patients and patients with MISSING DATA**

COMPUTE Cisgender=0.
IF  ((Sex_1 = 0 AND Gender_1 = 0) OR (Sex_1 = 1 AND Gender_1 = 1)) Cisgender=1.
EXECUTE.

USE ALL.
COMPUTE filter_$=(Cisgender = 1).
VARIABLE LABELS filter_$ 'Cisgender = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Sex_1 Gender_1 OtherGender_1
  /ORDER=ANALYSIS.

**Do this to seperate the noncisgender folks from system missing folks**

USE ALL.
COMPUTE filter_$=(Cisgender <  1).
VARIABLE LABELS filter_$ 'Cisgender <  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=Sex_1 Gender_1 OtherGender_1
  /ORDER=ANALYSIS.

**Compute a transgender variable.**

COMPUTE Transgender.
IF  (Sex_1 = 0 AND Gender_1 = 1) Transgender=1.
IF  (Sex_1 = 1 AND Gender_1 = 0) Transgender=0.
EXECUTE.



FREQUENCIES VARIABLES=Transgender Gender_1 OtherGender_1
  /ORDER=ANALYSIS.
