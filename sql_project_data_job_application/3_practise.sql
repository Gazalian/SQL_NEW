SELECT 
    skill.skill_id AS skill_id,
    skill.skills AS SKill_name, 
    skill_mention.skill_count AS the_count
FROM skills_dim AS skill
JOIN (SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5) AS skill_mention 
    ON skill.skill_id = skill_mention.skill_id;

SELECT 
    company_title.name AS name,
    CASE
        WHEN job_count < 10 THEN 'Ssmall'
        WHEN job_count > 50 THEN 'Large'
        ELSE 'Medium'
    END AS company_size
FROM company_dim AS company_title
JOIN(SELECT 
        company.name AS company_name,
        COUNT(job_id) AS job_count 
    FROM job_postings_fact AS job_posting 
    INNER JOIN company_dim AS company ON company.company_id = job_posting.company_id
    GROUP BY 
        company_name
    ORDER BY 
        job_count DESC)
    AS company_count 
    ON company_count.company_name = company_title.name; 

SELECT 
    company_name.name AS company,
    job_posting.company_id,
    COUNT(job_posting.company_id) AS job_count
FROM job_postings_fact AS job_posting
LEFT JOIN company_dim AS company_name ON company_name.company_id = job_posting.company_id
GROUP BY job_posting.company_id, company_name.name
ORDER BY job_count DESC;


-- Write a query to calculate how often specific skills
-- have been mentioned in job postings over different 
--  quarters of 2023. Return the skill name, total mentions 
-- for each quarter, and compare it with the previous quarter 
-- to indicate growth or decline.

WITH skill_mention_count AS (
    SELECT
    EXTRACT(MONTH FROM job_posting.job_posted_date) AS job_month,
    COUNT(EXTRACT(MONTH FROM job_posting.job_posted_date)) AS skill_mention,
    job_to_skill.skill_id AS id_to_skill
    FROM job_postings_fact AS job_posting
    LEFT JOIN skills_job_dim AS job_to_skill 
    ON job_posting.job_id = job_to_skill.job_id
    WHERE EXTRACT(YEAR FROM job_posting.job_posted_date) = 2023
    GROUP BY job_month, id_to_skill
    )

SELECT
    skill.skills AS skill_name,
    skill_mention_count.skill_mention,
    skill_mention_count.job_month,
    CASE
      WHEN skill_mention_count.job_month BETWEEN 1 AND 3 THEN 'Q1' 
      WHEN skill_mention_count.job_month BETWEEN 4 AND 6 THEN 'Q2' 
      WHEN skill_mention_count.job_month BETWEEN 7 AND 9 THEN 'Q3' 
      ELSE 'Q4'
    END AS quarter
    
FROM skills_dim AS skill
LEFT JOIN skill_mention_count ON skill.skill_id = skill_mention_count.id_to_skill

SELECT 
     job_id 
     job_schedule_type
FROM job_postings_fact AS job_posting
WHERE job_schedule_type = 'remote'      

SELECT*
FROM job_postings_fact
LIMIT 1000