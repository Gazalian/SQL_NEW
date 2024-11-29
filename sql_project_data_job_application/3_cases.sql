-- January
CREATE TABLE january_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 3; 

SELECT job_posted_date 
FROM march_jobs; 

SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS job_month,
    COUNT (job_id) AS monthly_job_count
FROM job_postings_fact 
GROUP BY 
    EXTRACT(MONTH FROM job_posted_date)
ORDER BY 
    job_month    

SELECT 
    job_title_short, 
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local' 
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact; 

SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local' 
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact 
WHERE  
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category; 

SELECT 
    job_title_short,
    AVG(salary_year_avg) AS average_salary, 
    MAX(salary_year_avg) AS maximum_salary, 
    MIN(salary_hour_avg) AS minimum_salary
FROM job_postings_fact 
GROUP BY job_title_short

SELECT
    job_title_short, 
    CASE
    WHEN salary_year_avg > 70000 THEN 'high'
    WHEN salary_year_avg < 40000 THEN 'low'
    ELSE 'standard'
    END AS salary_condition 
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' 

SELECT 
    job_title_short AS name,
    job_to_skill.skill_id AS skill_tag,
    skills_type.skills AS needed_skills
FROM job_postings_fact AS job_postings
LEFT JOIN skills_job_dim AS job_to_skill ON job_postings.job_id = job_to_skill.job_id 
LEFT JOIN skills_dim AS skills_type ON job_to_skill.skill_id = skills_type.skill_id

SELECT*
FROM skills_dim

SELECT
    job_to_skill.skill_id,
    skills_type.skills AS skill_name,
    COUNT(*) AS skill_mention
FROM
    skills_job_dim AS job_to_skill
INNER JOIN skills_dim AS skills_type ON job_to_skill.skill_id = skills_type.skill_id
GROUP BY 
    job_to_skill.skill_id, 
    skills_type.skills
ORDER BY 
    skill_mention DESC 
LIMIT 5

