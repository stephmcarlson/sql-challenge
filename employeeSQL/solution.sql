--Employee Salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 1986 Hires
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

--Dept Manager
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM dept_manager
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no;

-- Dept Employee
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name 
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- Hercules
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Sales Employees
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- Sales and Development Employees
SELECT departments.dept_name, employees.emp_no, employees.first_name, employees.last_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- Last Names Count
SELECT last_name, COUNT(last_name) AS "Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Last Names" DESC;