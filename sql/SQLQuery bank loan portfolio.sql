select * from Bank_Loan_data;

select count(id) as total_loan_applications from Bank_Loan_data where MONTH(issue_date)= 12 and year(issue_date)=2021;


SELECT SUM(loan_amount) as MOM from Bank_Loan_data where MONTH(issue_date)=12 and YEAR(issue_date)=2021;
SELECT SUM(loan_amount) AS MOPM from Bank_Loan_data where MONTH(issue_date)=11 and YEAR(issue_date)=2021;

SELECT SUM(TOTAL_PAYMENT) AS TOTAL_aMOUNT_RECEIVE FROM Bank_Loan_data ;

SELECT SUM(TOTAL_PAYMENT) AS  MTD_TOTAL_Amount_Received from Bank_Loan_data where month(issue_date)=12 and year(issue_date)=2021;
SELECT SUM(TOTAL_PAYMENT) AS PMTD_TOTAL_Amount_Received from Bank_Loan_data where month(issue_date)=12 and year(issue_date)=2021;

select round(AVG(int_rate),4)* 100 as MTD_avg_interest_rate from Bank_Loan_data WHERE month(issue_date)=12 and year(issue_date)=2021;
select round(AVG(int_rate),4)* 100 as PMTD_avg_interest_rate from Bank_Loan_data WHERE month(issue_date)=11 and year(issue_date)=2021;

-- DTI
SELECT round(AVG(dti),4)* 100  as MTD_avg_DTI from Bank_Loan_data  where month(issue_date)=12 and year(issue_date)=2021;
SELECT round(AVG(dti),4)* 100  as PMTD_avg_DTI from Bank_Loan_data  where month(issue_date)=11 and year(issue_date)=2021;

-- good loan percentage

SELECT loan_status from Bank_Loan_data; 
select count(id) as good_loan from Bank_Loan_data where loan_status = 'Fully Paid' or loan_status = 'Current';

select
    (count(case when loan_status='Fully Paid' or loan_status ='Current' then id end)) *100
    /
    count(id) as good_loan_percentage 
    from Bank_Loan_data;

-- good loan funded amount

select sum(loan_amount) as good_loan_funded_amount from Bank_Loan_data where loan_status = 'Fully Paid' or loan_status = 'Current';
select sum(total_payment) as good_loan_received_amount from Bank_Loan_data where loan_status = 'Fully Paid' or loan_status = 'Current';


-- BAD LOAN

select count(id) as bad_loan from Bank_Loan_data where loan_status = 'Charged Off';

select
    (count(case when loan_status='Charged Off' then id end) *100.0)
    /
    count(id) as bad_loan_percentage 
    from Bank_Loan_data;

-- bad loan funded amount

select sum(loan_amount) as bad_loan_funded_amount from Bank_Loan_data where loan_status = 'Charged Off';
select sum(total_payment) as bad_loan_received_amount from Bank_Loan_data where loan_status = 'Charged Off';


-- Loan Status Grade View

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status;

select
loan_status,
  sum(total_payment) as MTD_toal_received_Amount,
  sum( loan_amount) as MTD_total_funded_amount
 from Bank_loan_data
 where MONTH(issue_date)=12
 group by loan_status;


 select
loan_status,
  sum(total_payment) as PMTD_toal_received_Amount,
  sum( loan_amount) as PMTD_total_funded_amount
 from Bank_loan_data
 where MONTH(issue_date)=11
 group by loan_status;





 SELECT 
	MONTH(issue_date) AS Month_nunber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);



SELECT 
month(issue_date) as month_number,
DATENAME(month,issue_date) as month_name,
count(id) as total_applicants_loan ,
sum(loan_amount) as total_funded_amount ,
sum(total_payment) as total_received_amount
from Bank_Loan_data
group by month(issue_date),DATENAME(month,issue_date)
order by  month(issue_date) ;




SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY count(id) desc;


SELECT 
    emp_length as employee_length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;



SELECT 
    emp_length as employee_length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY count(id) desc;




SELECT 
      purpose as purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY count(id) desc;




SELECT 
      home_ownership as home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
where grade='A'
GROUP BY home_ownership
ORDER BY count(id) desc;
















