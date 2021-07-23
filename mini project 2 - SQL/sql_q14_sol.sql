-- Write a SQL query to find referees and the number of bookings they made for the
-- entire tournament. Sort your answer by the number of bookings in descending order.

SELECT referee_name, count(*) 
FROM sql_mini_project.match_mast
LEFT JOIN sql_mini_project.referee_mast
USING(referee_id)
LEFT JOIN sql_mini_project.player_booked
USING(match_no)
GROUP BY referee_name
ORDER BY count(*) desc;