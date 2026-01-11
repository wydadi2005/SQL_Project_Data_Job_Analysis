SELECT job_id,job_title,job_location,
        job_schedule_type,salary_year_avg,job_posted_date,
        cd.name as name
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON cd.company_id=jpf.company_id
Where job_title_short='Data Analyst'
and job_work_from_home=TRUE and salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10