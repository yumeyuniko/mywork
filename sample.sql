CREATE TABLE players (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32),
  level int,
  job_id int
);

CREATE TABLE jobs (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  job_name VARCHAR(10),
  vitality int,
  strength int,
  agility int,
  intelligence int,
  luck int
);

INSERT INTO players VALUES(id,name,level,job_id)
  ("Sinatra",12,6),
  ("ケン",7,2),
  ("リン",1,1),
  ("ユウ",3,3),
  ("クレア",10,4),
  ("ショウ",5,2),
  ("さくら",7,1),
  ("ジャック",5,4),
  ("ロック",12,6),
  ("じゅん",1,NULL);

INSERT INTO jobs VALUES(id, job_name, vitality, strength, agility, intelligence, luck)
  (1,"戦士",8,8,4,4,3),
  (2,"盗賊",3,3,8,5,7),
  (3,"狩人",5,5,7,5,4),
  (4,"魔法使い",3,2,6,8,6),
  (5,"僧侶",5,5,3,7,5),
  (6,"勇者",10,10,10,10,10);

