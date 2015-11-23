-- organization.sql

# Remove tables/views if they already exist

DROP TABLE IF EXISTS employees;
DROP VIEW IF EXISTS managers;

CREATE TABLE employees (
  EID int PRIMARY KEY,
    empname varchar(100),
    emptitle varchar(100),
    mgrID int
);

INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(1, 'Lynne Doughtie', 'CEO', NULL);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(2, 'Jefferey LeSage', 'Vice Chair - Tax', 1);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(3, 'Scott Marcello', 'Vice Chair - Audit', 1);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(4, 'Carl Carande', 'Vice Chair - Advisory', 1);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(5, 'MARY LAMB', 'Business Unit Partner in Charge', 2);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(6, 'TINA TURNED', 'Partner in Charge', 2);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(7, 'FAROOD FARGONE', 'Executive Assistant', 2);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(8, 'JOE SOMEBODY', 'Business Unit Partner in Charge', 3);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(9, 'JANE SOMEONE', 'Partner in Charge', 3);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(10, 'STEVE WHOSEIT', 'Executive Assistant', 3);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(11, 'TYLER SOMEHOW', 'Business Unit Partner in Charge', 4);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(12, 'OSCAR SOMETHING', 'Partner in Charge', 4);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(13, 'JESSICA WHATFER', 'Executive Assistant', 4);
INSERT INTO employees(EID, empname, emptitle, mgrID)
VALUES(14, 'JOSHUA WHATFER', 'Executive Assistant', 1);

SELECT *
FROM employees;

CREATE VIEW managers AS
SELECT
empname,
EID
FROM employees;

SELECT
e.empname AS Employee,
m.empname AS Manager
FROM employees AS e
LEFT JOIN
managers AS m
ON e.mgrID = m.EID
ORDER BY m.empname