select * from healthcare

--Healthcare KPI's 

--Total billing amount ?
SELECT SUM(billing_amount) AS total_billing FROM healthcare

--Find Average stay duration of patients ?
SELECT CAST(AVG(discharge_date - date_of_admission) AS int) AS Stay_duration  FROM healthcare

--What will be total patients?
SELECT COUNT(room_number) AS patients FROM healthcare


--Healthcare Insights:- 

--Find total billing by medical condition?
select
sum(billing_amount) * 100.0 / (select sum(billing_amount) from healthcare) as billing_per, medical_condition
from healthcare
group by medical_condition

--Which hospital generate high revenue?
SELECT SUM(billing_amount) as total_billing, hospital,
cast(SUM(billing_amount) * 100 / (SELECT SUM(billing_amount) FROM healthcare) AS decimal(10,2)) as total_per
FROM healthcare
GROUP BY hospital
order by total_billing desc
limit 5

--Count patients by blood group?
SELECT COUNT(name) AS patients, blood_type
FROM healthcare
GROUP BY blood_type

--In which hospital most customers visited?
SELECT COUNT(DISTINCT(name)) as patients, hospital
FROM healthcare
GROUP BY hospital
ORDER BY patients DESC

--Find out monthly billing ?
SELECT 
TO_CHAR(date_of_admission, 'Month') AS months,
SUM(billing_amount) AS total_billing
FROM healthcare
GROUP BY EXTRACT (MONTH FROM date_of_admission),
               TO_CHAR(date_of_admission, 'Month')
ORDER BY EXTRACT (MONTH FROM date_of_admission) ASC

--Which doctor attend most patients?
SELECT doctor, COUNT(DISTINCT(name)) AS patients
FROM healthcare
GROUP BY doctor 
ORDER BY patients DESC

