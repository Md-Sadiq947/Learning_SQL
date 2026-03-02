INSERT into person(first_name, last_name, gender, date_of_birth, email, country_of_birth)
VALUES('syed', 'saad', 'male', '2011-09-19', 'hamza@gmail.com', 'germany'); 

--SELECT * FROM person;
--SELECT * FROM person ORDER BY country_of_birth; 

SELECT * FROM person WHERE gender = 'Male' AND (country_of_birth = 'Indonesia' OR country_of_birth = 'Germany' OR gender = 'Non-binary');

-- SELECT * FROM person OFFSET 10 FETCH FIRST ROW ONLY; 

SELECT * FROM person WHERE country_of_birth = 'Germany' OR country_of_birth = 'France' OR country_of_birth = 'Indonesia';
SELECT * FROM person WHERE country_of_birth IN ('Germany', 'France', 'Indonesia') ORDER BY country_of_birth; -- IN operator takes array

SELECT * FROM person WHERE email LIKE '%.com';
SELECT * FROM person WHERE country_of_birth ILIKE 'G%';

SELECT DISTINCT country_of_birth FROM person;
SELECT DISTINCT country_of_birth FROM person GROUP BY country_of_birth;
SELECT DISTINCT country_of_birth, COUNT(*)  FROM person GROUP BY country_of_birth;
SELECT DISTINCT country_of_birth, COUNT(*)  FROM person GROUP BY country_of_birth ORDER BY country_of_birth;

SELECT * FROM car;

SELECT AVG(price) FROM car;
--using aggregate functions 

SELECT ROUND(AVG(price)) FROM car;


SELECT ROUND(AVG(price)) FROM car;

SELECT make, MAX(price) FROM car GROUP BY make; SELECT make, MIN(price) FROM car GROUP BY make; SELECT make, AVG(price) FROM car GROUP BY make;


-- USING ARITHMETIC 

SELECT id, make, model, price, ROUND((price * .10),2), ROUND((price -  price *.10),2) FROM car;

--Alias 
--HELPS IN RENAMING THE COLUMN NAME

-- Coalesce is used to deal with the NULL SETS  

SELECT COALESCE(email, 'Email is not given')FROM person;


--time stamps 


--primary keys are used to uniquely identify the records in table
-- to remove the PRIMARY KEY 
ALTER TABLE person DROP CONSTRAINT person_pkey;

--to add the primary key 
ALTER TABLE person ADD PRIMARY KEY (id) -- you can pass multiple values in the paranthesis 

-- to add the unique constraints 
ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE(email); -- constraint name is given by user
ALTER TABLE person ADD  UNIQUE(email); -- constraint name is given by the postgres

--CHECK CONSTRAINT USING THE 'CHECK' keyword

ALTER TABLE person ADD CONSTRAINT two_gender CHECK(gender = 'Male' OR gender = 'Female');


--Delete table 
DELETE FROM person WHERE id = 1; -- it is better to use the primary key as a statement in where clause

-- Updating the Records

UPDATE person SET email = 'jord@192outlook.com' WHERE id = 2;
UPDATE person SET first_name = 'khalid', last_name = 'mirza' WHERE id = 2; -- it is good record to use UPDATE and DELETE command followed by WHERE  

--ON CONFLICT DO NOTHING
INSERT INTO person(id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES(11, 'Clarabelle', 'Burrow', 'cburrow@google.de', 'Female', DATE '2024-12-20', 'Brazil')
ON CONFLICT(id) DO NOTHING;

--ON CONFLICT updating the records
                                                      
INSERT INTO person(id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES(11, 'Clarabelle', 'Burrow', 'cburrow@google.de.uk', 'Male', DATE '2024-12-20', 'Brazil')
ON CONFLICT(id) DO UPDATE SET email = EXCLUDED.email, gender = EXCLUDED.gender;
--EXCLUDED.email corresponds to the values to be inserted 



