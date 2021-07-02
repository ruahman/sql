SELECT field1, field2, FROM table;

SELECT * FROM person ORDER BY country_of_birth ASC;
SELECT * FROM person ORDER BY country_of_birth DESC;
SELECT * FROM person ORDER BY id, email ASC;

SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth ASC;

SELECT * FROM person WHERE gender='Female';

SELECT 1=1; -- true
SELECT 1<>1; -- false

SELECT * FROM person LIMIT 10;
SELECT * FROM person OFFSET 5 LIMIT 10;
-- official way
SELECT * FROM person OFFSET 5 FETCH FIRST 5 ROW ONLY;

SELECT * FROM person WHERE country_of_birth in ('China','Brazil','France') ORDER BY country_of_birth ASC;

SELECT * FROM person WHERE date_of_birth BETWEEN DATE '1914-01-01' AND '2021-01-01';

SELECT * FROM person WHERE email LIKE '%.com';
SELECT * FROM person WHERE email LIKE '%google%';

-- case insensitive
SELECT * FROM person WHERE country_of_birth ILIKE '%br%';


-- group by : group results by a column
SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth ORDER BY country_of_birth ASC;

-- HAVING : is like WHERE for groups
SELECT country_of_birth
  , COUNT(*) 
FROM person 
GROUP BY country_of_birth 
HAVING COUNT(*) > 5  -- HAVING is like WHERE for groups
ORDER BY country_of_birth ASC;



SELECT MAX(price) FROM car; 
SELECT MIN(price) FROM car; 
SELECT AVG(price) FROM car; 
SELECT ROUND(AVG(price)) FROM car; 

SELECT make, model, MIN(price) FROM car GROUP BY make, model;
SELECT make, model, MAX(price) FROM car GROUP BY make, model;

SELECT SUM(price) FROM car;

SELECT make, SUM(price) FROM car GROUP BY make;

SELECT 10 + 2;
SELECT 10 + 2 AS foobar;

SELECT id, make, model, price, ROUND(price * 0.10, 2) AS ten_percent from car;

SELECT COALESCE(null, 1) AS number;

SELECT COALESCE(email,'email not found') AS email  FROM person;

SELECT 10 / NULLIF(2, 0);

SELECT 10 / NULLIF(0, 0);

SELECT NOW();

SELECT NOW()::DATE;

SELECT NOW()::TIME;

SELECT NOW() - INTERVAL '1 YEAR';

SELECT EXTRACT(YEAR FROM NOW());

SELECT id, first_name, last_name, gender, date_of_birth, AGE(NOW(), date_of_birth) FROM person;




ALTER TABLE person DROP CONSTRAINT person_pkey;


ALTER TABLE person ADD PRIMARY KEY (id);

DELETE FROM person WHERE id=666;

ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE(email);

ALTER TABLE person ADD CONSTRAINT gender_constraint CHECK(gender = 'Female' or gender = 'Male');


-- deletes everything
DELETE FROM person;

UPDATE person SET email = 'dego_vila@yahoo.com'; -- updates every column

UPDATE person SET email = 'dego_vila@yahoo.com' WHERE id = 2011;


UPDATE person SET email = 'dego_vila@yahoo.com' WHERE id = 2011 
ON CONFLICT (id) DO NOTHING;  -- incase of conflict with id do nothing
