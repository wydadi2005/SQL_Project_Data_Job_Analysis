WITH skill_demand AS (
    SELECT sd.skill_id,sd.skills,count(sjd.job_id) skill_count
    FROM job_postings_fact jpf
    JOIN skills_job_dim sjd ON sjd.job_id=jpf.job_id
    JOIN skills_dim sd ON sd.skill_id=sjd.skill_id
    WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
    AND job_work_from_home=TRUE
    GROUP BY sd.skill_id,sd.skills)
    , average_salary AS (
    SELECT sd.skill_id,sd.skills,
    ROUND(AVG(salary_year_avg),0) avg_salary
    FROM job_postings_fact jpf
    JOIN skills_job_dim sjd ON sjd.job_id=jpf.job_id
    JOIN skills_dim sd ON sd.skill_id=sjd.skill_id
    WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
    AND job_work_from_home=TRUE
    GROUP BY sd.skill_id,sd.skills)

SELECT sd.skills,sd.skill_id,sd.skill_count,avs.avg_salary
FROM skill_demand sd
JOIN average_salary avs ON avs.skill_id=sd.skill_id
WHERE sd.skill_count > 10
ORDER BY avs.avg_salary DESC, sd.skill_count DESC
LIMIT 25;