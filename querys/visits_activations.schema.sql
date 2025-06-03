-------------* visits_exhibitions ---------------

CREATE TABLE visit_type (
  visit_type_id SERIAL PRIMARY KEY, 
  visit_type_name VARCHAR(30) NOT NULL,
  visit_type_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE visit (
  visit_id SERIAL PRIMARY KEY,
  visit_completed BOOLEAN NOT NULL,
  date_id INT NOT NULL,
  visit_type_id INT,
  route_contact_point_id INT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (date_id, route_contact_point_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id),
  FOREIGN KEY (visit_type_id) REFERENCES visits_exhibitions.visit_type(visit_type_id)
);

CREATE TABLE survey (
  survey_id SERIAL PRIMARY KEY,
  survey_completed BOOLEAN NOT NULL,
  visit_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (visit_id) REFERENCES visits_exhibitions.visit(visit_id)
);

CREATE TABLE photo_evidence (
  photo_evidence_id SERIAL PRIMARY KEY,
  photo_url VARCHAR(255) NOT NULL,
  rating INT NOT NULL CHECK (rating > 0 AND rating < 10),
  exhibition_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exhibition_incident_type (
  exhibition_incident_type_id SERIAL PRIMARY KEY,
  incident_type_name VARCHAR(30) NOT NULL,
  incident_type_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE visit_type (
  visit_type_id SERIAL PRIMARY KEY,
  visit_type_name VARCHAR(30) NOT NULL,
  visit_type_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exhibition_type (
  exhibition_type_id SERIAL PRIMARY KEY,
  exhibition_type_name VARCHAR(30) NOT NULL,
  exhibition_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shelf_type (
  shelf_type_id SERIAL PRIMARY KEY,
  shelf_name VARCHAR(30) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exhibition (
  exhibition_id SERIAL PRIMARY KEY,
  product_status VARCHAR(30) NOT NULL,
  fronts INT, 
  shelf_inventory INT,
  follow_up VARCHAR(100),
  comments VARCHAR(100),
  exhibition_incident_type_id INT,
  visit_id INT,
  shelf_type_id INT, 
  exhibition_type_id INT,
  product_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (visit_id, product_id),
  FOREIGN KEY (exhibition_incident_type_id) REFERENCES visits_exhibitions.exhibition_incident_type(exhibition_incident_type_id),
  FOREIGN KEY (visit_id) REFERENCES visits_exhibitions.visit(visit_id),
  FOREIGN KEY (shelf_type_id) REFERENCES visits_exhibitions.shelf_type(shelf_type_id),
  FOREIGN KEY (exhibition_type_id) REFERENCES visits_exhibitions.exhibition_type(exhibition_type_id),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
);

