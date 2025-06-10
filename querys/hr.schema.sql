-------------* hr ---------------
-- check: query ejecutado

CREATE TABLE hr.employee (
  employee_id SERIAL PRIMARY KEY,
  hire_date DATE,
  termination_date DATE,
  position VARCHAR(30),
  person_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (person_id) REFERENCES base.person(person_id)
);

CREATE TABLE hr.promoter (
  promoter_id SERIAL PRIMARY KEY,
  promoter_name VARCHAR(30) NOT NULL,
  promoter_type VARCHAR(20) NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id)
);

CREATE TABLE hr.taster (
  taster_id SERIAL PRIMARY KEY,
  title VARCHAR(20) NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id)
);

CREATE TABLE hr.bonus (
  bonus_id SERIAL PRIMARY KEY,
  amount NUMERIC(10, 2) NOT NULL,
  bonus_type VARCHAR(50) NOT NULL,
  employee_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE hr.employee_bonus (
  employee_bonus_id SERIAL PRIMARY KEY,
  employee_id INT NOT NULL,
  bonus_id INT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id),
  FOREIGN KEY (bonus_id) REFERENCES hr.bonus(bonus_id)
);

