Select FIRST_NAME, LAST_NAME, HIRE_DATE, employee_id, COALESCE(COMMISSION_PCT, 0)
    from HR_EMPLOYEES
    where department_id is null
    order by LAST_Name ASC;