# SQL
## 創建資料庫:CREATE DATABASE databasename;
## 使用資料庫:USE databasename;
## 建立資料表:CREATE TABLE tablename(variable type);
1.1 type:VARCHAR,DATE,SMALLINT,CHAR,INT
1.2 AUTO_INCREMENT NOT NULL PRIMARY KEY
1.3 CHECK (variable IN (指定值))
1.4 CONSTRAINT primarykeyname PRIMARY KEY (組合鍵variable)
1.5 CONSTRAINT foreignkeyname FOREIGN KEY (variable) REFERENCES tablename (variable)
## 查看資料表:DESC tablename;
## 刪除資料表:DROP TABLE tablename;
## 插入資料:INSERT tablename(variables) VALUES (values);
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
## 更改資料:UPDATE tablename SET variable=指定值 WHERE variable=指定值;





