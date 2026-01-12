SELECT sd.skills,AVG(salary_year_avg) avg_salary
FROM job_postings_fact jpf
JOIN skills_job_dim sjd ON sjd.job_id=jpf.job_id
JOIN skills_dim sd ON sd.skill_id=sjd.skill_id
WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY sd.skills
ORDER BY avg_salary DESC
LIMIT 25