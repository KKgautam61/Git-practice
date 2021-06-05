
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

#SELECT THE LAST NAME OF ALL EMPLOYEES
SELECT LASTNAME
FROM EMPLOYEES;
#SELECT THE LAST NAME OF ALL EMPLOYEES ORDERED ALPHABETICALLY
SELECT LASTNAME
FROM EMPLOYEES
ORDER BY LASTNAME ;

#SELECT THE LAST NAME OF ALL EMPLOYEES ORDERED ALPHABETICALLY WITHOUT DUPLICATES
SELECT distinct LASTNAME
FROM EMPLOYEES
ORDER BY LASTNAME ;

SELECT LASTNAME
FROM EMPLOYEES
GROUP BY LASTNAME
ORDER BY LASTNAME ;

#Select all the data of employees whose last name is "Smith"
SELECT *
FROM EMPLOYEES
WHERE LASTNAME = "SMITH";

#Select all the data of employees whose last name is "Smith" or "Doe"
SELECT *
FROM EMPLOYEES
WHERE LASTNAME IN ("SMITH", "DOE");

#Select all the data of employees that work in department 14
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT = 14;

#Select LASTNAME AND SSN of employees that work in department 37 or department 77

SELECT LASTNAME, SSN
FROM EMPLOYEES
WHERE DEPARTMENT IN (37,77);

#Select all the data of employees whose last name begins with an "S"
SELECT *
FROM EMPLOYEES
WHERE LASTNAME LIKE "S%";

#Select the sum of all the departments' budgets and add the currency USD
SELECT concat(SUM(BUDGET), " ", "USD") Total
FROM DEPARTMENTS ; 

#Select the number of employees in each department (you only need to show the department code and the number of employees)
SELECT DEPARTMENT, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT;

#Select all the data of employees, including each employee's department's data
SELECT *
FROM DEPARTMENTS D JOIN EMPLOYEES E
WHERE D.CODE=E.DEPARTMENT;

#Select the name and last name of each employee, along with the name and budget of the employee's department
SELECT E.NAME AS FIRSTNAME, E.LASTNAME AS LASTNAME, D.NAME AS DEPARTMENT, D.BUDGET AS BUDGET
FROM EMPLOYEES E JOIN DEPARTMENTS D
WHERE E.DEPARTMENT=D.CODE;

#Select the name and last name of employees working for departments with a budget greater than $60,000
SELECT E.NAME AS FIRSTNAME, E.LASTNAME AS LASTNAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
WHERE E.DEPARTMENT=D.CODE
AND D.BUDGET>=60000;

#Select the departments with a budget larger than the average budget of all the departments.
SELECT NAME
FROM DEPARTMENTS
WHERE BUDGET > (SELECT AVG(BUDGET) FROM DEPARTMENTS);


#Select the names of departments with more than two employees
SELECT DEPARTMENT
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING COUNT(*)>2;


#Select the name and last name of employees working for departments with second lowest budget

SELECT NAME, LASTNAME
FROM EMPLOYEES
WHERE DEPARTMENT = (SELECT TEMP.CODE FROM (SELECT * FROM DEPARTMENTS ORDER BY BUDGET LIMIT 2) AS TEMP
ORDER BY TEMP.BUDGET DESC LIMIT 1);








