====Q1
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

====Q2
SELECT d.dept_name, e.emp_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

====Q3
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

====Q4
SELECT e.emp_name
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;

====Q5
SELECT s.student_name, c.course_name
FROM students s
JOIN courses c ON s.course_id = c.course_id;

====Q6
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

====Q7
SELECT d.dept_name, e.emp_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

====Q8
SELECT t.teacher_name, s.subject_name
FROM teachers t
CROSS JOIN subjects s;

====Q9
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

====Q10
SELECT s.student_name, c.course_name, t.teacher_name
FROM students s
JOIN courses c ON s.course_id = c.course_id
JOIN teachers t ON c.teacher_id = t.teacher_id;

====Q11
SELECT s.student_name, t.teacher_name
FROM students s
JOIN teachers t ON s.city = t.city;

====Q12
SELECT e.emp_name, m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

====Q13
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL;

====Q14
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000;

====Q15
SELECT e.emp_name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE dept_id = e.dept_id
);

====Q16
SELECT d.dept_name
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING MIN(e.salary) >= 30000;

====Q17
SELECT s.student_name, c.course_name
FROM students s
JOIN courses c ON s.course_id = c.course_id
WHERE s.city = 'Lahore';

====Q18
SELECT e.emp_name, m.emp_name AS manager_name, d.dept_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.hire_date BETWEEN TO_DATE('2020-01-01','YYYY-MM-DD') AND TO_DATE('2023-01-01','YYYY-MM-DD');

====Q19
SELECT s.student_name
FROM students s
JOIN courses c ON s.course_id = c.course_id
JOIN teachers t ON c.teacher_id = t.teacher_id
WHERE t.teacher_name = 'Sir Ali';

====Q20
SELECT e.emp_name
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE e.dept_id = m.dept_id;
