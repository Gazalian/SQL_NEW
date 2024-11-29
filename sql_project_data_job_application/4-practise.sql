SELECT
    q1_posting.job_title_short,
    q1_posting.job_location,
    q1_posting.job_posted_date
FROM (SELECT*
    FROM 
        january_jobs
    UNION ALL
    SELECT*
    FROM 
        february_jobs
    UNION ALL
    SELECT*
    FROM 
        march_jobs
) AS q1_posting
WHERE q1_posting.salary_year_avg > 70000


SELECT
    job_title_short,
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 70000