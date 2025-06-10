-------------* base ---------------
-- check: query ejecutado

CREATE TABLE base.date (
  date_id SERIAL PRIMARY KEY,
  date_actual DATE NOT NULL UNIQUE,
  day_number INT NOT NULL,
  month_number INT NOT NULL,
  year_number INT NOT NULL,
  day_name VARCHAR(10) NOT NULL,
  month_name VARCHAR(10) NOT NULL,
  week_year INT NOT NULL,
  walmart_weeks INT NOT NULL,
  day_of_year INT NOT NULL,
  bimester_of_year INT NOT NULL,
  quarter_of_year INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE base.country (
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(30) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE base.state (
  state_id SERIAL PRIMARY KEY,
  state_name VARCHAR(25) NOT NULL UNIQUE,
  country_id INT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (country_id) REFERENCES base.country(country_id)
);

CREATE TABLE base.municipality (
  municipality_id SERIAL PRIMARY KEY,
  municipality_name VARCHAR(45) NOT NULL,
  state_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (state_id, municipality_name),
  FOREIGN KEY (state_id) REFERENCES base.state(state_id)
);

CREATE TABLE base.postal_code (
  postal_code_id SERIAL PRIMARY KEY,
  postal_code VARCHAR(10) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE base.colony (
  colony_id SERIAL PRIMARY KEY,
  colony_name VARCHAR(45) NOT NULL,
  municipality_id INT, 
  postal_code_id INT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (municipality_id, postal_code_id),
  FOREIGN KEY (municipality_id) REFERENCES base.municipality(municipality_id),
  FOREIGN KEY (postal_code_id) REFERENCES base.postal_code(postal_code_id)
);

CREATE TABLE base.person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  middle_name VARCHAR(20),
  last_name_paternal VARCHAR(20) NOT NULL,
  last_name_maternal VARCHAR(20),
  birth_date DATE NOT NULL,
  curp VARCHAR(18) NOT NULL UNIQUE,
  phone_number VARCHAR(15),
  type_person VARCHAR(20) NOT NULL, -- añadir constrain para curp null o not null
  colony_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (colony_id) REFERENCES base.colony(colony_id)
);

-- TODO: añadir constrain para curp null o not null para type_person en person