-------------* engagement_marketing ---------------


CREATE TABLE prize (
  prize_id SERIAL PRIMARY KEY,
  gift_name VARCHAR(20) NOT NULL,
  gift_description VARCHAR(30),
  activation_id INT,
  participant_id INT,
  date_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (activation_id, gift_name, winning_participant_id, date_id),
  FOREIGN KEY (activation_id) REFERENCES engagement_marketing.activation(activation_id)
  FOREIGN KEY (participant_id) REFERENCES engagement_marketing.participant(participant_id)
  FOREIGN KEY (date_id) REFERENCES base.date(date_id)
);

CREATE TABLE participant_activation (
  participant_activation_id SERIAL PRIMARY KEY,
  winner BOOLEAN,
  person_id INT,
  activation_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (person_id, activation_id),
  FOREIGN KEY (person_id) REFERENCES base.person(person_id),
  FOREIGN KEY (activation_id) REFERENCES engagement_marketing.activation(activation_id)
);

CREATE TABLE promotion_type (
  promotion_type_id SERIAL PRIMARY KEY,
  promotion_type_name VARCHAR(30) NOT NULL, 
  promotion_type_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE promotion (
  promotion_id SERIAL PRIMARY KEY,
  promotion_name VARCHAR(30) NOT NULL, 
  promotion_code VARCHAR(18) NOT NULL, 
  duration_days INT,
  date_id INT NOT NULL,
  promotion_type_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (promotion_name, date_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id),
  FOREIGN KEY (promotion_type_id) REFERENCES engagement_marketing.promotion_type(promotion_type_id)
);

CREATE TABLE activition_type (
  activation_type_id SERIAL PRIMARY KEY,
  activation_type_name VARCHAR(30) NOT NULL, 
  activation_type_description VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activation (
  activation_id SERIAL PRIMARY KEY,
  activation_name VARCHAR(30) NOT NULL,
  activation_description VARCHAR(50),
  date_id INT NOT NULL,
  activation_type_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (activation_name, date_id),
  FOREIGN KEY (date_id) REFERENCES base.date(date_id),
  FOREIGN KEY (activation_type_id) REFERENCES engagement_marketing.activition_type(activation_type_id)
);

CREATE TABLE promotion_promoter (
  promotion_promoter_id SERIAL PRIMARY KEY,
  promotion_id INT,
  promoter_id INT,
  FOREIGN KEY (promotion_id) REFERENCES engagement_marketing.promotion(promotion_id),
  FOREIGN KEY (promoter_id) REFERENCES hr.promoter(promoter_id)
)

CREATE TABLE activation_product (
  activation_product_id SERIAL PRIMARY KEY,
  activation_id INT,
  product_id INT,
  FOREIGN KEY (activation_id) REFERENCES engagement_marketing.activation(activation_id),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
)

CREATE TABLE promotion_contact_point (
  promotion_contact_point_id SERIAL PRIMARY KEY,
  promotion_id INT,
  contact_point_id INT,
  FOREIGN KEY (promotion_id) REFERENCES engagement_marketing.promotion(promotion_id),
  FOREIGN KEY (contact_point_id) REFERENCES commercial_structure.contact_point(contact_point_id)
)

CREATE TABLE promotion_product (
  promotion_product_id SERIAL PRIMARY KEY,
  promotion_id INT,
  product_id INT,
  FOREIGN KEY (promotion_id) REFERENCES engagement_marketing.promotion(promotion_id),
  FOREIGN KEY (product_id) REFERENCES product_catalog.product(product_id)
)

