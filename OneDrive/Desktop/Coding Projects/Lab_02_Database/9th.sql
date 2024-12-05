select job_id, salary
from HR_EMPLOYEES
where job_id in'IT_PROG' and salary > 8000 or job_id in'FI_ACCOUNT' and salary > 8000;

