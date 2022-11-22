-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS penpen;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS penpen.s (
  sid varchar(30) NOT NULL, 
  workspace varchar(30) NOT NULL, 
  channel varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (sid)
);

CREATE TABLE IF NOT EXISTS penpen.u (
  uid varchar(30) NOT NULL, 
  uname varchar(30) NOT NULL, 
  email varchar(30) NOT NULL, 
  displayName varchar(100) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS penpen.pt (
  ptid varchar(30) NOT NULL, 
  periodType varchar(30) NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (ptid),
);

CREATE TABLE IF NOT EXISTS penpen.r (
  rid varchar(30) NOT NULL, 
  ptid varchar(30) NOT NULL, 
  settingUser varchar(30) NOT NULL, 
  settingNumber int NOT NULL, 
  content varchar(500), 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (rid),
  FOREIGN KEY fk_ptid(ptid) REFERENCES pt(ptid),
  FOREIGN KEY fk_settingUser(settingUser) REFERENCES u(uid)
);

CREATE TABLE IF NOT EXISTS penpen.t (
  rid varchar(30) NOT NULL, 
  address varchar(30) NOT NULL, 
  channelOrUser int NOT NULL, 
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  FOREIGN KEY fk_rid(rid) REFERENCES r(rid)
);