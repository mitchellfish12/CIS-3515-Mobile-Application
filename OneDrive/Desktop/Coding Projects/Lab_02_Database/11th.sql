select country_id, count(*)
from hr_locations
where country_id in('IT', 'JP', 'US', 'CA', 'CN', 'IN', 'AU', 'SG', 'UK', 'DE', 'BR', 'CH', 'NL', 'MX')
group by COUNTRY_ID
order by count(*) desc;