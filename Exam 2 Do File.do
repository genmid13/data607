clear
use "/Users/genesismiddleton/Desktop/Exam2 Data.dta"
set more off

tab vcr_p1k
tab vcr_p1k, nol
tab vcr_p1k, missing
gen vcrp1k = vcr_p1k
drop if vcrp1k==.
tab vcr_p1k, missing
su vcrp1k, detail

tab Race_All
tab Race_All, missing

tab Educ_All
tab Educ_All, missing

tab emp_ft
tab emp_ft, nol
tab emp_ft, missing

*Descriptive
su vcrp1k
tab Race_All
tab Educ_All
tab emp_ft




*Chi-sq
tabulate Educ_All Race_All, chi2 column gamma V
tabulate  emp_ft Race_All, chi2 column gamma V


*Correlation
pwcorr vcrp1k Educ_All emp_ft , obs sig


*BiVariate Linear Regression 
regress vcrp1k i.Race_All 
regress vcrp1k Educ_All 
regress vcrp1k i.emp_ft
regress vcrp1k i.Race_All Educ_All i.emp_ft
