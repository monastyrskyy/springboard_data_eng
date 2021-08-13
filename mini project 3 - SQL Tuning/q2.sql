USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;

-- ANALYSIS
-- Full Table Scan - Query cost: 41.0
-- Rewriting this query with >= and <= produces the same results. Rewriting it with a subquery makes the query time longer. 
-- I did not find a way to rewrite this query without making it less readable (no improved performance or even worse performance). Table scans take a long time.
