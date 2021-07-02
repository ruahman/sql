CREATE TABLE car ( 
  id BIGSERIAL NOT NULL PRIMARY KEY,
  make VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  price NUMERIC(19, 2) NOT NULL 
);

CREATE TABLE person ( 
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(7) NOT NULL,
  email VARCHAR(100),
  date_of_birth DATE NOT NULL,
  country_of_birth VARCHAR(50) NOT NULL,
  car_id BIGINT REFERENCES car (id),
  UNIQUE(car_id) -- car can have only one owner, this is how you add constraints in table creation
);

-- INNER JOIN : only return records that match condition of join
SELECT * 
FROM person 
INNER JOIN car ON person.car_id = car.id;

-- LEFT JOIN : all records in person return regardless if match in car table
SELECT *
FROM person 
LEFT JOIN car ON person.car_id = car.id;

-- return only records with no match
SELECT *
FROM person 
LEFT JOIN car ON person.car_id = car.id;
WHERE car.* IS NULL


\copy (SELECT * FROM person) TO '/foo/bar/results.csv' DELIMITER ',' CSV HEADER;

-- if foregn key and primary key have the same name
SELECT * FROM person 
LEFT JOIN car ON USING(car_uid)
