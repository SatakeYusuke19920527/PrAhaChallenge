-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS document;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS document.u (
  uid varchar(30) NOT NULL, 
  uname varchar(30) NOT NULL, 
  email varchar(30) NOT NULL, 
  displayName varchar(100) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS document.f (
  fid varchar(30) NOT NULL, 
  fname varchar(30) NOT NULL, 
  directoryPath varchar(100) NOT NULL, 
  sortNo varchar(100) NOT NULL, 
  owner varchar(30) NOT NULL, 
  updateUser varchar(30), 
  content varchar(500), 
  history varchar(100), 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (fid),
  FOREIGN KEY fk_owner(owner) REFERENCES u(uid)
);