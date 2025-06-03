-------------* sales_inventories ---------------

CREATE TABLE sale (
  sale_id SERIAL PRIMARY KEY,
  amount_money NUMERIC(10, 2),
  amount_units NUMERIC(10, 2),
  product_id INT NOT NULL,
  contact_point_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (product_id, contact_point_id, sale_date_id, amount_units),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE contact_point_inventory (
  contact_point_inventory_id SERIAL PRIMARY KEY,
  contact_point_inventory NUMERIC(10, 2),
  transit_inventory NUMERIC(10, 2),
  cedis_inventory NUMERIC(10, 2),
  order_inventory NUMERIC(10, 2),
  product_id INT NOT NULL,
  contact_point_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (product_id, contact_point_id, inventory_date_id, on_hand_inventory),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(person_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id) 
);

CREATE TABLE warehouse_inventory (
  warehouse_inventory_id SERIAL PRIMARY KEY,
  inventory_quantity INT,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (product_id, warehouse_id, inventory_date_id, inventory_quantity),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id),
  FOREIGN KEY (warehouse_id) REFERENCES routes_logistics.warehouse(warehouse_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE purchase_order (
  purchase_order_id SERIAL PRIMARY KEY,
  order_number INT NOT NULL,
  quantity_ordered_cases INT,
  contact_point_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (order_number, product_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id)
);

CREATE TABLE purchase_order_status_history (
  purchase_order_history_id SERIAL PRIMARY KEY,
  status VARCHAR(12) NOT NULL,
  comment VARCHAR(100),
  purchase_order_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (purchase_order_id) REFERENCES sales_storages.purchase_order(purchase_order_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE purchase_order_product (
  purchase_order_product_id SERIAL PRIMARY KEY,
  purchase_order_id INT NOT NULL,
  product_id INT NOT NULL,
  FOREIGN KEY (purchase_order_id) REFERENCES sales_storages.purchase_order(purchase_order_id),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
);