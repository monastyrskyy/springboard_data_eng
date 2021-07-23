-- Write a SQL query to find all the defenders who scored a goal for their teams.
SELECT player_name FROM sql_mini_project.player_mast
LEFT JOIN sql_mini_project.goal_details
using(player_ID)
where posi_to_play = 'DF' and goal_id is not Null;