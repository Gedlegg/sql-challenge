-- Create employee database
CREATE DATABASE employee;

-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary), -- Composite primary key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    PRIMARY KEY (emp_no, dept_no), -- Composite primary key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no), -- Composite primary key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);