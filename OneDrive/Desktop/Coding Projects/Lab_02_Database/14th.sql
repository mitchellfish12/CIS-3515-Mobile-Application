select substr(start_date, 8, 9) AS start_year
from hr_job_history
order by start_year;