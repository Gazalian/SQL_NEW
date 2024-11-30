# INTRODUCTION

This has been SQL projects I havde been working on, this project explores top-paying, in-demand skills, and where high demand meets high salary in data analytics

Fore more? Check then out here: [project_sql folder](/project_sql)
# Background 
I love working on data, this very project was done during my journy of learning SQL.

You can view my [Github profile](/https://github.com/Gazalian). It has all my project in it.

### The questions
1. What are the top paying data analyst job?
2. What skills are required for these top-paying jobs?
3. What skills are the most demanding for Data analysis?
# Tools I Used
For this whole project, here are the tools are used.
- **SQL** 
- **PostgreSQL**
- *Visual Studio Code*
- ***Git & Github***
# The Analysis
Each query for this project aimed at investing specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top paying Data Analyst Jobs
To identify the highest-project roles, I filtered data analyst position by average yearly salary and location, focusing on the remote jobs.
```sql
SELECT 
    job_id,
    company_dim.name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of top data analyst jobs in 2023; 
- **Top pay:** Based on the uploaded schema, the dataset has a robust structure for exploring job postings and their associated skills. Here’s a breakdown of how we can approach the analysis to identify trends among top-paying data analyst roles.
![Top paying skill](/asset/Screenshot%202024-11-30%20050141.png)
*This is just the screenshot of the result*


# What I Learned 
I learnt Alot from the result from the table.
## Here is the table
| Skill ID | Skill Name          | Skill Count | Average Salary ($) |
|----------|---------------------|-------------|--------------------|
| 1        | SQL                 | 15          | 85,000.00          |
| 2        | Python              | 14          | 83,500.00          |
| 3        | Data Visualization  | 12          | 81,200.00          |
# Conclusion

- **SQL** is the most in-demand skill with an average salary of $85,000.
- **Python** follows closely, showing its importance in data analysis roles.
- **Data Visualization** skills are also highly valued, emphasizing the need for presenting data effectively.

### Closing Thoughts
This really a great one for me and I will make sure as much as possible to practise this very well.

### Ghazali Habeeulahi Olamide
*gazalianfellow*