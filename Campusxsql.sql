USE smitadb;

create table employees(
emp_id int primary key,
name varchar(50),
age INT,
department VARCHAR(50),
salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Smita Shinde', 32, 'Data Science', 150000),
(2, 'Snehalkumar Kadam', 33, 'Sales', 170000),
(3, 'Shubham Shinde', 27, 'Banker', 100000),
(4, 'Vaishali Shinde', 55, 'Farmer', 50000);

SELECT *FROM employees WHERE department='Sales';

SELECT name, salary FROM employees WHERE salary>50000;

SELECT DISTINCT department FROM employees;

SELECT * FROM employees WHERE name LIKE 'V%';

SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY age ASC;
SELECT * FROM employees WHERE age BETWEEN 25 AND 35;

SELECT max(salary) AS max_salary, min(salary) AS min_salary FROM employees;
SELECT avg(salary) AS average_salary from employees;

SELECT department, count(*) as total_employees from employees GROUP BY department;

SELECT department, avg(salary) AS avg_salary from employees GROUP BY department HAVING avg_salary>50000;

CREATE TABLE department(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
salary DECIMAL(10,2)
);

INSERT INTO department VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Finance'),
(5, 'Marketing');

SELECT e.name, e.salary, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id=d.dept_id;

SELECT d.dept_name, e.name
FROM department d
LEFT JOIN employee e
ON e.dept_id = d.dept_id;


SELECT * FROM employees WHERE salary>(SELECT avg(salary) from employees);
SELECT DISTINCT* from employees ORDER BY salary DESC LIMIT 1 OFFSET 1;
SELECT name FROM employees WHERE salary>(SELECT avg(salary) from employees);
SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 3;

SELECT *, COUNT(*) AS total_count
FROM users
GROUP BY email
HAVING total_count >1;

SELECT name FROM employees WHERE manager_id IS NULL;

SELECT dept_id,
COUNT(*) AS total_count
FROM employees
group by dept_id
ORDER BY total_count DESC;

#########################################Campusx

CREATE DATABASE IF NOT EXISTS mydb

DROP DATABASE mydb

CREATE TABLE IF NOT EXISTS users(
id INT,
name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255)
)

DROP TABLE users

CREATE TABLE IF NOT EXISTS users(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(255),
email VARCHAR(255) UNIQUE,
password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users(
id INT NOT NULL,
name VARCHAR(255),
email VARCHAR(255),
CONSTRAINT u_email UNIQUE(name,email),  
password VARCHAR(255),
PRIMARY KEY(id)
);

CREATE TABLE orders(
order_id INT,
user_id INT,
time_of_order datetime,
PRIMARY KEY(order_id),
FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE students(
student_id INT NOT NULL,
sname VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
age INT CHECK (age>6 AND age<25)
);

CREATE TABLE passenger(
pid INT NOT NULL PRIMARY KEY,
pname VARCHAR(255) NOT NULL,
gender VARCHAR(255) DEFAULT 'OTHERS'
);

CREATE TABLE passenger(
pid INT NOT NULL PRIMARY KEY,
pname VARCHAR(255),
gender varchar(50),
journey_date datetime DEFAULT current_timestamp
);

CREATE TABLE passenger(
Pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(255) NOT NULL,
gender VARCHAR(255),
journey_date datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE students ADD COLUMN college VARCHAR(255) NOT NULL;
ALTER TABLE students DROP COLUMN age;
ALTER TABLE students MODIFY COLUMN sname INT;


INSERT INTO students VALUES
(1, 'Smita Shinde', 'smitu@gmail.com', 'KWC');

INSERT INTO students (student_id, sname, email,college) VALUES
(1, 'Smita Shinde', 'smitu@gmail.com', 'KWC');

INSERT INTO students VALUES
(2, 'Snehal Kadam', 'snehal@gmail.com', 'bishap'),
(3, 'Shubham Shinde', 'shubham@gmail.com', 'jsp');

SELECT name FROM movies WHERE genre Like 'Comedy' or genre like 'Action';
SELECT name FROM movies WHERE genre IN ("Comedy", "Action","Horrer");
SELECT name FROM movies WHERE genre NOT IN ("Comedy", "Action");
SELECT name FROM movies WHERE name LIKE 'a%';
SELECT name FROM movies WHERE name LIKE '%MAN%';
SELECT name FROM movies WHERE name LIKE '%a';
SELECT name FROM movies WHERE director ="Stanley Kubrick";
SELECT name FROM movies WHERE name LIKE '_____';
SELECT name FROM movies WHERE name LIKE 'A____';

UPDATE passenger SET pname ='Rahul';
UPDATE students SET sname ='Smita' WHERE email Like '%gmail%';

DELETE FROM passenger WHERE pid=1;

SELECT name FROM movies WHERE (gross-budget)<0;
SELECT name, (gross-budget) AS Profit FROM movies WHERE (gross-budget)<0 ORDER BY Profit ASC;
SELECT name, abs(gross-budget) AS Profit FROM movies;
SELECT name, round((runtime/60),1) FROM movies;
SELECT upper(name) FROM MOVIES;
SELECT LOWER(name) FROM moview;
SELECT name, CONCAT(director,' ',writer) AS crew FROM movies;
SELECT name, length(name) as Length FROM movies;
SELECT name, substr(name, 3,5) as short FROM movies;

SELECT name, budget FROM movies WHERE (SELECT max(budget) FROM movies) =budget ;
SELECT name, gross FROM movies WHERE (SELECT min(gross) FROM movies)=gross;
SELECT sum(gross) FROM movies;
SELECT avg(gross) FROM movies;
SELECT count(*) FROM movies;
SELECT count(distinct(director)) as movie_count FROM movies;

SELECT * from movies ORDER BY genre, name;
SELECT * from movies ORDER BY genre DESC, name ASC;
SELECT director, COUNT(*) as total_movies from movies GROUP BY director ORDER BY total_movies DESC;
SELECT genre, sum(gross-budget) as total_profit FROM movies GROUP BY genre ORDER BY total_profit DESC;
SELECT director, avg(gross-budget) AS avg_profit FROM movies GROUP BY director ORDER BY avg_profit DESC;


SELECT director, writer, avg(GROSS-budget) as profit from movies GROUP BY director, writer ORDER BY profit DESC LIMIT 5;
SELECT director, avg(screens) FROM movies GROUP BY director HAVING opening>1000 ORDER BY opening DESC;
SELECT name, (gross-budget) as profit,
	CASE
		WHEN (gross-budget) > 1000000000 then "SUPER HIT"
		WHEN (gross-budget) > 250000000 AND (gross-budget)< 1000000000 then "HIT"
		WHEN (gross-budget) > 0 AND (gross-budget)< 25000000 then "Average"
		ELSE "FLOP"
	END as verdict
FROM movies;


##########Join
CREATE DATABASE whatsapp;
use whatsapp;
CREATE TABLE users(
id INT NOT NULL UNIQUE,
name VARCHAR(255),
age DECIMAL,
emergency_contact INT
);

INSERT INTO users VALUES
(1,"smita", 32, 12345),
(2, "Snehal", 33, 134545),
(3, "Shubham", 27, 7890876),
(4, "Vaishali", 56, 34567);


CREATE TABLE groups1(
gid INT,
gname VARCHAR(255)
);

INSERT INTO groups1 VALUES
(1, "GROUP1"),
(2, "GROUP2"),
(3, "GROUP3");

CREATE TABLE membership(
mid INT,
gid INT,
id INT);

INSERT INTO membership VALUES
(1, 1, 2),
(2, 3, 1),
(3, 4, 2),
(4, 2, 3),
(5, 1, 4);


SELECT * FROM users CROSS JOIN groups1;
SELECT * FROM membership m JOIN users u ON m.id=u.id;
SELECT * FROM membership m INNER JOIN users u ON m.id=u.id;
SELECT * FROM groups1 g RIGHT JOIN users u ON g.gid=u.id;
SELECT * FROM groups1 g LEFT JOIN users u ON g.gid=u.id;

##Full join
SELECT id FROM users
UNION
SELECT gid FROM groups1;

SELECT * FROM membership m LEFT OUTER JOIN users u ON m.id=u.id
UNION
SELECT * FROM membership m RIGHT OUTER JOIN users u ON m.id=u.id;

SELECT name, gname FROM membership m JOIN users u ON m.id=u.id JOIN groups1 g ON g.gid=m.gid;

#self join
SELECT u1.name, u2.name FROM users u1 JOIN users u2 ON u1.emergency_contact=u2.id;

USE smitadb;
##NESTED QUERY
SELECT * FROM movies WHERE budget =(SELECT MAX(budget) FROM movies);

SELECT * FROM movies WHERE director IN (SELECT DISTINCT (director) FROM movies Where director LIKE 'A%'); 
SELECT *
FROM movies
WHERE director IN (
    SELECT director
    FROM (
        SELECT director, SUM(gross - budget) AS total_profit
        FROM movies
        GROUP BY director
        ORDER BY total_profit DESC
        LIMIT 5
    ) AS top_dirs
);


SELECT * FROM movies GROUP BY genre ORDER BY (gross-budget) DESC LIMIT 1;