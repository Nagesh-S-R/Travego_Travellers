-- CREATE DATABASE projects;
-- USE projects;

-- Creating table Passenger
CREATE TABLE PASSENGER(
    Passenger_id INT PRIMARY KEY,
    Passenger_name TEXT,
    Category TEXT,
    Gender TEXT,
    Boarding_City TEXT,
    Destination_City  TEXT,
    Distance INT,
    Bus_Type TEXT,
    FOREIGN KEY (Passenger_id) REFERENCES PRICE(id)
);


-- Creating Table Price
CREATE TABLE PRICE(
    id INT PRIMARY KEY,
    Bus_Type TEXT,
    Distance INT,
    Price INT
);

-- insert values to passsenger table 
INSERT INTO PASSENGER VALUES
(1, 'Sejal', 'AC', 'F', 	'Bengaluru', 'Chennai',	 350, 'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad',	 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 	'Panaji', 'Bengaluru',	 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 	'Chennai', 'Mumbai', 	1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 	'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 	'Nagpur', 'Hyderabad',	 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 	'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 	'Pune', 'Nagpur',		 700, 'Sitting');

-- insert values to Price table
INSERT INTO PRICE VALUES
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 1240),
(12, 'Sitting', 1200, 488),
(13, 'Sitting', 1500, 1860);

-- Count of Female Passengers Traveling a Minimum Distance
SELECT gender, 
	   COUNT(*) AS `count`
FROM passenger
WHERE gender = 'F' AND distance >= 600;

-- Passenger Details for Long-Distance Sleeper Bus Travel
SELECT p1.distance, 
	   p2.passenger_name, 
       p1.bus_type, 
       p1.price
FROM price p1
JOIN passenger p2 ON P1.Distance = P2.Distance
WHERE p2.Passenger_name = 'pallavi';

-- Select Passengers with Names Starting with 'S'
SELECT Passenger_name
FROM PASSENGER
WHERE Passenger_name LIKE 'S%'
ORDER BY Passenger_name;

-- Calculate Price Charged for Each Passenger
SELECT P1.Passenger_name, 
       P1.Boarding_City, 
       P1.Destination_City, 
       P1.Bus_Type, 
       P2.Price
FROM PASSENGER P1  JOIN PRICE P2 ON P1.Bus_Type = P2.Bus_Type AND
P1.Distance = p2.Distance;

-- extract the passenger name(s) and the ticket price for those who traveled 700 KMs Sitting in a bus?
SELECT P1.Passenger_name,
	   P2.Price 
FROM PASSENGER P1 
JOIN PRICE P2 ON  P1.Bus_Type = P2.Bus_Type 
AND P1.Distance = P2.Distance
WHERE P1.Distance  = 700 and P1.Bus_type = 'Sitting';

-- calculate the bus fare for a passenger named 'Pallavi' traveling from Panaji to Bangalore . 
SELECT PR.Distance, 
	   PA.Passenger_name, 
       PR.Bus_Type, 
       PR.Price 
FROM PASSENGER PA INNER JOIN PRICE PR
ON PA.Distance = PR.Distance
WHERE PA.Passenger_name = 'Pallavi';

-- Update Bus Category to Non-Ac Based on Bus Type sleeper
UPDATE PASSENGER 
SET Category = 'Non-AC'
WHERE bus_type = 'Sleeper';

SELECT * FROM passenger;

-- Delete Passenger Name  Piyush from table along with using Transactional commands
START TRANSACTION;
DELETE FROM PASSENGER WHERE Passenger_name = 'Piyush';
COMMIT;

-- Truncate Table 
TRUNCATE passenger;

-- Drop Table From DataBase
DROP TABLE passenger;