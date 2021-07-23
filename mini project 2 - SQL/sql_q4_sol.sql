-- Write a SQL query to compute a list showing the number of substitutions that
-- happened in various stages of play for the entire tournament.
SELECT play_half, count(*) 
FROM sql_mini_project.player_in_out
WHERE in_out = 'I'
GROUP BY play_half;