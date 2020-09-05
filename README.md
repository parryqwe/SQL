# SQL
## 創建資料庫:CREATE DATABASE databasename;
## 使用資料庫:USE databasename;
## 建立資料表:CREATE TABLE tablename(variable type);
1.1 type:VARCHAR,DATE,SMALLINT,CHAR,INT,datetime,dec

1.2 AUTO_INCREMENT NOT NULL PRIMARY KEY  

1.3 CHECK (variable IN (指定值))  

1.4 CONSTRAINT primarykeyname PRIMARY KEY (組合鍵variable)  

1.5 CONSTRAINT foreignkeyname FOREIGN KEY (variable) REFERENCES tablename (variable)  
1.6 DEFAULT 1.00  
1.7 UNIQUE  
## 查看資料表:DESC tablename;
## 刪除資料表:DROP TABLE tablename;
## 插入資料:INSERT INTO tablename(variables) VALUES (values);
(插入全部變數variables可省略)
## 更改資料變數＆資料表名稱:ALTER TABLE tablename;
2.1 ADD COLUMN 1.1(1.2)  

2.1.1 FIRST,AFTER variable   

2.2 ADD CONSTRAINT 1.3  

2.3 ADD PRIMARY KEY(variable);  

2.4 CHANGE COLUMN oldvariable 1.1(1.2)  

2.5 MODIFY COLUMN 1.1(1.2)  

2.6 DROP COLUMN oldvariable  

2.7 RENAME TO newtablename  
2.8 TYPE=InnoDB   
2.9 ADD INDEX(variable);  
## 更改資料:UPDATE tablename SET variable=指定值 WHERE variable=指定值;
3.1 CASE WHEN variable=指定值 THEN variable=指定值 ELSE variable=指定值  
## 選取資料:SELECT variable FROM tablename WHERE variable=指定值; or SELECT DISTINCT variable FROM tablename
4.1 時間資料:DATE_FORMAT(variable,'%M','%Y')  
4.2 字串資料:RIGHT(variable,取值數量),SUBSTRING_INDEX(variable,切割符號,選取位置),SUBSTRING,SUBSTR,LTRIM,RTRIM,REPLACE(variable,被替代,替代值),UPPER,LOWER,REVERSE  
4.3 where後面可接:IS NULL,LIKE,IN(),NOT IN(),子查詢variable IN (SELECT子句) or EXISTS(SELECT子句) or NOT EXISTS(SELECT子句)  
## 刪除資料:DELETE FROM WHERE variable=指定值;
## 視觀表: CREATE VIEW viewname AS 
## 刪除視觀表: DROP VIEW viewname;
## 建立索引:CREATE INDEX indexname ON tablename(variable)
## 分組資料:GROUP BY variable 搭配HAVING
## 排序資料:ORDER BY variable DESC or ORDER BY variable ASC 搭配LIMIT OFFSET
## 統計量:COUNT,SUM,AVG,MAX,MIN,YEAR,CONCAT(variable,variable),LENGTH
## 資料集合併:
5.1 UNION,UNION ALL,INTERSECT,MINU  
5.2 CROSS JOIN  
5.3 INNER JOIN tablename ON  
5.4 NATURAL JOIN,JOIN tablename ON  
5.5 LEFT OUTER JOIN tablename ON,LEFT JOIN tablename ON    
5.6 RIGHT OUTER JOIN tablename ON    
5.7 EXCEPT  
## 交易資料處理
6.1 START TRANSACTION;  
6.2 COMMIT;   
6.3 ROLLBACK;  
## 設定使用者
7.1 SET PASSWORD FOR 'root'@'localhost'=PASSWORD();  
7.2 CREATE USER username IDENTIFIED BY " ";  
## 設定權限
8.1 GRANT SELECT ON tablename TO username;  
8.2 GRANT INSERT ON tablename TO username;  
8.3 GRANT DELETE ON tablename TO username;  
8.4 GRANT SELECT(variable) ON tablename TO username;  
8.5 GRANT ALL ON tablename TO username;  
8.6 REVOKE SELECT ON tablename FROM username;  
8.7 REVOKE GRANT OPTION ON DELETE ON tablename FROM username;  
8.8 REVOKE DELETE ON tablename FROM username; 可加CASCADE or RESTRICT  
8.9 GRANT 腳色 TO 使用者;　可加WITH ADMIN OPTION　　 
8.10 REVOKE腳色 FROM 使用者; 可加CASCADE or RESTRICT  



## 設定腳色
9.1 CREATE ROLE rolename;  
9.2 DROP ROLE rolename;  
## 設定暫時資料表CREATE TEMPORARY TABLE tablename (variable type);or CREATE TEMPORARY TABLE tablename AS 
10.1 SELECT(CAST(text or number AS type));  
10.2 SELECT CURRENT_USER;,SELECT CURRENT_DATE;,SELECT CURRENT_TIME;  

## Leetcode
11.1  
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT   
BEGIN  
DECLARE M INT;  
SET M = N-1;  
  RETURN (  
      # Write your MySQL query statement below.   
      SELECT DISTINCT Salary  
      FROM Employee  
      ORDER BY Salary DESC  
      LIMIT 1 OFFSET M  
  );  
END  
11.2
SELECT  
    d.Name AS 'Department', e1.Name AS 'Employee', e1.Salary  
FROM  
    Employee e1  
        JOIN  
    Department d ON e1.DepartmentId = d.Id   
WHERE  
    3 > (SELECT  
            COUNT(DISTINCT e2.Salary)  
        FROM  
            Employee e2  
        WHERE  
            e2.Salary > e1.Salary  
                AND e1.DepartmentId = e2.DepartmentId  
        )  
;  
11.3
select   
      score  
      , dense_rank() over(order by score desc) as "Rank"  
from scores;   
