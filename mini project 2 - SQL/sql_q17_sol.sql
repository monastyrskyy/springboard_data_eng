-- Write a SQL query to find the country where the most assistant referees come from,
-- and the count of the assistant referees.

SELECT country_name, count(*)
FROM sql_mini_project.asst_referee_mast
left join sql_mini_project.soccer_country
using(country_id)
group by country_name
ORDER BY count(*)
;