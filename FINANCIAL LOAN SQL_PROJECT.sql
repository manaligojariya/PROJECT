create database sql_manali;


use  sql_manali;

desc manali;
select * from manali;
-- Total number of records
SELECT COUNT(*) FROM manali;

-- Average annual income
SELECT AVG(annual_income) FROM manali;

-- Highest loan amount
SELECT MAX(loan_amount) FROM manali;

-- Lowest interest rate
SELECT MIN(int_rate) FROM manali;

-- Count of each loan status
SELECT loan_status, COUNT(*) FROM manali GROUP BY loan_status;

-- Average employment length
SELECT AVG(emp_length) FROM loan_data;

-- Top 10 employee titles by count
SELECT emp_title, COUNT(*) FROM manali GROUP BY emp_title ORDER BY COUNT(*) DESC LIMIT 10;

-- Count of loans by purpose
SELECT purpose, COUNT(*) FROM manali GROUP BY purpose;

-- Correlation between annual income and loan amount
SELECT 
    (COUNT(*) * SUM(dti * int_rate) - SUM(dti) * SUM(int_rate)) / 
    SQRT((COUNT(*) * SUM(dti * dti) - SUM(dti) * SUM(dti)) * (COUNT(*) * SUM(int_rate * int_rate) - SUM(int_rate) * SUM(int_rate))) AS correlation
FROM manali
LIMIT 1000;

-- Count of loans by term
SELECT term, COUNT(*) FROM manali GROUP BY term;

-- Count of loans by verification status
SELECT verification_status, COUNT(*) FROM manali GROUP BY verification_status;

-- Average monthly installment
SELECT AVG(installment) FROM manali;

-- Highest monthly installment
SELECT MAX(installment) FROM manali;

-- Find the overall average loan amount
SELECT AVG(loan_amount) AS overall_average_loan_amount
FROM loan_data;

-- Analyze average loan amount by purpose using subquery
SELECT
    purpose,
    AVG(loan_amount) AS average_loan_amount,
    (SELECT AVG(loan_amount) FROM manali) AS overall_average_loan_amount
FROM manali
GROUP BY purpose;

SELECT *
FROM manali
WHERE
    issue_date BETWEEN '2021-01-01' AND '2021-12-2';
    
SELECT *
FROM manali
WHERE  loan_status = 'Charged Off' OR loan_status = 'Fully Paid';

SELECT *
FROM manali where term IN (' 36 months', ' 60 months');

SELECT *
FROM manali where verification_status = 'Source Verified';

SELECT *
FROM manali where  annual_income >= 40000;

SELECT *
FROM manali where total_payment NOT BETWEEN 2000 AND 5000 ;

select *
FROM manali where  home_ownership NOT IN ('OWN', 'MORTGAGE');

select * from manali where NOT (dti > 0.2 AND loan_amount > 10000);

SELECT *
FROM manali where  last_credit_pull_date LIKE '13-%';

select * from manali where  last_payment_date LIKE '%04-2021';

select * from manali where loan_status LIKE 'Charged%';

select * from manali where next_payment_date LIKE '%-02-2021';

select * from manali where  purpose LIKE '%car%';

SELECT DISTINCT emp_title FROM manali;

select distinct last_credit_pull_date from manali;

select distinct last_payment_date from manali;

select distinct loan_status from manali;

select distinct purpose from manali;

select distinct term from manali;

select distinct annual_income from manali;

select distinct loan_amount from manali;

select distinct total_acc from manali;

SELECT * FROM manali ORDER BY loan_amount DESC;

select loan_status,verification_status, member_id  from manali order by member_id asc;

select sub_grade,grade from manali;

select home_ownership from manali where loan_status="Fully Paid";

select stddev(annual_income), variance(annual_income), avg(annual_income) from manali;

select stddev(loan_amount) ,variance(loan_amount),avg(loan_amount) from manali;

select stddev(total_payment),variance(total_payment),avg(total_payment) from manali;

select stddev(total_acc),variance(total_acc),avg(total_acc) from manali;








