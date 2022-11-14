-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS sushi

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS sushi.OrderType (
  ot_no int AUTO_INCREMENT NOT NULL, 
  ot_name varchar(30) NOT NULL, 
  PRIMARY KEY (ot_no)
);

CREATE TABLE IF NOT EXISTS sushi.ProductType (
  pt_no int AUTO_INCREMENT NOT NULL, 
  pt_name varchar(30) NOT NULL, 
  PRIMARY KEY (pt_no)
);

CREATE TABLE IF NOT EXISTS sushi.Product (
  p_no int AUTO_INCREMENT NOT NULL, 
  p_name varchar(30) NOT NULL, 
  ot_no int NOT NULL,
  pt_no int NOT NULL,
  PRIMARY KEY (p_no),
  FOREIGN KEY fk_ot_no(ot_no) REFERENCES OrderType(ot_no),
  FOREIGN KEY fk_pt_no(pt_no) REFERENCES ProductType(pt_no)
);

CREATE TABLE IF NOT EXISTS sushi.Price (
  p_no int AUTO_INCREMENT NOT NULL, 
  price int NOT NULL,
  FOREIGN KEY fk_p_no(p_no) REFERENCES Product(p_no)
);

CREATE TABLE IF NOT EXISTS sushi.Customer (
  c_no int AUTO_INCREMENT NOT NULL, 
  c_name varchar(30) NOT NULL, 
  phonenumber varchar(30) NOT NULL, 
  payment_flag int,
  PRIMARY KEY (c_no)
);

CREATE TABLE IF NOT EXISTS sushi.OrderDetails (
  od_no int AUTO_INCREMENT NOT NULL, 
  c_no int NOT NULL, 
  p_no int NOT NULL, 
  amount int NOT NULL,
  sabi_flag varchar(30) NOT NULL, 
  ricesize_flag varchar(30) NOT NULL, 
  PRIMARY KEY (od_no),
  FOREIGN KEY fk_c_no(c_no) REFERENCES Customer(c_no),
  FOREIGN KEY fk_p_no(p_no) REFERENCES Price(p_no)
);

CREATE TABLE IF NOT EXISTS sushi.OrderHistory (
  od_no int NOT NULL, 
  order_date date NOT NULL,
  FOREIGN KEY fk_od_no(od_no) REFERENCES OrderDetails(od_no)
);

-- INSERT INFOMATION
