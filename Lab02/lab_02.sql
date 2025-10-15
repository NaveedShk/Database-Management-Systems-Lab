====Q1
SELECT SUM(salary) AS total_salary
FROM employees;

====Q2
SELECT AVG(salary) AS average_salary
FROM employees;

====Q3
SELECT manager_id, COUNT(*) AS num_of_employees
FROM employees
GROUP BY manager_id;


====Q4
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);


=====Q5
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY') AS current_date
FROM dual;


====Q6
SELECT TO_CHAR(SYSDATE, 'DAY MONTH YYYY') AS full_date
FROM dual;


=====Q7
SELECT *
FROM employees
WHERE TO_CHAR(hire_date, 'DAY') = 'WEDNESDAY';




=====Q8
SELECT MONTHS_BETWEEN(TO_DATE('01-JAN-2025','DD-MON-YYYY'),
                      TO_DATE('01-OCT-2024','DD-MON-YYYY')) AS months_diff
FROM dual;



====Q9
SELECT employee_id, first_name, last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS months_worked
FROM employees;



=====Q10
SELECT SUBSTR(last_name, 1, 5) AS first_5_chars
FROM employees;

=====POST LAB====
======Q11
SELECT LPAD(first_name, 15, '*') AS padded_name
FROM employees;


====Q12
SELECT LTRIM('   Oracle') AS trimmed_text
FROM dual;

=====Q13
SELECT INITCAP(first_name) AS proper_case_first,
       INITCAP(last_name) AS proper_case_last
FROM employees;


====Q14
SELECT NEXT_DAY(TO_DATE('20-AUG-2022', 'DD-MON-YYYY'), 'MONDAY') AS next_monday
FROM dual;


====Q15
SELECT TO_CHAR(TO_DATE('25-DEC-2023', 'DD-MON-YYYY'), 'MM-YYYY') AS formatted_date
FROM dual;


=====Q16
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC;

=====Q17
SELECT employee_id, first_name, last_name,
       ROUND(salary, -2) AS rounded_salary
FROM employees;

====Q18
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC
FETCH FIRST 1 ROWS ONLY;


=====Q19
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 3 ROWS ONLY;

====Q20
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC
FETCH FIRST 1 ROWS ONLY;

