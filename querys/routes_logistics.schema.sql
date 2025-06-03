-------------* routes_logistics ---------------

CREATE TABLE route ( 
  route_number INT PRIMARY KEY, --No es serial
  route_name VARCHAR(30) NOT NULL,
  status BOOLEAN,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  UNIQUE (route_number, route_name)
);

CREATE TABLE route_contact_point (
  route_contact_point_id SERIAL PRIMARY KEY,
  route_id INT NOT NULL, 
  contact_point_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (route_id, contact_point_id)
  FOREIGN KEY (route_id) REFERENCES routes_logistics.route(route_number)
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id)
);

CREATE TABLE warehouse (
  warehouse_id SERIAL PRIMARY KEY,
  warehouse_name VARCHAR(30) NOT NULL,
  warehouse_number INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (warehouse_number, warehouse_name)
);

