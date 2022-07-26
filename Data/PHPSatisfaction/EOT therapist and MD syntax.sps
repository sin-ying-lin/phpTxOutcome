* Encoding: UTF-8.

DATASET ACTIVATE DataSet2.
USE ALL.
COMPUTE filter_$=(Psychiatrist_1=15).
VARIABLE LABELS filter_$ 'Psychiatrist_1=6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



FREQUENCIES VARIABLES=MD_1 md_sessions_1
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=MD_1 md_sessions_1
  /STATISTICS=MEAN STDDEV MIN MAX.


USE ALL.
COMPUTE filter_$=(Therapist_1=1 OR Therapist_1=2 OR Therapist_1=5 OR Therapist_1=6 or 
    Therapist_1=17 or Therapist_1=19 or Therapist_1=20 or Therapist_1=22 OR Therapist_1=24 OR 
    Therapist_1=33 OR Therapist_1=34 OR Therapist_1=39 OR Therapist_1=42 OR Therapist_1=45 OR 
    Therapist_1=46 OR Therapist_1=48 OR Therapist_1=51 ).
VARIABLE LABELS filter_$ 'Therapist_1=1 OR Therapist_1=2 OR Therapist_1=5 OR Therapist_1=6 or '+
    'Therapist_1=17 or Therapist_1=19 or Therapist_1=20 or Therapist_1=22 OR Therapist_1=24 OR '+
    'Therapist_1=33 OR Therapist_1=34 OR Therapist_1=39 OR Therapist_1=42 OR Therapist_1... (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


USE ALL.
COMPUTE filter_$=(Therapist_1=51).
VARIABLE LABELS filter_$ 'Therapist_1=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=THERAPY_1 tx_sessions_1
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=THERAPY_1 tx_sessions_1
  /STATISTICS=MEAN STDDEV MIN MAX.

