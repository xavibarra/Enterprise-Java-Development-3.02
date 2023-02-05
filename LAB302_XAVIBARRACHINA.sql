DROP SCHEMA IF EXISTS lab302;
CREATE SCHEMA lab302; 
USE lab302;

-- Exercise 1
CREATE TABLE blog(
	id INT NOT NULL AUTO_INCREMENT,
    blog_author VARCHAR(255),
    PRIMARY KEY(id)
);
INSERT INTO blog (blog_author) VALUES
	( 'Maria Charlotte'),
	('Juan Perez'),
	('Maria Charlotte'),
	('Maria Charlotte'),
	('Juan Perez'),
	('Maria Charlotte'),
	('Gemma Alcocer');
CREATE TABLE statistics(
	id INT NOT NULL AUTO_INCREMENT,
    blog_title VARCHAR(255),
    word_count INT,
    views INT,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES blog(id)
);
INSERT INTO statistics (blog_title, word_count, views) VALUES
	('Best Paint Colors', 814, 14),
	('Small Space Decorating Tips',1146, 221),
	('Hot Accessories', 986, 105),
	('Mixing Textures',765, 22),
	('Kitchen Refresh',1242, 307),
	('Homemade Art Hacks', 1002, 193),
	('Refinishing Wood Floors',1571, 7542);
SELECT * FROM blog;
SELECT * FROM statistics;

-- Exercise 2

CREATE TABLE customer(
	customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(255),
    total_customer_mileage INT,
    PRIMARY KEY(customer_name)
);
INSERT INTO customer (customer_name, customer_status, total_customer_mileage) VALUES
	('Agustine Riviera', 'Silver',115235),
	('Alaina Sepulvida','none', 6008),
	('Tom Jones', 'Gold', 205767),
	('Sam Rio','none', 2653),
	('Jessica James','Silver', 127656),
	('Ana Janco', 'Silver', 136773),
	('Jennifer Cortez','Gold', 300582),
    ('Christian Janco','Silver', 14642);
CREATE TABLE aircrafts (
	aircraft_name VARCHAR(255),
    total_seats INT,
    PRIMARY KEY (aircraft_name)
);
INSERT INTO aircrafts VALUES
	('Boeing-747', 400),
	('Boeing-777', 264),
	('Airbus-A330', 236);
CREATE TABLE fligths (
	flight_number VARCHAR(5),
    aircraft_name VARCHAR(255),
    flight_mileage INT,
    PRIMARY KEY (flight_number),
    FOREIGN KEY(aircraft_name) REFERENCES aircrafts(aircraft_name)
);
INSERT INTO fligths VALUES
	('DL143', 'Boeing-747', 135),
	('DL122', 'Airbus-A330', 4370),
	('DL53', 'Boeing-777', 2078),
	('DL222', 'Boeing-777', 1765),
	('DL37', 'Boeing-747', 531);
CREATE TABLE airline (
	id INT NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(5),
    customer_name VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (flight_number) REFERENCES fligths(flight_number),
    FOREIGN KEY (customer_name) REFERENCES customer(customer_name)
);
INSERT INTO airline (flight_number, customer_name) VALUES 
	('DL143', "Agustine Riviera"),
	('DL122', "Agustine Riviera"),
	('DL122', "Alaina Sepulvida"),
	('DL122', "Tom Jones"),
	('DL53', "Tom Jones"),
	('DL143', "Sam Rio"),
	('DL222', "Tom Jones"),
	('DL143', "Jessica James"),
	('DL222', "Ana Janco"),
	('DL222', "Jennifer Cortez"),
	('DL122', "Jessica James"),
	('DL37', "Sam Rio"),
	('DL222', "Christian Janco");
SELECT * FROM customer;
SELECT * FROM aircrafts;
SELECT * FROM fligths;
SELECT * FROM airline;

-- EXERCISE 3

SELECT COUNT(*) FROM fligths; 

-- EXERCISE 4

SELECT AVG(flight_mileage) FROM fligths;

-- EXERCISE 5

SELECT AVG(total_seats) FROM aircrafts;

-- EXERCISE 6

SELECT customer_status, AVG(total_customer_mileage) FROM customer GROUP BY (customer_status); 

-- EXERCISE 7

SELECT customer_status, MAX(total_customer_mileage) FROM customer GROUP BY (customer_status); 

-- EXERCISE 8

SELECT COUNT(*) FROM fligths WHERE aircraft_name LIKE 'Boeing%';

-- EXERCISE 9

SELECT flight_number FROM fligths WHERE flight_mileage BETWEEN 300 AND 2000;

-- EXERCISE 10

SELECT c.customer_status, AVG(f.flight_mileage) FROM airline cf
INNER JOIN fligths f ON cf.flight_number = f.flight_number
INNER JOIN customer c ON cf.customer_name = c.customer_name
GROUP BY c.customer_status;
-- EXERCISE 11

SELECT c.customer_status, a.aircraft_name, count(*) FROM airline cf
INNER JOIN fligths f ON cf.flight_number = f.flight_number
INNER JOIN customer c ON cf.customer_name = c.customer_name
INNER JOIN aircrafts a ON a.aircraft_name = f.aircraft_name
WHERE c.customer_status = 'Gold'
GROUP BY aircraft_name;






