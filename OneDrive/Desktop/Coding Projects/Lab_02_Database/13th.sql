select department_id, count(*)
from hr_employees
where department_id in('10', '20', '30', '40', '50', '60', '70', '80', '90', '100', '110')
group by DEPARTMENT_ID
order by count(*) desc;