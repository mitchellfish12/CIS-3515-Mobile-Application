Select FIRST_NAME, LAST_NAME, HIRE_DATE, COALESCE(COMMISSION_PCT, 0)
    from HR_EMPLOYEES
    order by LAST_Name ASC;