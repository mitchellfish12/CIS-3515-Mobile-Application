select first_name, last_name, salary, round(salary * .038398, 2) as rounded_city_tax
from hr_employees
order by rounded_city_tax desc;