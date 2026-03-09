/*kpi_1*/
CREATE TABLE kpi_1 AS
SELECT 
    YEAR(issue_d) AS loan_year,
    concat(round(SUM(loan_amnt)/1000000,2),"M") AS total_loan_amount
FROM bank_loan
GROUP BY loan_year
ORDER BY loan_year;

/*kpi_2*/
CREATE TABLE kpi_2 AS
SELECT 
    grade,
    sub_grade,
    concat(round(SUM(revol_bal)/1000000,2),"M") AS total_revol_bal
FROM bank_loan
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;

/*kpi_3*/
CREATE TABLE kpi_3 AS
SELECT 
    verification_status,
    concat(round(SUM(total_pymnt)/1000000,2),"M") AS total_payment_sum
FROM bank_loan
GROUP BY verification_status;

/*kpi_4*/
CREATE TABLE kpi_4 AS
SELECT 
    addr_state AS State,
    COUNT(loan_status) AS Loan_Count
FROM bank_loan
GROUP BY addr_state
ORDER BY State;

/*kpi_5*/
CREATE TABLE kpi_5 AS
SELECT 
    YEAR(last_pymnt_d) AS Payment_Year,
    SUM(CASE WHEN Home_Ownership = 'OWN' THEN 1 ELSE 0 END) AS OWN,
    SUM(CASE WHEN Home_Ownership = 'MORTGAGE' THEN 1 ELSE 0 END) AS MORTGAGE,
    SUM(CASE WHEN Home_Ownership = 'RENT' THEN 1 ELSE 0 END) AS RENT,
    SUM(CASE WHEN Home_Ownership = 'OTHER' THEN 1 ELSE 0 END) AS OTHER,
    SUM(CASE WHEN Home_Ownership = 'NONE' THEN 1 ELSE 0 END) AS NONE
FROM bank_loan
GROUP BY 
    YEAR(last_pymnt_d)
ORDER BY 
    Payment_Year;

/*kpi_6*/
CREATE TABLE kpi_6 AS
SELECT 
    YEAR(issue_d) AS loan_year,
   concat(round(SUM(annual_inc)/1000000,2),"M") AS total_annual_income,
   concat(round(SUM(loan_amnt)/1000000,2),"M") AS total_loan_amount
FROM bank_loan
GROUP BY loan_year
ORDER BY loan_year;

/*kpi_7*/
CREATE TABLE kpi_7 AS
SELECT 
    grade,
    sub_grade,
    sum(revol_util) AS sum_revol_util
FROM bank_loan
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;

/*kpi_8*/
CREATE TABLE kpi_8 AS
SELECT 
    loan_status,
    concat(round(SUM(loan_amnt)/1000000,2),"M") AS sum_loan
FROM bank_loan
GROUP BY loan_status
ORDER BY sum_loan DESC;