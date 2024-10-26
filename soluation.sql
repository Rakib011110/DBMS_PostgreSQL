-- Active: 1729750799544@@127.0.0.1@5432@psql


-- create department table 

CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
manager_id INT
) 

CREATE TABLE employe (
employ_id SERIAL PRIMARY KEY, 
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
hire_date DATE NOT NULL, 
salary NUMERIC(10,2) NOT NULL,
department_id INT REFERENCES departments(department_id),
is_active BOOLEAN 
) 

-- insert data departments 
INSERT INTO departments(department_name, manager_id)
VALUES 
('Human Resource', 1),
('Finance', 2),
('Engineering', 4);


SELECT * FROM departments
---------------

INSERT INTO employe(first_name,last_name,hire_date,salary,department_id,is_active)
VALUES 
('sadiya','islam', '2022-05-02', 5000.00, 1, TRUE),
('sinthiya','islam', '2022-05-12', 6000.00, 2, TRUE),
('Rakibul','islam' ,'2022-05-12', 6000.003, 3 , FALSE); 

INSERT INTO employe(first_name,last_name,hire_date,salary,department_id,is_active)
VALUES 
('Ariyan','Rakib' ,'2022-05-12', 6000.003, 3 , FALSE); 


SELECT * FROM employe 
  
SELECT * FROM  employe WHERE is_active = TRUE   




-- SELECT e.*
-- FROM employe e
--     JOIN departments d ON e.department_id = d.department_id
-- WHERE
--     d.department_name = 'Finance';



SELECT e.*, d.* FROM employe e JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name ='Finance'


-- calculate sallary
SELECT SUM(salary) total_salary FROM employe e JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name ='Engineering'


--  change aliasName 

SELECT
    first_name AS "First Name",
    salary AS "Employee Salary",
    hire_date
FROM employe
ORDER BY hire_date DESC;


SELECT * FROM departments WHERE department_id= null ADD

SELECT * FROM employe WHERE last_name ILIKE '%k%'


-- Get employees hired between 2021-01-01 and 2022-12-31.
SELECT *
FROM employe
WHERE
    hire_date BETWEEN '2021-01-01' AND '2022-12-31';