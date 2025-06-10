-------------* sales_storages ---------------
-- check: query ejecutado


CREATE TABLE sales_storages.sale (
  sale_id SERIAL PRIMARY KEY,
  amount_money NUMERIC(10, 2),
  amount_units NUMERIC(10, 2),
  product_id INT NOT NULL,
  contact_point_id INT NOT NULL,
  date_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (product_id, contact_point_id, date_id, amount_units),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);


CREATE TABLE sales_storages.purchase_order (
  purchase_order_id SERIAL PRIMARY KEY,
  order_number INT NOT NULL, --checar constrains con ordered_quantity no sea < 0
  quantity_ordered_cases INT,
  ordered_quantity INT,
  contact_point_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (order_number),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id)
);

CREATE TABLE sales_storages.purchase_order_status_history (
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

CREATE TABLE sales_storages.purchase_order_product (
  purchase_order_product_id SERIAL PRIMARY KEY,
  purchase_order_id INT NOT NULL,
  product_id INT NOT NULL,
  FOREIGN KEY (purchase_order_id) REFERENCES sales_storages.purchase_order(purchase_order_id),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
);

CREATE TABLE sales_storages.inventory (
  inventory_id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  
  -- solo una de estas dos FK será no nula
  warehouse_id INT NULL,
  contact_point_id INT NULL,
  
  -- Campos
  cost_amount NUMERIC(10,2) NULL,
  available_inventory NUMERIC(10,2) NOT NULL DEFAULT 0,
  transit_inventory NUMERIC(10,2) DEFAULT 0, -- Solo aplica para puntos de contacto
  order_inventory NUMERIC(10,2) DEFAULT 0,   -- Solo aplica para puntos de contacto
  cedis_inventory NUMERIC(10,2) DEFAULT 0,   -- Solo aplica para puntos de contacto

  date_id INT NOT NULL,
  createDate TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modifiedDate TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
      
  -- constraints
  CONSTRAINT chk_valid_location CHECK (
    (warehouse_id IS NOT NULL AND contact_point_id IS NULL) OR
    (warehouse_id IS NULL AND contact_point_id IS NOT NULL)
  ),
  CONSTRAINT unique_product_location_date UNIQUE (product_id, warehouse_id, contact_point_id, date_id),

  --FK
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id),
  FOREIGN KEY (warehouse_id) REFERENCES routes_logistics.warehouse(warehouse_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);