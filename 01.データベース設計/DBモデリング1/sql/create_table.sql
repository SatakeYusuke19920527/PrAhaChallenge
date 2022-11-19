-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS sushi;

-- CREATE TABLE > レビュー後修正。OrderTypeは無くす方向
-- CREATE TABLE IF NOT EXISTS sushi.OrderType (
--   ot_id int AUTO_INCREMENT NOT NULL, 
--   ot_name varchar(30) NOT NULL, 
--   created_at datetime default current_timestamp,
--   updated_at timestamp default current_timestamp on update current_timestamp,
--   PRIMARY KEY (ot_id)
-- );

CREATE TABLE IF NOT EXISTS sushi.ProductType (
  pt_id int AUTO_INCREMENT NOT NULL, 
  pt_name varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (pt_id)
);

CREATE TABLE IF NOT EXISTS sushi.Price (
  price_id int AUTO_INCREMENT NOT NULL, 
  price int NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (price_id)
);

CREATE TABLE IF NOT EXISTS sushi.Product (
  p_id int AUTO_INCREMENT NOT NULL, 
  p_name varchar(30) NOT NULL, 
  price_id int NOT NULL,
  pt_id int NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (p_id),
  FOREIGN KEY fk_price_id(price_id) REFERENCES Price(price_id),
  FOREIGN KEY fk_pt_id(pt_id) REFERENCES ProductType(pt_id)
);



CREATE TABLE IF NOT EXISTS sushi.Customer (
  c_id int AUTO_INCREMENT NOT NULL, 
  c_name varchar(30) NOT NULL, 
  phonenumber varchar(30) NOT NULL, 
  payment_flag int,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (c_id)
);

CREATE TABLE IF NOT EXISTS sushi.OrderDetails (
  od_id int AUTO_INCREMENT NOT NULL, 
  c_id int NOT NULL, 
  p_id int NOT NULL, 
  amount int NOT NULL,
  sabi_flag varchar(30) NOT NULL, 
  ricesize_flag varchar(30) NOT NULL, 
  ricekind_flag varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (od_id),
  FOREIGN KEY fk_c_id(c_id) REFERENCES Customer(c_id),
  FOREIGN KEY fk_p_id(p_id) REFERENCES Product(p_id)
);

CREATE TABLE IF NOT EXISTS sushi.OrderHistory (
  od_id int NOT NULL, 
  order_date date NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  FOREIGN KEY fk_od_id(od_id) REFERENCES OrderDetails(od_id)
);
