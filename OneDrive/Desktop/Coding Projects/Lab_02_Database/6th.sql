select concat((substr(start_date, 8, 9)), ' ', (substr(end_date, 8, 9))) as From_:Year_of_Start_Date–To_:Year_of_End_Date
from hr_job_history;