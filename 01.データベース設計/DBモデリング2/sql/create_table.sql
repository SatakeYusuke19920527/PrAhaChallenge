-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS chatapp;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS chatapp.u (
  uid varchar(30) NOT NULL, 
  uname varchar(30) NOT NULL, 
  email varchar(30) NOT NULL, 
  displayName varchar(100) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS chatapp.ws (
  wsid varchar(30) NOT NULL, 
  wsname varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (wsid)
);

CREATE TABLE IF NOT EXISTS chatapp.c (
  cid varchar(30) NOT NULL, 
  wsid varchar(30) NOT NULL,
  cname varchar(30) NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (cid),
  FOREIGN KEY fk_wsid(wsid) REFERENCES ws(wsid)
);

CREATE TABLE IF NOT EXISTS chatapp.m (
  mid varchar(30) NOT NULL, 
  cid varchar(30) NOT NULL, 
  speaker varchar(30) NOT NULL, 
  message varchar(100) NOT NULL, 
  sendtime date NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (mid),
  FOREIGN KEY fk_cid(cid) REFERENCES c(cid),
  FOREIGN KEY fk_speaker(speaker) REFERENCES u(uid)
);

CREATE TABLE IF NOT EXISTS chatapp.t (
  tid varchar(30) NOT NULL, 
  mid varchar(30) NOT NULL, 
  speaker varchar(30) NOT NULL, 
  tmessage varchar(100) NOT NULL, 
  sendtime date NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (tid),
  FOREIGN KEY fk_mid(mid) REFERENCES m(mid),
  FOREIGN KEY fk_speaker(speaker) REFERENCES u(uid)
);

CREATE TABLE IF NOT EXISTS chatapp.rwu (
  wsid varchar(30) NOT NULL, 
  uid varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  FOREIGN KEY fk_wsid(wsid) REFERENCES ws(wsid),
  FOREIGN KEY fk_uid(uid) REFERENCES u(uid)
);

CREATE TABLE IF NOT EXISTS chatapp.rcu (
  cid varchar(30) NOT NULL, 
  uid varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  FOREIGN KEY fk_cid(cid) REFERENCES c(cid),
  FOREIGN KEY fk_uid(uid) REFERENCES u(uid)
);