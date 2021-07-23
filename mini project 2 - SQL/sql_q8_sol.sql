-- Write a SQL query to find the match number for the game with the highest number of
-- penalty shots, and which countries played that match.
SELECT m.match_no, c.country_name
FROM sql_mini_project.match_details as m
LEFT JOIN sql_mini_project.soccer_country as c
ON m.team_id = c.country_id
WHERE m.match_no = (
SELECT match_no
FROM sql_mini_project.match_details
WHERE penalty_score = (SELECT MAX(penalty_score) from sql_mini_project.match_details)
)
