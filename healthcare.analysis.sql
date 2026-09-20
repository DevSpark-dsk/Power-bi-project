create table healthcare(
Name varchar(50),	
Age	int,
Gender varchar(60),	
Blood_Type varchar(10),
Medical_Condition varchar(20),
Date_of_Admission date,
Doctor varchar(50),
Hospital varchar(50),
Insurance_Provider varchar(100),
Billing_Amount decimal(10,2),
Room_Number int,
Admission_Type varchar(50),
Discharge_Date date,
Medication varchar(50),
Test_Results varchar(50)
)

select * from healthcare

--HEALTHCARE KPI'S 

--Q1 TOTAL PATIENTS
SELECT DISTINCT(COUNT(name)) AS Total_patients FROM healthcare

--Q2 TOTAL BILLING
SELECT SUM(billing_amount) as total_billing FROM healthcare

--Q3 AVERAGE ADMIT DURATION
SELECT CAST(AVG(discharge_date-date_of_admission)AS INT) AS average_stay FROM healthcare

--Q4 AVERAGE OF BILLING AMOUNT
SELECT CAST(AVG(billing_amount)AS INT) FROM healthcare

select * from healthcare

