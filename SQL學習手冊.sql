##創建資料庫
CREATE DATABASE gregs_list;
USE gregs_list;
##建立資料表
CREATE TABLE doughnut_list
(
   doughnut_name VARCHAR(10),
   doughnut_type VARCHAR(6)
);

CREATE TABLE my_contacts
(
   last_name VARCHAR(30),
   first_name VARCHAR(20),
   email VARCHAR(50),
   birthday DATE,
   profession VARCHAR(50),
   location VARCHAR(50),
   status VARCHAR(20),
   interests VARCHAR(100),
   seeking VARCHAR(100)
);
CREATE TABLE person
(person_id SMALLINT,
fname VARCHAR(20),
lname VARCHAR(20),
gender CHAR(1) CHECK (gender IN ('M','F')),
birth_date DATE,
address VARCHAR(30),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
postal_code VARCHAR(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)
);
CREATE TABLE piggy_bank
(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  coin CHAR(1) CHECK (coin IN ('P','N','D','Q'))
);
### 製作組合鍵
CREATE TABLE corporation
(corp_id SMALLINT,
 name VARCHAR(30),
 CONSTRAINT pk_corporation PRIMARY KEY (corp_id)
 );
### 外鍵 
CREATE TABLE favorite_food
(person_id SMALLINT,
food VARCHAR(20),
CONSTRAINT pk_favoriate_food PRIMARY KEY (person_id,food),
CONSTRAINT fk_person_id FOREIGN KEY (person_id)
REFERENCES person (person_id)
);
##查看資料表
DESC my_contacts;
##擺脫資料表
DROP TABLE my_contacts;
##插入資料
INSERT INTO my_contacts
(last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking)
VALUES
('Anderson','Jillian','jill_anderson@breakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto,CA','Single','Kayaking','Reptiles','Relationship','Friends');

INSERT INTO doughnut_purchases
(donut_type,dozens,topping,price)
VALUES
('jelly',3,'sprinkles',3.5);
INSERT INTO corporation (corp_id,name)
VALUES (27,'Acme Paper Corporation');
INSERT INTO person
(person_id,fname,lname,gender,birth_date)
VALUES (1,'William','Turner','M','1972-05-27');
INSERT INTO clown_info
VALUES
('Clarabelle','Belmont','Senior','Center','F,pink,hair,huge flower,blue dress','dancing');

##更改資料
ALTER TABLE my_contacts
ADD CONSTRAINT CHECK gender IN ('M','F');


ALTER TABLE my_contacts
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (contact_id);

ALTER TABLE my_contacts
ADD COLUMN phone VARCHAR(10)
AFTER first_name;

ALTER TABLE project_list
CHANGE COLUMN number proj_id INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (proj_id);
ALTER TABLE project_list
CHANGE COLUMN descriptionofproj proj_desc VARCHAR(100),
CHANGE COLUMN contractoronjob con_name VARCHAR(30);

ALTER TABLE project_list
MODIFY COLUMN proj_desc VARCHAR(120);

ALTER TABLE project_table
DROP COLUMN start_date;

ALTER TABLE projekts
RENAME TO project_list;
UPDATE doughnut_ratings
SET 
type='glazed'
WHERE type='plain glazed';

UPDATE clown_info
SET last_seen='Tracy''s'
WHERE name='Mr.Hobo'
AND last_seen='Party for Eric Gray';

UPDATE drink_info
SET cost=cost+1
WHERE
drink_name='Blue Moon'
OR
drink_name='Oh My Gosh'
OR
drink_name='Lime Fizz';

UPDATE movie_table
SET category=
CASE
   WHEN drama='T' THEN 'drama'
   WHEN comedy='T' THEN 'comedy'
   WHEN action='T' THEN 'action'
   WHEN gore='T' THEN 'horror'
   WHEN scifi='T' THEN 'scifi'
   WHEN for_kids='T' THEN 'family'
   WHEN cartoon='T' THEN 'family'
   ELSE 'misc'
END;
 ## 選取資料
SELECT DATE_FORMAT(a_date,'%M %Y') FROM some_dates;
SELECT name FROM corporation
WHERE corp_id=27;
SELECT person_id,fname,lname,birth_date
FROM person;
SELECT person_id,fname,lname,birth_date
FROM person
WHERE person_id=1;
###字串處理
SELECT RIGHT(location,2) FROM my_contacts;
SELECT SUBSTRING_INDEX(location,',',1) FROM my_contacts;  /*¨úlocationÄæ¦ì²Ä¤@­Ó³r¸¹«eªº¤º®e*/
## 刪除資料
DELETE FROM clown_info
WHERE
activities='yelling'
AND name='Clarabelle';



