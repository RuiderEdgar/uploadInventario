-------------* product_catalog ---------------
-- check: query ejecutado


CREATE TABLE product_catalog.product_brand ( 
  product_brand_id SERIAL PRIMARY KEY,
  brand_name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_catalog.product_category ( 
  product_category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL,
  subcategory_id INT REFERENCES product_catalog.product_category(product_category_id),
  category_level INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_catalog.product (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  barcode INT,
  grammage INT,
  sku INT,
  product_brand_id INT NOT NULL,
  product_category_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_brand_id) REFERENCES product_catalog.product_brand(product_brand_id),
  FOREIGN KEY (product_category_id) REFERENCES product_catalog.product_category(product_category_id)
);

CREATE TABLE product_catalog.attribute_product (
	attribute_product_id SERIAL PRIMARY KEY,
	attribute_product_name VARCHAR(40) NOT NULL,
  attribute_product_description VARCHAR(50),
  attribute_product_value VARCHAR(10),
  product_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
);
