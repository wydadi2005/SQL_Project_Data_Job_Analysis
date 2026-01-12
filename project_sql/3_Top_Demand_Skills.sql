SELECT sd.skills,count(*) skill_count
FROM job_postings_fact jpf
JOIN skills_job_dim sjd ON sjd.job_id=jpf.job_id
JOIN skills_dim sd ON sd.skill_id=sjd.skill_id
WHERE job_title_short='Data Analyst'
GROUP BY sd.skills
ORDER BY skill_count DESC
LIMIT 5