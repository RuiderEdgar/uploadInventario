-------------* commercial_structure ---------------

CREATE TABLE commercial_channel ( 
  commercial_channel_id SERIAL PRIMARY KEY,
  coomercial_channel_name VARCHAR(30) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE commercial_platform ( 
  commercial_platform_id SERIAL PRIMARY KEY,
  commercial_platform_name VARCHAR(30) NOT NULL,
  commercial_channel_id INT,
  person_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (commercial_channel_id) REFERENCES commercial_structure.commercial_channel(commercial_channel_id),
  FOREIGN KEY (person_id) REFERENCES base.person(person_id)
);

CREATE TABLE format (
  format_id SERIAL PRIMARY KEY,
  format_name VARCHAR(30) NOT NULL,
  commercial_channel_id INT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (commercial_channel_id, format_name),
  FOREIGN KEY (	commercial_channel_id) REFERENCES commercial_structure.commercial_channel(commercial_channel_id)
);

CREATE TABLE contact_point ( 
  contact_point_id SERIAL PRIMARY KEY,
  contact_point_name VARCHAR(50) NOT NULL,
  contact_point_number VARCHAR(50) NOT NULL,
  web_adress VARCHAR(255)
  colony_id INT,
  commercial_platform_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (colony_id) REFERENCES base.colony(colony_id),
  FOREIGN KEY (commercial_platform_id) REFERENCES commercial_structure.commercial_platform (commercial_platform_id)
);

CREATE TABLE contact_point_attribute (
  contact_point_attribute_id SERIAL PRIMARY KEY, 
  attribute_name VARCHAR(50) NOT NULL,
  attribute_description VARCHAR(50), 
  attribute_value VARCHAR(20),
  contact_point_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id)
);
