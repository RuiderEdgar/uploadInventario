-------------* product_catalog ---------------

CREATE TABLE brand ( 
  brand_id SERIAL PRIMARY KEY,
  brand_name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE subcategory ( 
  subcategory_id SERIAL PRIMARY KEY,
  subcategory_name VARCHAR(30) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category ( 
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL
  subcategory_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (subcategory_id) REFERENCES product_catalog.subcategory(subcategory_id)
);


CREATE TABLE product (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  barcode INT,
  grammage INT,
  sku INT,
  brand_id INT NOT NULL,
  category_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (brand_id) REFERENCES product_catalog.brand(brand_id)
  FOREIGN KEY (category_id) REFERENCES product_catalog.category(category_id)
);

CREATE TABLE attribute_product (
	attribute_product_id SERIAL PRIMARY KEY,
	attribute_product_name VARCHAR(40) NOT NULL,
  attribute_product_description VARCHAR(50),
  attribute_product_value VARCHAR(10),
  product_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
);
