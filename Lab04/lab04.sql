====Q1
SELECT d.dept_name, COUNT(s.student_id) AS num_students
FROM departments d
LEFT JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

====Q2
SELECT d.dept_name, AVG(s.gpa) AS avg_gpa
FROM departments d
JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING AVG(s.gpa) > 3.0;

====Q3
SELECT c.course_name, AVG(s.fee) AS avg_fee
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
GROUP BY c.course_name;

====Q4
SELECT d.dept_name, COUNT(f.faculty_id) AS num_faculty
FROM departments d
LEFT JOIN faculty f ON d.dept_id = f.dept_id
GROUP BY d.dept_name;

====Q5
SELECT faculty_id, faculty_name, salary
FROM faculty
WHERE salary > (SELECT AVG(salary) FROM faculty);

====Q6
SELECT *
FROM students
WHERE gpa > ANY (
  SELECT gpa FROM students s
  JOIN departments d ON s.dept_id = d.dept_id
  WHERE d.dept_name = 'CS'
);

====Q7
SELECT *
FROM (
  SELECT student_id, student_name, gpa
  FROM students
  ORDER BY gpa DESC
)
WHERE ROWNUM <= 3;

====Q8
SELECT s.student_id, s.student_name
FROM students s
WHERE NOT EXISTS (
  SELECT c.course_id
  FROM enrollments e
  JOIN students a ON e.student_id = a.student_id
  WHERE a.student_name = 'Ali'
  MINUS
  SELECT c2.course_id
  FROM enrollments c2
  WHERE c2.student_id = s.student_id
);

====Q9
SELECT d.dept_name, SUM(s.fee) AS total_fee
FROM departments d
JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

====Q10
SELECT DISTINCT c.course_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
WHERE s.gpa > 3.5;

====Q11
SELECT d.dept_name, SUM(s.fee) AS total_fee
FROM departments d
JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING SUM(s.fee) > 1000000;

====Q12
SELECT d.dept_name
FROM departments d
JOIN faculty f ON d.dept_id = f.dept_id
WHERE f.salary > 100000
GROUP BY d.dept_name
HAVING COUNT(f.faculty_id) > 5;

====Q13
DELETE FROM students
WHERE gpa < (SELECT AVG(gpa) FROM students);

====Q14
DELETE FROM courses
WHERE course_id NOT IN (
  SELECT DISTINCT course_id FROM enrollments
);

====Q15
CREATE TABLE HighFee_Students AS
SELECT * FROM students
WHERE fee > (SELECT AVG(fee) FROM students);

====Q16
INSERT INTO Retired_Faculty (faculty_id, faculty_name, dept_id, salary, joining_date)
SELECT faculty_id, faculty_name, dept_id, salary, joining_date
FROM faculty
WHERE joining_date < (SELECT MIN(joining_date) FROM faculty);

====Q17
SELECT d.dept_name, SUM(s.fee) AS total_fee
FROM departments d
JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
ORDER BY total_fee DESC
FETCH FIRST 1 ROWS ONLY;

====Q18
SELECT * FROM (
  SELECT c.course_name, COUNT(e.student_id) AS total_students
  FROM courses c
  LEFT JOIN enrollments e ON c.course_id = e.course_id
  GROUP BY c.course_name
  ORDER BY total_students DESC
)
WHERE ROWNUM <= 3;

====Q19
SELECT s.student_id, s.student_name, COUNT(e.course_id) AS total_courses, s.gpa
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name, s.gpa
HAVING COUNT(e.course_id) > 3
AND s.gpa > (SELECT AVG(gpa) FROM students);

====Q20
INSERT INTO Unassigned_Faculty (faculty_id, faculty_name, dept_id, salary, joining_date)
SELECT f.faculty_id, f.faculty_name, f.dept_id, f.salary, f.joining_date
FROM faculty f
WHERE f.faculty_id NOT IN (
  SELECT DISTINCT fc.faculty_id FROM faculty_courses fc
);
