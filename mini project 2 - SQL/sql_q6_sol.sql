-- Write a SQL query to find the number of matches that were won by a single point, but
-- do not include matches decided by penalty shootout.

SELECT count(*) FROM (
SELECT *,
ABS(goal_score - LEAD(goal_score, 1) OVER(PARTITION BY match_no)) as points_diff
FROM sql_mini_project.match_details 
WHERE penalty_score < 1) as sub
WHERE points_diff = 1

