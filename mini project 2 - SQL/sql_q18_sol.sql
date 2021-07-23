-- . Write a SQL query to find the highest number of foul cards given in one match.

SELECT match_no, count(*)
FROM sql_mini_project.player_booked
GROUP BY match_no
ORDER BY count(*) desc
limit 1;