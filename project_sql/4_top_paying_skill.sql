SELECT
    skills_dim.skills AS skill_name,
    ROUND (AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON 
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY 
    skill_name
ORDER BY 
    avg_salary DESC
LIMIT 25