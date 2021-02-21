--creating an employee table
CREATE TABLE employee(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

--creating an employee table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES employee (emp_no)
);

--creating a departments table
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (DEPT_NO)
);

--creating a dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	PRIMARY KEY (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

--creating a dept_emp table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	PRIMARY KEY (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employee (emp_no),
	FOREIGN KEY(dept_no) REFERENCES department (dept_no)
);

--creating a titles table
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);