-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, last_name, first_name, sex, salary 
FROM employees AS e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;
 
-- Another way to do question number 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

-- 3. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT d.dept_no, dept_name, d.emp_no, last_name, first_name 
FROM dept_manager AS d
INNER JOIN departments AS dp ON d.dept_no = dp.dept_no
INNER JOIN employees AS e ON d.emp_no = e.emp_no

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no, last_name, first_name, dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments AS dp ON de.dept_no = dp.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, last_name, first_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dp.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;