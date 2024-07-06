-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- https://app.quickdatabasediagrams.com/


CREATE TABLE titles (
    title_id VARCHAR(64) NOT NULL,
    title VARCHAR(64) NOT NULL,
    PRIMARY KEY (title_id)
    );

CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id VARCHAR(64) NOT NULL REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    sex VARCHAR(64) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
    );
    
CREATE TABLE departments (
    dept_no VARCHAR(64) NOT NULL,
    dept_name VARCHAR(64) NOT NULL,
    PRIMARY KEY (dept_no)
    );

CREATE TABLE salaries (
    emp_no int NOT NULL REFERENCES employees(emp_no),
    salary int NOT NULL,
    PRIMARY KEY (emp_no)
    );

CREATE TABLE dept_emp (
    emp_no int NOT NULL REFERENCES employees(emp_no),
    dept_no VARCHAR(64) NOT NULL REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
    );

-- neither are unique
CREATE TABLE dept_manager (
    dept_no VARCHAR(64) NOT NULL REFERENCES departments(dept_no),
    emp_no int NOT NULL REFERENCES employees(emp_no),
    PRIMARY KEY (emp_no)
    );
