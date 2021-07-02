

CREATE TABLE table_name (
  column datatype constraints
)

-- \d : discribe database
-- \d table : display table info
-- \dt : display all tables
CREATE TABLE person (
  id int,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender VARCHAR(6),
  date_of_birth TIMESTAMP
)

-- better way
CREATE TABLE person (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(6) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(150)
)

DROP TABLE dbname;
