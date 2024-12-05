select count(department_name) as with_manager, sum(case when manager_id is null then 1 else 0 end) as without_manager
from HR_DEPARTMENTS;