create database churn;
use churn;

-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM churn;

-- 2. Total Churned Customers
select count(*) as Churn_Customers
from churn
where churn='Yes';

-- 3. Churn Rate (%)
select count(case when churn = 'Yes' then 1 end) * 100.0 /count(*) as churn_rate
from churn;

-- 4. Count by Gender
select gender,count(*) as Total
from churn
group by gender;

-- 5. Average Monthly Charges
SELECT AVG(monthly_charges) AS avg_charges
from churn;

-- 6. Max & Min Tenure
select min(tenure) as MIN_Tenure,
max(tenure) as MAX_Tenure
from churn;

-- 7. Churn by Gender
select gender, count(*) as Churn_Count
from churn
where churn='Yes'
group by gender;

-- 8. Churn by Contract Type
select contract_type, count(*) as Churn_Count
from churn
where churn = 'Yes'
group by contract_type;

-- 9. Avg Charges by Churn
SELECT churn, round(AVG(monthly_charges),2) AS avg_charges
FROM churn
GROUP BY churn;

-- 10. Customers by Internet Service
select internet_service,count(*) as churn_count
from churn
group by internet_service;

-- 11. High Paying Customers (>1500)
select *
from churn
where  monthly_charges > 1500;

-- 12. Tenure Group Analysis
select
	case
       when tenure <12 then '0-1 Year'
       when tenure <24 then '1-2 Year'
       else '2+ Years'
	end as Tenure_Group,
    count(*) as Total_Customer
from churn
group by Tenure_Group;

-- 13. Churn Rate by Contract Type
select contract_type,count(case when churn='Yes' then 1 end)* 100.0 /count(*) as churnCount
from churn
group by contract_type;

-- 14. Top 10 High Risk Customers
select *
from churn
order by monthly_charges desc,tenure asc
limit 10;

-- 15. Rank Customers by Monthly Charges
select
		customer_id,monthly_charges,
		rank() over(order by monthly_charges desc) as Ranking
from churn;

-- 16. Running Total of Customers
select 
		customer_id,
        count(*) over(order by customer_id) as Running_Total
from churn;

-- 17. Churn Percentage by Internet Service
SELECT 
    internet_service,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM churn
GROUP BY internet_service;

-- 18. Identify At-Risk Customers
select * from churn
where tenure <12
and monthly_charges >1200
and churn = 'Yes';