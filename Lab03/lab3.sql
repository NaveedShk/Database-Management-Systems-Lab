====RESET
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

====Q1
CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) UNIQUE
);

INSERT INTO departments (dept_id, dept_name) VALUES (1, 'HR');
INSERT INTO departments (dept_id, dept_name) VALUES (2, 'Finance');
INSERT INTO departments (dept_id, dept_name) VALUES (3, 'IT');


CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER(10,2) CHECK (salary > 20000),
    dept_id NUMBER REFERENCES departments(dept_id)
);

====Q2
ALTER TABLE employees RENAME COLUMN emp_name TO full_name;

====Q3
-- Replace constraint name dynamically
DECLARE
  v_const_name VARCHAR2(100);
BEGIN
  SELECT constraint_name INTO v_const_name
  FROM user_constraints
  WHERE table_name = 'EMPLOYEES' AND CONSTRAINT_TYPE = 'C' AND search_condition LIKE '%SALARY%';
  EXECUTE IMMEDIATE 'ALTER TABLE employees DROP CONSTRAINT ' || v_const_name;
END;
/
INSERT INTO employees (emp_id, full_name, salary, dept_id) VALUES (1, 'Ali Khan', 5000, 1);

====Q4
DROP TABLE departments CASCADE CONSTRAINTS;

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) UNIQUE
);

INSERT INTO departments (dept_id, dept_name) VALUES (1, 'HR');
INSERT INTO departments (dept_id, dept_name) VALUES (2, 'Finance');
INSERT INTO departments (dept_id, dept_name) VALUES (3, 'IT');


====Q5
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);

====Q6
ALTER TABLE employees
ADD bonus NUMBER(6,2) DEFAULT 1000;

====Q7
ALTER TABLE employees
ADD city VARCHAR2(20) DEFAULT 'Karachi';

ALTER TABLE employees
ADD age NUMBER CHECK (age > 18);

====Q8
DELETE FROM employees WHERE emp_id IN (1, 3);

====Q9
ALTER TABLE employees MODIFY (full_name VARCHAR2(20));
ALTER TABLE employees MODIFY (city VARCHAR2(20));

====Q10
ALTER TABLE employees
ADD email VARCHAR2(50) UNIQUE;

====Q11
ALTER TABLE employees ADD CONSTRAINT uq_bonus UNIQUE (bonus);
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email)
VALUES (2, 'Ahmed', 30000, 2, 1000, 'Lahore', 25, 'ahmed@example.com');
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email)
VALUES (3, 'Sara', 32000, 3, 2000, 'Karachi', 28, 'sara@example1.com');

====Q12
ALTER TABLE employees
ADD dob DATE CHECK (dob <= ADD_MONTHS(SYSDATE, -216));

====Q13
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email, dob)
VALUES (4, 'Hassan', 28000, 1, 1200, 'Karachi', 19, 'hassan@example.com', TO_DATE('01-JAN-2015','DD-MON-YYYY'));

====Q14
ALTER TABLE employees DROP CONSTRAINT fk_dept;
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email, dob)
VALUES (5, 'Zain', 27000, 10, 1300, 'Lahore', 25, 'zain@example.com', TO_DATE('10-JAN-1999','DD-MON-YYYY'));
ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id);

====Q15
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees DROP COLUMN city;

====Q16
SELECT d.dept_name, e.full_name, e.salary
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

====Q17
ALTER TABLE employees RENAME COLUMN salary TO monthly_salary;

====Q18
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

====Q19
TRUNCATE TABLE students;

====Q20
SELECT d.dept_name, COUNT(e.emp_id) AS num_employees
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY num_employees DESC
FETCH FIRST 1 ROWS ONLY;
