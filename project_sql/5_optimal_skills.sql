WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(skills_job_dim.skill_id) AS skill_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON 
        job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_dim.skill_id,
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
        skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skill_name,
    skill_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN 
    average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skill_count > 10
ORDER BY
    avg_salary DESC,
    skill_count DESC
LIMIT 25