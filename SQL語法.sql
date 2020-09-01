##創建資料庫
CREATE DATABASE gregs_list;
##使用資料庫
USE gregs_list;
##建立資料表
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
CREATE TABLE profession
(
 id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 profession varchar(20)
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
CREATE TABLE my_contacts
(
 last_name VARCHAR(30) NOT NULL,
 first_name VARCHAR(20) NOT NULL
);
CREATE TABLE doughnut_list
(
 doughnut_name VARCHAR(10) NOT NULL,
 doughnut_type VARCHAR(6) NOT NULL,
 doughnut_cost DEC(3,2) NOT NULL DEFAULT 1.00
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

INSERT INTO Store_Information (Store_Name, Sales, Txn_Date)
SELECT Store_Name, Sales, Txn_Date
FROM Sales_Information
WHERE Year(Txn_Date) = 1998;

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

ALTER TABLE your_table TYPE=InnoDB;

ALTER TABLE my_contacts
ADD INDEX (last_name);

ALTER TABLE my_contacts
ADD INDEX (last_name); 

ALTER TABLE profession
ADD COLUMN id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (id);

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

UPDATE my_contacts SET
interest1=SUBSTRING_INDEX(interests,',',1),
interests=SUBSTR(interests,LENGTH(interest1)+2),
interest2=SUBSTRING_INDEX(interests,',',1),
interests=SUBSTR(interests,LENGTH(interest2)+2),
interest3=SUBSTRING_INDEX(interests,',',1),
interests=SUBSTR(interests,LENGTH(interest3)+2);    /*±N¤@­ÓÄæ¦ì¤À¦¨¨ä¥LÄæ¦ì*/

 ## 選取資料
SELECT DATE_FORMAT(a_date,'%M %Y') FROM some_dates;
SELECT name FROM corporation
WHERE corp_id=27;
SELECT person_id,fname,lname,birth_date
FROM person;
SELECT person_id,fname,lname,birth_date
FROM person
WHERE person_id=1;

SELECT drink_name FROM easy_drinks
WHERE
main='cherry juice';

SELECT location
FROM doughnut_ratings
WHERE type='plain glazed'
AND
rating=10;

SELECT drink_name FROM easy_drinks
WHERE
main='soda'
AND
amount1>1;

SELECT drink_name FROM drink_info
WHERE
cost>=3.5
AND
calories<50;
SELECT drink_name FROM drink_info
WHERE
drink_name>='L'
AND
drink_name<'M';

SELECT drink_name FROM easy_drinks
WHERE
main='orange juice'
OR
main='apple juice';
SELECT drink_name FROM drink_info
WHERE calories IS NULL;

SELECT * FROM my_contacts
WHERE location LIKE '%CA';     

SELECT * FROM my_contacts
WHERE location LIKE '_CA';     

SELECT drink_name FROM drink_info
WHERE
calories BETWEEN 30 AND 60;
SELECT date_name FROM black_book
WHERE
rating IN ('innovative','fabulous','delightful','pretty good');

SELECT date_name FROM black_book
WHERE
rating NOT IN ('innovative','fabulous','delightful','pretty good');

SELECT drink_name FROM drink_info
WHERE NOT carbs BETWEEN 3 AND 5;
SELECT date_name from black_book
WHERE NOT date_name LIKE 'A%'
and NOT date_name LIKE 'B%';

SELECT drinl_name FROM drink_info
WHERE
drink_name BETWEEN 'G' AND 'O';

SELECT drink_name FROM drink_info
WHERE NOT carbs BETWEEN 3 AND 5;
SELECT * 
FROM Store_Information 
WHERE Txn_Date BETWEEN 'Jan-06-1999' AND 'Jan-10-1999';

SELECT * 
FROM Store_Information 
WHERE store_name LIKE '%AN%';

SELECT first_name FROM my_contacts
WHERE first_name LIKE '_im';    /*_:¤@­Ó¥¼ª¾¦r¤¸ªº´À¨­*/

SELECT data_name FROM black_book
WHERE NOT data_name LIKE 'A%'
AND NOT data_name LIKE 'B%';

SELECT drink_name
FROM drink_info
WHERE NOT
calories IS NULL; 

SELECT drink_name
FROM drink_info
WHERE
calories IS NOT NULL;  

SELECT SUBSTR(Store_Name,2,4) 
FROM Geography 
WHERE Store_Name = 'San Diego';     /*SUBSTR (str, pos, len):¥Ñ <str> ¤¤ªº²Ä <pos> ¦ì¸m¶}©l¡A¿ï¥X±µ¤U¥hªº <len> ­Ó¦r¤¸*/

SELECT LTRIM ('   Sample   ');

SELECT RTRIM ('   Sample   ');

SELECT SUM(Sales) FROM Store_Information
WHERE Store_Name IN
(SELECT Store_Name FROM Geography 
WHERE Region_Name = 'West');              /*Â²³æ¤l¬d¸ß*/

SELECT SUM(a1.Sales) FROM Store_Information a1
WHERE a1.Store_Name IN
(SELECT Store_Name FROM Geography a2
WHERE a2.Store_Name = a1.Store_Name);     /*¬ÛÃö¤l¬d¸ß*/

SELECT SUM(Sales) FROM Store_Information
WHERE EXISTS
(SELECT * FROM Geography
WHERE Region_Name = 'West');

SELECT mc.first_name,mc.last_name,
(SELECT state
FROM zip_code
WHERE mc.zip_code=zip_code) AS state
FROM my_contacts mc;

SELECT mc.first_name,mc.last_name,jc.salary
FROM
my_contacts AS mc NATURAL JOIN job_current AS jc
WHERE
jc.salary>(SELECT jc.salary
FROM my_contacts mc NATURAL JOIN job_current jc
WHERE email='andy@weatherorama.com'); 

SELECT mc.first_name,mc.last_name
FROM my_contacts AS mc
WHERE
3=(
SELECT COUNT(*) FROM contact_interest
WHERE contact_id=mc.contact_id
);                                                   /*¦^¶Ç¨ã¦³¤T¶µ¿³½ìªº¤H(ÃöÁp©Ê¤l¬d¸ß)*/

SELECT mc.first_name firstname,mc.last_name lastname,mc.email email
FROM my_contacts mc
WHERE NOT EXISTS
(SELECT * FROM job_current jc
WHERE mc.contact_id=jc.contact_id);                 /*·f°tNOT EXISTS ÃöÁp©Ê¤l¬d¸ß*/

SELECT mc.first_name firstname,mc.last_name lastname,mc.email email
FROM my_contacts mc
WHERE EXISTS
(SELECT * FROM contact_interest ci WHERE mc.contact_id=ci.contact_id);

SELECT title FROM job_listings 
WHERE ssalary=(SELECT MAX(salary) FROM job_listings);

SELECT c1.name,
(SELECT name FROM clown_info
WHERE c1.boss_id=id) AS boss
FROM clown_info c1;      
###字串處理
SELECT RIGHT(location,2) FROM my_contacts;
SELECT SUBSTRING_INDEX(location,',',1) FROM my_contacts;  /*¨úlocationÄæ¦ì²Ä¤@­Ó³r¸¹«eªº¤º®e*/
## 刪除資料
DELETE FROM clown_info
WHERE
activities='yelling'
AND name='Clarabelle';

DELETE  FROM clown_info
WHERE 
activities='dancing'

##分組排序資料
INSERT INTO profession (profession)
   SELECT profession FROM my_contacts
   GROUP BY profession
   ORDER BY profession;

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 2;        /*¥u¨ú¥X«e¨âµ§°O¿ý*/

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 0,4;    

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 1,1;  

CREATE TABLE profession AS
   SELECT profession FROM my_contacts
   GROUP BY profession
   ORDER BY profession;

CREATE TABLE profession
( 
   id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   profession varchar(20)
)AS
  SELECT profession FROM my_contacts
  GROUP BY profession
  ORDER BY profession;

CREATE TABLE profession
(
   id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   profession varchar(20)
) AS
  SELECT profession AS mc_prof FROM my_contacts
  GROUP BY mc_prof
  ORDER BY mc_prof;

SELECT profession AS mcprof
FROM my_contacts AS mc
GROUP BY mc_prof
ORDER BY mc_prof;

SELECT Store_Name, Sales, Txn_Date 
FROM Store_Information 
ORDER BY Sales DESC;

SELECT Store_Name, Sales, Txn_Date 
FROM Store_Information 
ORDER BY 2 DESC;       /*2:select«áªº²Ä¤G­ÓÄæ¦ì*/

SELECT Store_Name, SUM(Sales) 
FROM Store_Information 
GROUP BY Store_Name;

SELECT Store_Name, SUM(Sales) 
FROM Store_Information 
GROUP BY Store_Name
HAVING SUM(Sales) > 1500;   /*having:¹ï¨ç¼Æªº­È²£¥Í±ø¥ó*/

SELECT A1.Store_Name Store, SUM(A1.Sales) 'Total Sales' 
FROM Store_Information A1
GROUP BY A1.Store_Name;              /* "Total Sales":Äæ¦ì§O¦W A1:ªí®æ§O¦W*/

SELECT title,category
FROM movie_table
WHERE
title LIKE 'A%'
AND
category='family'
ORDER BY title;

SELECT title,category,purchased
FROM movie_table
ORDER BY category,purchased;

SELECT title,purchased
FROM movie_table
ORDER BY title ASC,purchased DESC;

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 2;   

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 0,4;        /*±q²Ä¤@µ§¸ê®Æ¶}©l¨ú¥|µ§¬ö¿ý*/

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC
LIMIT 1,1;          
SELECT title FROM job_listings
ORDER BY salary DESC LIMIT 1;  
##計算統計量
SELECT a1.Name, a1.Sales, COUNT(a2.Sales) Sales_Rank 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR (a1.Sales=a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;   /*±Æ¦W*/

SELECT Sales Median FROM 
(SELECT a1.Name, a1.Sales, COUNT(a2.Sales) Rank 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR (a1.Sales=a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales desc) a3 
WHERE Rank = (SELECT (COUNT(*)+1) DIV 2 FROM Total_Sales);   /*¤¤¦ì¼Æ*/

SELECT a1.Name, a1.Sales, SUM(a2.Sales) Running_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR (a1.Sales=a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;    /*²Ö¿nÁ`­p*/

SELECT a1.Name, a1.Sales, a1.Sales/(SELECT SUM(Sales) FROM Total_Sales) Pct_To_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR (a1.Sales=a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;       /*Á`©M¦Ê¤À¤ñ*/

SELECT a1.Name, a1.Sales, SUM(a2.Sales)/(SELECT SUM(Sales) FROM Total_Sales) Pct_To_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales or (a1.Sales=a2.Sales and a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC; 



SELECT SUM(sales)
FROM cookie_sales
WHERE first_name='Nicole';

SELECT first_name,SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales)DESC;

SELECT first_name,AVG(sales)
FROM cookie_sales
GROUP BY first_name;

SELECT first_name,MAX(sales)
FROM cookie_sales
GROUP BY first_name;

SELECT first_name,MIN(sales)
FROM cookie_sales
GROUP BY first_name;

SELECT COUNT(sale_date)
FROM cookie_sales;

SELECT DISTINCT sale_date
FROM cookie_sales
ORDER BY sale_date;

SELECT COUNT(DISTINCT sale_date)
FROM cookie_sales;
SELECT A1.Region_Name REGION, SUM(A2.Sales) SALES 
FROM Georgraphy A1, Store_Information A2 
WHERE A1.Store_Name = A2.Store_Name 
GROUP BY A1.Region_Name;  

SELECT A1.Store_Name, SUM(A2.Sales) SALES 
FROM Georgraphy A1, Store_Information A2 
WHERE A1.Store_Name = A2.Store_Name
GROUP BY A1.Store_Name;              /*¥~³¡³sµ²(¥H Georgraphy A1¬°·Ç³s±µ)²Ä¤G­Óªí®æ¨S¦³¬Û¹ïªº¸ê®Æ®É¡A SQL ·|¶Ç¦^ NULL ­È*/

SELECT CONCAT(Region_Name, Store_Name) FROM Geography 
WHERE Store_Name = 'Boston';            /*³s±µ¨â­ÓÄæ¦ì¸ê®Æ*/
SELECT Region_Name + ' ' + Store_Name FROM Geography 
WHERE Store_Name = 'Boston';  

SELECT AVG(Sales) FROM Store_Information;

SELECT COUNT (Store_Name) 
FROM Store_Information 
WHERE Store_Name IS NOT NULL;
SELECT REPLACE (Region_Name, 'ast', 'astern')
FROM Geography;

SELECT RIGHT(location,2) FROM my_contacts;      /*§âlocationÄæ¦ì³Ì¥kÃäªº¨â¦r¤¸¨ú¥X*/
SELECT SUBSTRING_INDEX(location,',',1) FROM my_contacts;   /*§âlocationÄæ¦ì²Ä¤@­Ó³r¸¹«eªº©Ò¦³¤º®e¨ú¥X*/


SELECT Length (Store_Name) 
FROM Geography 
WHERE Store_Name = 'Los Angeles';

SELECT Region_Name, Length (Region_Name) 
FROM Geography;
##資料表合併


SELECT Txn_Date FROM Store_Information
UNION
SELECT Txn_Date FROM Internet_Sales;

SELECT Txn_Date FROM Store_Information
UNION ALL
SELECT Txn_Date FROM Internet_Sales; 

SELECT Txn_Date FROM Store_Information
INTERSECT
SELECT Txn_Date FROM Internet_Sales;

SELECT Txn_Date FROM Store_Information
MINUS
SELECT Txn_Date FROM Internet_Sales;

SELECT t.toy,b.boy
FROM toys AS t
   CROSS JOIN
   boys AS b;        /*¥æ¤eÁpµ²*/

SELECT mc.last_name,
mc.first_name,
p.profession
FROM my_contacts AS mc
   INNER JOIN
   profession AS p
ON mc.prof_id=p.prof_id;       /*§Q¥Î¥~Áä§ä¥X¨â­Ó¸ê®Æªí¤º³¡Ápµ²¸ê®Æ*/

SELECT boys.boy,toys.toy
FROM boys
    INNER JOIN
	toys
ON boys.toy_id<>toys.toy_id
ORDER BY boys.boy;           /*§Q¥Î¥~Áä§ä¥X¨k«Ä¨S¦³ªºª±¨ã*/

SELECT boys.boy,toys.toy
FROM boys
    NATURAL JOIN
	toys;                    /*§Q¥Î¥~Áä§ä¥X¨â­Ó¸ê®Æªí¤º³¡Ápµ²¸ê®Æ*/

SELECT mc.first_name,mc.last_name,mc.phone
FROM my_contacts AS mc
    NATURAL JOIN
	job_desired AS jd
WHERE jd.title='Web Developer'
AND jd.salary_low<105000;     /*§Q¥Î¥~Áä¤º³¡Ápµ²¬d¸ß¸ê®Æ*/

SELECT mc.first_name,mc.last_name,mc.phone,jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE
jc.title IN ('Cook','Hairdresser','Waiter','Web Designer','Web Developer');

SELECT mc.first_name,mc.last_name,mc.phone,jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE jc.title IN (SELECT title FROM job_listings);

SELECT *        /* ¬D¥X©Ò¦³Äæ¦ìªº¸ê®Æ */ 
FROM A JOIN B       /* ±qA,B¸ê®Æªí§ì¸ê®Æ */ 
ON A.ID=B.ID;   

SELECT g.girl,t.toy
FROM girls g
LEFT OUTER JOIN toys t
ON g.toy_id=t.toy_id;                 /*¥ª¥~³¡Ápµ²*/

SELECT p.BusinessEntityID, p.FirstName, p.LastName, e.Gender, e.BirthDate, 
e.HireDate, e.JobTitle 
FROM Person.Person p LEFT JOIN HumanResources.Employee e 
ON p.BusinessEntityID=e.BusinessEntityID 

SELECT g.girl,t.toy
FROM girls g
RIGHT OUTER JOIN toys t
ON g.toy_id=t.toy_id;                 /*¥k¥~³¡Ápµ²*/

SELECT c1.name,c2.name AS boss
FROM clown_info c1
INNER JOIN clown_info c2
ON c1.boss_id=c2.id;            /*¦Û§ÚÁpµ²*/

SELECT title FROM job_current
UNION 
SELECT title FROM job_desired
UNION 
SELECT title FROM job_listings
ORDER BY title;                   /*Áp¶°*/

SELECT title FROM job_current
UNION ALL
SELECT title FROM job_desired
UNION ALL 
SELECT title FROM job_listings
ORDER BY title;                          /*Áp¶°*/

CREATE TABLE my_union AS
SELECT title FROM job_current
UNION 
SELECT title FROM job_desired
UNION 
SELECT title FROM job_listings;           

SELECT title FROM job_current
INTERSECT 
SELECT title FROM job_desired;     

SELECT title FROM job_current
EXCEPT 
SELECT title FROM job_desired;

SELECT c1.name,c2.name AS boss
FROM clown_info c1
INNER JOIN clown_info c2
ON c1.boss_id=c2.id;
##建立視觀表
CREATE VIEW web_designers AS
SELECT mc.first_name,mc.last_name,mc.phone,mc.email
FROM my_contacts mc
NATURAL JOIN job_desired jd
WHERE jd.title='Web Designer';     

CREATE VIEW pb_quarters AS SELECT * FROM piggy_bank WHERE coin='Q';
CREATE VIEW pd_dimes AS SELECT * FROM piggy_bank WHERE coin='D' WITH CHECK OPTION;
## 交易
START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank set coin='Q' where coin='P';
SELECT * FROM piggy_bank;
ROLLBACK;
SELECT * FROM piggy_bank;                   /*¼È®É¤£³y¦¨¥Ã¤[©Ê¸ê®Æªí§ïÅÜ*/

START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank set coin='Q' where coin='P';
SELECT * FROM piggy_bank;
COMMIT;
SELECT * FROM piggy_bank;            /*½T©wÅý¸ê®Æ§ïÅÜ*/
##設定使用者
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('b4dc10wnZ');  /*³]©w®Ú¨Ï¥ÎªÌ±K½X*/

CREATE USER elie
IDENTIFIED BY 'cl3v3rp4s5w0rd';

CREATE USER elsie
IDENTIFIED BY 'cl3v3rp4s5w0rd';
GRANT SELECT ON
clown_info
TO elie;         
##設定權限
GRANT SELECT ON
clown_info
TO elsie;                 
GRANT INSERT ON
clown_info
TO elsie;   
GRANT DELETE ON
clown_info
TO elsie;   
GRANT SELECT(clown_name) ON
clown_info
TO elsie;               
GRANT SELECT,INSERT ON
clown_info
TO elsie;                 
GRANT ALL ON
clown_info
TO elsie;                            /*±Â¤©Åv§Q*/

GRANT DELETE ON talking_animals TO sleepy WITH GRANT OPTION; /*±Â¤©sleepy§R°£¸ê®Æªí,¦P®É¤]¤¹³\sleepy§â§R°£ªºÅv­­±Â¤©¨ä¥L¤H*/

GRANT SELECT ON woodland_cottage.* TO doc;  /*¬°doc³]¥ßselect woodland_cottage¸ê®Æ®w©Ò¦³¸ê®ÆªíªºÅv­­*/
REVOKE SELECT ON 
clown_info 
FROM elsie;          

REVOKE GRANT OPTION ON
DELETE ON chores
FROM happy,sleepy;          

REVOKE DELETE ON chores FROM sleepy CASCADE;  
REVOKE DELETE ON chores FROM sleepy RESTRICT;     /*¦pªG¦³¤H·|¨ü¼vÅT¥i¦¬¨ì¿ù»~°T®§³qª¾*/
GRANT SELECT,INSERT ON some_table TO data_entry;     
GRANT data_entry TO doc;

GRANT data_entry TO doc WITH ADMIN OPTION; /*¨Ï¥ÎªÌdoc §â´X¦âdata_entry±Â¤©¨ä¥L¤H*/

REVOKE data_entry FROM doc CASCADE;
REVOKE data_entry FROM doc RESTRICT;
GRANT SELECT ON
clown_info
TO elsie
IDENTIFIED BY 'cl3v3rp4s5w0rd';   /*©
##設定腳色
CREATE ROLE data_entry; 
DROP ROLE data_entry;  
##暫時資料表
CREATE TEMPORARY TABLE my_temp_table
(
   some_id INT,
   some_data VARCHAR(50)
);                                        /*«Ø¥ß¼È®É¸ê®Æªí*/
CREATE TEMPORARY TABLE my_temp_table AS
SELECT * FROM my_permanent_table;         /*«Ø¥ß¼È®É¸ê®Æªí*/    
SELECT DATE_FORMAT(a_date,'%M %Y') FROM some_dates;
SELECT CAST('2005-01-01' AS DATE);
SELECT cast(2 AS DECIMAL);
SELECT CURRENT_USER;
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;