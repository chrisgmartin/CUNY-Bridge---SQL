-- BuildingEnergy.sql

DROP TABLE IF EXISTS EnergyTypes;
DROP TABLE IF EXISTS Buildings;
DROP VIEW IF EXISTS BigEnergy;
DROP TABLE IF EXISTS EnergyCategories;
DROP VIEW IF EXISTS Energies;

CREATE TABLE EnergyCategories (
    CID INT PRIMARY KEY,
    category VARCHAR(100)
);

INSERT INTO EnergyCategories(CID, category)
VALUES(1, 'Fossil');
INSERT INTO EnergyCategories(CID, category)
VALUES(2, 'Renewable');

CREATE TABLE EnergyTypes (
  TID int,
    type_name varchar(100),
    CID int
);

INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(1, 'Electricity', 1);
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(2, 'Gas', 1);
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(3, 'Steam', 1);
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(4, 'Fuel Oil', 1);
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(5, 'Solar', 2);
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(6, 'Wind', 2);


SELECT *
FROM EnergyCategories;

SELECT *
FROM EnergyTypes;

SELECT
EC.category AS Category,
ET.type_name AS Type
FROM EnergyCategories AS EC
LEFT JOIN EnergyTypes AS ET
ON EC.CID = ET.CID;


CREATE TABLE Buildings (
  BID int PRIMARY KEY,
    building varchar(100),
    TID int
);

INSERT INTO Buildings(BID, building, TID)
VALUES(1, 'Borough of Manhattan Community College', 5);
INSERT INTO Buildings(BID, building, TID)
VALUES(2, 'Borough of Manhattan Community College', 1);
INSERT INTO Buildings(BID, building, TID)
VALUES(3, 'Borough of Manhattan Community College', 3);
INSERT INTO Buildings(BID, building, TID)
VALUES(4, 'Crysler Building', 3);
INSERT INTO Buildings(BID, building, TID)
VALUES(5, 'Crysler Building', 1);
INSERT INTO Buildings(BID, building, TID)
VALUES(6, 'Empire State Building', 1);
INSERT INTO Buildings(BID, building, TID)
VALUES(7, 'Empire State Building', 3);
INSERT INTO Buildings(BID, building, TID)
VALUES(8, 'Empire State Building', 2);

#Adding new rows
INSERT INTO EnergyTypes(TID, type_name, CID)
VALUES(7, 'Geothermal', 2);
INSERT INTO Buildings(BID, building, TID)
VALUES(9, 'Bronx Lion House', 7);
INSERT INTO Buildings(BID, building, TID)
VALUES(10, 'Brooklyn Childrens Museum', 1);
INSERT INTO Buildings(BID, building, TID)
VALUES(11, 'Brooklyn Childrens Museum', 7);

SELECT *
FROM Buildings;

SELECT
b.building AS Building,
e.type_name AS 'Energy Tyoe',
c.category AS 'Energy Category'
FROM Buildings b
LEFT JOIN EnergyTypes e
ON b.TID = e.TID
LEFT JOIN EnergyCategories c
ON e.CID = c.CID
WHERE c.category = 'Renewable';



CREATE VIEW BigEnergy AS
SELECT
b.BID,
b.building,
e.TID,
e.type_name,
c.CID,
c.category
FROM Buildings b
LEFT JOIN EnergyTypes e
ON b.TID = e.TID
LEFT JOIN EnergyCategories c
ON e.CID = c.CID;

SELECT *
FROM BigEnergy;

SELECT
type_name AS Type,
COUNT(type_name) AS Frequency
FROM BigEnergy
GROUP BY type_name
ORDER BY Frequency DESC;


#9a
ALTER TABLE EnergyTypes
ADD FOREIGN KEY (CID)
REFERENCES EnergyCategories(CID);

SELECT *
FROM EnergyTypes;