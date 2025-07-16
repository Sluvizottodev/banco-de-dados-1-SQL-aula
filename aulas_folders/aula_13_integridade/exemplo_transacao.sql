DROP DATABASE IF EXISTS transacao;
2 CREATE DATABASE IF NOT EXISTS transacao;
3 USE transacao;
4 CREATE TABLE conta(id int AUTO_INCREMENT PRIMARY KEY, titular varchar(20), saldo
DECIMAL(9,2) DEFAULT 0.00)ENGINE = INNODB;
5
6 INSERT INTO conta VALUES(1,'Rafael',1000),(2,'Renata',1000);
7
8 -- No console
9
10 mysql -p -u root;
11 use transacao;
12
13 SELECT * FROM conta;
14 ---------------------------------------
15 SET @valorATransferir = 500;
16 SET SESSION AUTOCOMMIT = 0;
17 UPDATE conta SET saldo = saldo - @valorATransferir WHERE id = 1;
18 UPDATE conta SET saldo = saldo + @valorATransferir WHERE id = 2;
19
20 SELECT * FROM conta;
21 ---------------------------------------
22 ROLBACK;
23 SELECT * FROM conta;
24 SET SET SESSION AUTOCOMMIT = 1;
25 ---------------------------------------
26 SET @valorATransferir = 500;
27 SET SESSION AUTOCOMMIT = 0;
28 UPDATE conta SET saldo = saldo - @valorATransferir WHERE id = 1;
29 UPDATE conta SET saldo = saldo + @valorATransferir WHERE id = 2;
30
31 SELECT * FROM conta;
32 ----------------------------------------
33 COMMIT;
34 SELECT * FROM conta;
35 SET SET SESSION AUTOCOMMIT = 1