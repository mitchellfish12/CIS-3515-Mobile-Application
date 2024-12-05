select country_id, count(*)
from hr_locations
where country_id in('IT', 'JP', 'US', 'CA', 'CN', 'IN', 'AU', 'SG', 'UK', 'DE', 'BR', 'CH', 'NL', 'MX') GROUP
BY country_id
HAVING count(*) >1
order by country_id desc;