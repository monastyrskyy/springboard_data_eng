-- Write a SQL query to find the number of matches that were won by penalty shootout.
SELECT count(distinct match_no)
FROM sql_mini_project.match_details
WHERE penalty_score > 0;