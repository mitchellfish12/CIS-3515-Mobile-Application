select first_name, last_name, employee_id
from HR_EMPLOYEES
where commission_pct is null or manager_id is null;