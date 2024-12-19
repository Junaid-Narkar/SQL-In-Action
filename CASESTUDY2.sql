CREATE DATABASE CASESTUDY2

USE CASESTUDY2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);


INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)


--Simple Queries:

--1. List all the employee details.

SELECT * FROM EMPLOYEE;

--2. List all the department details.

SELECT * FROM DEPARTMENT;

--3. List all job details.

SELECT * FROM JOB;

--4. List all the locations.

SELECT * FROM LOCATION;

--5. List out the First Name, Last Name, Salary, Commission for all Employees.

SELECT FIRST_NAME,LAST_NAME,SALARY,COMM FROM EMPLOYEE;

--6. List out the Employee ID, Last Name, Department ID for all employees and 
--alias
--Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".

SELECT EMPLOYEE_ID ID_OF_THE_EMPLOYEE,LAST_NAME NAME_OF_THE_EMPLOYEE,DEPARTMENT_ID DEP_ID FROM EMPLOYEE; 

--7. List out the annual salary of the employees with their names only.SELECT CONCAT(FIRST_NAME,'',LAST_NAME),SALARY*12 AS ANUAL_SALARY FROM EMPLOYEE;--WHERE Condition:

--1. List the details about "Smith".

SELECT * FROM EMPLOYEE
WHERE LAST_NAME = 'SMITH';

--2. List out the employees who are working in department 20.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = 20;

--3. List out the employees who are earning salary between 2000 and 3000.

SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000;

--4. List out the employees who are working in department 10 or 20.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;

--5. Find out the employees who are not working in department 10 or 30.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID <> 10 OR DEPARTMENT_ID <> 30;

Select * from employee where not DEPARTMENT_ID = 10 or DEPARTMENT_ID = 30 ;

--6. List out the employees whose name starts with 'L'.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'L%';

--7. List out the employees whose name starts with 'L' and ends with 'E'.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'L%E';

--8. List out the employees whose name length is 4 and start with 'J'.

Select first_name from employee where first_name like 'J%' and len(first_name)=4;

--9. List out the employees who are working in department 30 and draw the 
--salaries more than 2500.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = 30 AND SALARY > 2500;

--10. List out the employees who are not receiving commission.

Select * from employee where comm is null;

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the 
--Employee ID.

SELECT EMPLOYEE_ID,LAST_NAME FROM EMPLOYEE
ORDER BY EMPLOYEE_ID ASC;

--2. List out the Employee ID and Name in descending order based on salary.

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEE
ORDER BY SALARY DESC;

--3. List out the employee details according to their Last Name in ascending-order.

SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME ASC;

--4. List out the employee details according to their Last Name in ascending 
--order and then Department ID in descending order.

SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME ASC;

SELECT * FROM EMPLOYEE
ORDER BY DEPARTMENT_ID DESC;

--GROUP BY and HAVING Clause:

--1. List out the department wise maximum salary, minimum salary and 
--average salary of the employees.

SELECT DEPARTMENT_ID, MAX(SALARY) MAX_SALARY,MIN(SALARY) MIN_SALARY, AVG(SALARY) AVG_SALARY  FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

--2. List out the job wise maximum salary, minimum salary and average 
--salary of the employees.

SELECT JOB_ID, MAX(SALARY) MAX_SALARY, MIN(SALARY) MIN_SALARY, AVG(SALARY) AVG_SALARY FROM EMPLOYEE
GROUP BY JOB_ID;

--3. List out the number of employees who joined each month in ascending order.

SELECT COUNT(*) AS NO_OF_EMPLOYEE,MONTH(HIRE_DATE) AS MONTH_NAME FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
ORDER BY MONTH(HIRE_DATE);


--4. List out the number of employees for each month and year in 
--ascending order based on the year and month.

SELECT COUNT(*) AS NO_OF_EMPLOYEE,MONTH(HIRE_DATE) AS MONTH_NAME, YEAR(HIRE_DATE) AS YEAR_NO FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)
ORDER BY MONTH(HIRE_DATE),YEAR(HIRE_DATE);

--5. List out the Department ID having at least four employees.

SELECT DEPARTMENT_ID,COUNT(*) AS NO_OF_EMPLOYEE FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>=4;

--6. How many employees joined in February month.

SELECT COUNT(*) AS NO_OF_EMPLOYEE FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
HAVING MONTH(HIRE_DATE) = '2';

--7. How many employees joined in May or June month.

SELECT COUNT(*) AS NO_OF_EMPLOYEE FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
HAVING MONTH(HIRE_DATE) = '5' OR MONTH(HIRE_DATE) = '6';

--8. How many employees joined in 1985?

SELECT COUNT(*) AS NO_OF_EMPLOYEE FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = '1985';

--9. How many employees joined each month in 1985?

SELECT COUNT(*) AS NO_OF_EMPLOYEE,MONTH(HIRE_DATE) AS HIRE_MONTH,YEAR(HIRE_DATE) AS HIRE_YEAR FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = '1985';

--10. How many employees were joined in April 1985?

SELECT COUNT(*) AS NO_OF_EMPLOYEE,MONTH(HIRE_DATE) AS HIRE_MONTH, YEAR(HIRE_DATE) AS HIRE_YEAR FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = '1985' AND MONTH(HIRE_DATE) = '4';

--11. Which is the Department ID having greater than or equal to 3 employees 
--joining in April 1985?

SELECT TOP 3 Department_Id, COUNT(*) AS NO_OF_EMPLOYEE FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 04 AND YEAR(HIRE_DATE) = 1985
GROUP BY Department_Id
HAVING COUNT(*) >= 3;


--Joins:

--1. List out employees with their department names.

SELECT E.DEPARTMENT_ID,E.FIRST_NAME,D.NAME FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id;

--2. Display employees with their designations.

SELECT E.FIRST_NAME,E.JOB_ID,J.DESIGNATION FROM EMPLOYEE AS E
INNER JOIN JOB AS J ON E.JOB_ID = J.JOB_ID;

--3. Display the employees with their department names and city.

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.JOB_ID,D.NAME,L.CITY FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id 
INNER JOIN LOCATION AS L ON D.Location_Id = L.Location_ID;

--4. How many employees are working in different departments? Display with 
--department names.

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,D.NAME FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id;

--5. How many employees are working in the sales department?

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,D.NAME FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id
WHERE D.NAME = 'SALES';

--6. Which is the department having greater than or equal to 3 
--employees and display the department names in
--ascending order.

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,D.NAME,COUNT(E.DEPARTMENT_ID) AS D_ID FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id;
HAVING D_ID >= 3
GROUP BY D_ID
ORDER BY D.NAME ASC;


--7. How many employees are working in 'Dallas'?

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.JOB_ID,D.NAME,L.CITY FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id 
INNER JOIN LOCATION AS L ON D.Location_Id = L.Location_ID
WHERE L.City = 'DALLAS';


--8. Display all employees in sales or operation departments.
SELECT E.EMPLOYEE_ID,E.FIRST_NAME,D.NAME FROM EMPLOYEE AS E 
INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID = D.Department_Id
WHERE D.NAME = 'SALES' OR D.NAME= 'OPERATIONS';


--CONDITIONAL STATEMENT

--1. Display the employee details with salary grades. Use conditional statement to 
--create a grade column.

SELECT *,
CASE 
WHEN salary > 2500 THEN 'S'
WHEN salary > 2000 THEN 'A'
WHEN salary > 1500 THEN 'B'
ELSE 'C'
END AS SalaryGrades
FROM EMPLOYEE;


--2. List out the number of employees grade wise. Use conditional statement to 
--create a grade column.

SELECT *,
CASE 
WHEN DEPARTMENT_ID = 20 THEN 'SALES'
WHEN DEPARTMENT_ID = 10 THEN 'ACCOUNTING'
WHEN DEPARTMENT_ID = 30 THEN 'REASEARCH'
ELSE 'OPERATIONS'
END AS EMPLOYEEGRADES
FROM EMPLOYEE



--3. Display the employee salary grades and the number of employees between 
--2000 to 5000 range of salary

SELECT *,
CASE 
WHEN salary > 2500 THEN 'S'
WHEN salary > 2000 THEN 'A'
WHEN salary > 1500 THEN 'B'
ELSE 'C'
END AS SalaryGrades
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 5000;

--Subqueries:

--1. Display the employees list who got the maximum salary.

SELECT SALARY FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);


--2. Display the employees who are working in the sales department.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME = 'SALES');

--3. Display the employees who are working as 'Clerk'.

SELECT * FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE Designation = 'CLERK');

--4. Display the list of employees who are living in 'Boston'.

SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT 
WHERE Location_Id = (SELECT Location_Id FROM LOCATION WHERE City = 'BOSTON'));

--5. Find out the number of employees working in the sales department.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME = 'SALES');


--6. Update the salaries of employees who are working as clerks on the basis of 
--10%.

UPDATE 
EMPLOYEE
SET SALARY = SALARY*10
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE Designation = 'CLERK');


--7. Display the second highest salary drawing employee details.

SELECT * FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE));

--8. List out the employees who earn more than every employee in department 30.

SELECT COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEE FROM EMPLOYEE WHERE SALARY =
ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);

--9. Find out which department has no employees.

SELECT DEPARTMENT_ID FROM EMPLOYEE E WHERE
NOT EXISTS(SELECT DEPARTMENT_ID FROM DEPARTMENT D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID);

--10. Find out the employees who earn greater than the average salary for 
--their department

SELECT * FROM EMPLOYEE E WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = E.DEPARTMENT_ID)