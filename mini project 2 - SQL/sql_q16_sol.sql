-- Write a SQL query to find referees and the number of matches they worked in each
-- venue

SELECT referee_name, venue_name, count(*)
FROM sql_mini_project.match_mast
LEFT JOIN sql_mini_project.referee_mast
USING(referee_id)
LEFT JOIN sql_mini_project.soccer_venue
using(venue_id)
group by referee_name, venue_name
order by referee_name, venue_name;