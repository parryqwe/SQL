# SQL
## 創建資料庫:CREATE DATABASE databasename;
## 使用資料庫:USE databasename;
## 建立資料表:CREATE TABLE tablename(variable type);
### type:VARCHAR,DATE,SMALLINT,CHAR,INT
### AUTO_INCREMENT NOT NULL PRIMARY KEY,CHECK (variable IN (指定值)),CONSTRAINT primarykeyname PRIMARY KEY (組合鍵variable),CONSTRAINT foreignkeyname FOREIGN KEY (variable)
### REFERENCES tablename (variable)
