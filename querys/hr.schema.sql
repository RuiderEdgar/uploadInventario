-------------* hr ---------------

CREATE TABLE employee (
  employee_id SERIAL PRIMARY KEY,
  hire_date DATE,
  termination_date DATE,
  position VARCHAR(30),
  person_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (person_id) REFERENCES base.person(person_id)
);

CREATE TABLE promoter (
  promoter_id SERIAL PRIMARY KEY,
  promoter_name VARCHAR(30),
  promoter_type VARCHAR(20) NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id)
);

CREATE TABLE taster (
  taster_id SERIAL PRIMARY KEY,
  title VARCHAR(20) NOT NULL,
  employee_id INT NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id)
);

CREATE TABLE bonus (
  bonus_id SERIAL PRIMARY KEY,
  amount NUMERIC(10, 2),
  bonus_type VARCHAR(50),
  employee_id INT,
  date_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE employee_bonus (
  employee_bonus_id SERIAL PRIMARY KEY,
  employee_id INT,
  bonus_id INT,
  FOREIGN KEY (employee_id) REFERENCES hr.employee(employee_id),
  FOREIGN KEY (bonus_id) REFERENCES hr.bonus(bonus_id)
);

