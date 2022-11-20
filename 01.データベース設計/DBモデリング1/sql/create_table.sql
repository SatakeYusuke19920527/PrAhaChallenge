-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS sushi;

CREATE TABLE IF NOT EXISTS sushi.ProductType (
  pt_id int AUTO_INCREMENT NOT NULL, 
  pt_name varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (pt_id)
);

CREATE TABLE IF NOT EXISTS sushi.Product (
  p_id int AUTO_INCREMENT NOT NULL, 
  p_name varchar(30) NOT NULL, 
  price int NOT NULL,
  pt_id int NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (p_id),
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

CREATE TABLE IF NOT EXISTS sushi.Order (
  od_id int AUTO_INCREMENT NOT NULL, 
  order_date date NOT NULL,
  c_id int NOT NULL, 
  isPaid boolean NOT NULL,
  totalAmount int NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (od_id),
  FOREIGN KEY fk_c_id(c_id) REFERENCES sushi.Customer(c_id)
);

CREATE TABLE IF NOT EXISTS sushi.OrderDetails (
  od_id int AUTO_INCREMENT NOT NULL, 
  p_id int NOT NULL, 
  amount int NOT NULL,
  sabi_flag varchar(30) NOT NULL, 
  ricesize_flag varchar(30) NOT NULL, 
  ricekind_flag varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  FOREIGN KEY fk_od_id(od_id) REFERENCES sushi.Order(od_id)
);
