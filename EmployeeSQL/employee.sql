--drop employee table 
DROP TABLE employee;

--creating an employee table
CREATE TABLE employee(
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

--creating an employee table
CREATE TABLE salaries(
	emp_no INT,
	salary INT
);

--listing employee number, last name, first name, sex and salary
SELECT 
	employee.emp_no,
	employee.last_name,
	employee.first_name,
	employee.sex,
	salaries.salary
FROM employee
JOIN salaries ON employee.emp_no = salaries.emp_no;

--listing first name, last name and hire date for employees who were hired in 1986
SELECT 
	first_name,
	last_name,
	hire_date

FROM employee

WHERE hire_date between date '01/01/1986' and '12/31/1986';

--creating a departments table
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR
);

--creating a dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT
);

--creating a dept_emp table
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR
);

--creating a titles table
CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR
);
--checking data imports
SELECT * FROM dept_manager;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM titles;

--listing the manager of each department with department number, department names, manager's employee number, last name and first name
SELECT
	departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employee.last_name,
	employee.first_name
	
FROM employee
JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no;

--listing the department of each employee with the following information employee number, last name, first name and department names
SELECT 
	dept_emp.emp_no,
	employee.last_name,
	employee.first_name,
	departments.dept_name
	
FROM employee
JOIN dept_emp ON dept_emp.emp_no = employee.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

--listing first name, last name and sex for employeeswhose first name is "Hercules" and last name begins with a "B"
SELECT
	employee.first_name,
	employee.last_name,
	employee.sex
	
FROM employee 
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--All employees in the Sales departments, including their employee number, last name, first name and department
SELECT
	dept_emp.emp_no,
	employee.last_name,
	employee.first_name,
	departments.dept_name
	
FROM employee
JOIN dept_emp ON dept_emp.emp_no = employee.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

--All employees in the Sales and Development departments, including their employee number, last name, first name and department
SELECT
	dept_emp.emp_no,
	employee.last_name,
	employee.first_name,
	departments.dept_name

FROM employee
JOIN dept_emp ON dept_emp.emp_no = employee.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name IN ('Sales','Development');

--in descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "total" 
FROM employee
GROUP BY last_name
ORDER BY total DESC;