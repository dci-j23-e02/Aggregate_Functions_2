# Aggregate Functions 2

Let's consider a simple example involving two tables: `employees` and `departments`. We'll demonstrate how to create these tables, insert sample data, and then use PostgreSQL aggregate functions to summarize the data.

### Step 1: Create Tables

#### 1. Departments Table

```sql
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);
```

#### 2. Employees Table

```sql
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

### Step 2: Insert Sample Data

#### Departments Table

```sql
INSERT INTO departments (department_name) VALUES ('IT');
INSERT INTO departments (department_name) VALUES ('HR');
INSERT INTO departments (department_name) VALUES ('Finance');
INSERT INTO departments (department_name) VALUES ('Sales');
INSERT INTO departments (department_name) VALUES ('Marketing');
```

#### Employees Table

```sql
INSERT INTO employees (employee_name, salary, department_id) VALUES ('John Doe', 70000, 1);
INSERT INTO employees (employee_name, salary, department_id) VALUES ('Jane Smith', 80000, 1);
INSERT INTO employees (employee_name, salary, department_id) VALUES ('Alice Johnson', 60000, 2);
INSERT INTO employees (employee_name, salary, department_id) VALUES ('Bob Brown', 90000, 3);
INSERT INTO employees (employee_name, salary, department_id) VALUES ('Charlie Davis', 50000, 4);
```

### Step 3: Use Aggregate Functions

Now, let's use some aggregate functions to summarize our data.

#### Average Salary by Department

```sql
SELECT 
    d.department_name, 
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    avg_salary DESC;
```

#### Total Number of Employees in Each Department

```sql
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS total_employees
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    total_employees DESC;
```

#### Maximum and Minimum Salary in the Company

```sql
-- Maximum Salary
SELECT MAX(salary) AS max_salary FROM employees;

-- Minimum Salary
SELECT MIN(salary) AS min_salary FROM employees;
```

#### Total Salary Expense for the Company

```sql
SELECT SUM(salary) AS total_salary_expense FROM employees;
```

These examples demonstrate how to create tables, insert data, and use aggregate functions to summarize data in PostgreSQL. Aggregate functions like `AVG()`, `COUNT()`, `MAX()`, `MIN()`, and `SUM()` are powerful tools for data analysis within SQL databases.
