SELECT job_posted_date FROM job_postings_fact LIMIT 10;
SELECT '2023-02-19'::DATE, 
'123'::INTEGER, 
'true'::BOOLEAN, 
'3.14'::REAL;  

SELECT 
    job_title_short AS title, 
    job_location AS location, 
    job_posted_date AT TIMe ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM   
    job_postings_fact  
LIMIT 5;

SELECT 
    COUNT (job_id) AS job_count, 
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact 
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    date_month
ORDER BY 
    job_count DESC; 

    SELECT* FROM job_postings_fact LIMIT 100;
    SELECT* FROM company_dim LIMIT 100;

SELECT  
    job_schedule_type AS schedule, 
    AVG (salary_year_avg) AS salary_yearly, 
    MIN (salary_year_avg) AS MIN_yearly,
    AVG (salary_hour_avg) AS salary_hourly 
FROM  
    job_postings_fact 
WHERE 
    job_posted_date > '2023-06-01'
GROUP BY 
    job_schedule_type; 


SELECT 
    COUNT(job_id) AS job_count, 
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')) AS job_month
FROM 
    job_postings_fact 
WHERE 
    EXTRACT(YEAR FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')) = 2023
GROUP BY  
    job_month 
ORDER BY 
    job_month;

SELECT 
    company.name AS name_of_company,
    job_postings.job_health_insurance AS health_insurance
FROM 
    job_postings_fact AS job_postings 
LEFT JOIN company_dim AS company ON job_postings.company_id = company.company_id
WHERE 
    EXTRACT(YEAR FROM (job_postings.job_posted_date)) = 2023 
AND 
    EXTRACT(MONTH FROM (job_postings.job_posted_date))
    BETWEEN 4 AND 6;



