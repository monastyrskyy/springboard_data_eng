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

-- 1. List the name of the student with id equal to v1 (id).
SELECT name FROM Student WHERE id = @v1;

-- Full Table Scan - Query cost: 41.0


-- ANALYSIS
-- No index provided, resulting in very slow runtimes for large queries.
CREATE INDEX id
ON Student (id);

SELECT name FROM Student WHERE id = @v1;
-- Non-Unique Key Lookup (Student id) - query cost: 0.35 - over 80 times faster than before.