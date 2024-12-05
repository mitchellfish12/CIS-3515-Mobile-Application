select first_name, last_name, employee_id
from hr_employees
where commission_pct is null and manager_id is null;