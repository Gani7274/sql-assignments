CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);



-- 31
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;

-- 32
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

-- 33
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department;

-- 34
SELECT department, COUNT(*) AS student_count
FROM Students
GROUP BY department;

-- 35
SELECT department, COUNT(*) AS student_count
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

-- 36
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;

-- 37
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;

-- 38
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

-- 39
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

-- 40
SELECT department, COUNT(*) AS student_count
FROM Students
GROUP BY department
ORDER BY student_count DESC;

-- 41
SELECT department, MIN(marks) AS lowest_mark
FROM Students
GROUP BY department;

-- 42
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

-- 43
SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;

-- 44
SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

-- 45
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
ORDER BY highest_mark DESC; 