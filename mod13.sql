CREATE DATABASE /*!32312 IF NOT EXISTS*/`mod13` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mod13`;

DROP TABLE IF EXISTS `salesAgents`;

CREATE TABLE  `salesAgents` 
   (	
    `agentID` VARCHAR (6) NOT NULL PRIMARY KEY, 
	`name` VARCHAR(40), 
	`state` VARCHAR(35), 
	`commission` NUMERIC(10,2), 
	`phone` CHAR(15), 
	`country` VARCHAR(25) 
	 );


INSERT INTO salesAgents VALUES ('A007','Richard', 'MA','0.15', '314-258-14763', 'USA');
INSERT INTO salesAgents VALUES ('A003','Alex', 'CA','0.13', '123-245-8969', 'USA');
INSERT INTO salesAgents VALUES('A008','Alford', 'NY','0.12', '234-287-4365', 'USA');
INSERT INTO salesAgents VALUES('A011','Ronald', 'MA','0.15', '567-462-5874', 'USA');
INSERT INTO salesAgents VALUES('A010','Sean', 'IL','0.14','765-238-8644', 'USA');
INSERT INTO salesAgents VALUES('A012','Lucie', 'AZ','0.12', '876-598-1425', 'USA');
INSERT INTO salesAgents VALUES('A005','Andy','BC','0.13', '987-244-7739', 'CAN');
INSERT INTO salesAgents VALUES('A001','Susan', 'MA','0.14', '257-134-6674', 'USA');
INSERT INTO salesAgents VALUES('A002','Mark', 'TX','0.11', '713-135-8964', 'USA');
INSERT INTO salesAgents VALUES('A006','Keisha', 'CA','0.15', '078-2225-5588', 'CAN');
INSERT INTO salesAgents VALUES('A004','Yvonne', 'ON','0.15', '008-254-4166', 'CAN');
INSERT INTO salesAgents VALUES('A009','Ben', 'NH','0.11', '409-253-6178', 'USA');

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`
	(
		`custID` VARCHAR (6) NOT NULL PRIMARY KEY,
		`custName` VARCHAR (40),
		`city` VARCHAR(40),
		`state` VARCHAR(30),
		`country` VARCHAR(30),
		`level` INT(2),
		`creditLine` INT(10),
		`payments` NUMERIC (10,2),
		`phone` CHAR(30),
		`agentID` VARCHAR(6) NOT NULL REFERENCES salesAgents(agentID)
	);
INSERT INTO customers VALUES('C00013', 'Holmes', 'Los Angeles', 'CA', 'USA','2','6000','5000', 'BBBBBBB', 'A003');
INSERT INTO customers VALUES('C00001', 'Micheal', 'NY', 'NY', 'USA','2','3000','5000', 'CCCCCCC', 'A008');
INSERT INTO customers VALUES('C00020', 'Albert', 'NY', 'NY', 'USA','3','5000','7000', 'BBBBSBB', 'A008');
INSERT INTO customers VALUES('C00025', 'Ravindran', 'Boston', 'MA', 'USA','2','5000','7000', 'AVAVAVA', 'A011');
INSERT INTO customers VALUES('C00024', 'Cook','San Diego', 'CA', 'USA','2','4000','9000', 'FSDDSDF', 'A006');
INSERT INTO customers VALUES('C00015', 'Stuart','Los Angeles', 'CA', 'USA','1','6000','8000', 'GFSGERS', 'A003');
INSERT INTO customers VALUES('C00002', 'Bolt', 'NY', 'NY', 'USA','3','5000','7000', 'DDNRDRH', 'A008');
INSERT INTO customers VALUES('C00018', 'Fleming','Vancouver', 'BC', 'Canada','2','7000','7000', 'NHBGVFC', 'A005');
INSERT INTO customers VALUES('C00021', 'Jacks','Vancouver', 'BC', 'Canada','1','7000','7000', 'WERTGDF', 'A005');
INSERT INTO customers VALUES('C00019', 'Yi','Chicago', 'IL', 'USA','1','8000','7000', 'ZZZZBFV', 'A010');
INSERT INTO customers VALUES('C00005', 'Sarah','Dallas', 'TX', 'USA','1','7000','11000', '147-25896312', 'A002');
INSERT INTO customers VALUES('C00007', 'Roman','Chicago', 'IL', 'USA','1','7000','11000', 'GHRDWSD', 'A010');
INSERT INTO customers VALUES('C00022', 'Avery','Dallas', 'TX', 'USA','2','7000','11000', '113-12345678','A002');
INSERT INTO customers VALUES('C00004', 'Winston','Vancouver', 'BC', 'Canada','1','5000','8000', 'AAAAAAA', 'A005');
INSERT INTO customers VALUES('C00023', 'Karl','Los Angeles', 'CA', 'UK','0','4000','6000', 'AAAABAA', 'A006');
INSERT INTO customers VALUES('C00006', 'Shilton','Toronto', 'ON', 'Canada','1','10000','7000', 'DDDDDDD', 'A004');
INSERT INTO customers VALUES('C00010', 'Charles','Manchester', 'NH', 'USA','3','6000','4000', 'MMMMMMM', 'A009');
INSERT INTO customers VALUES('C00017', 'Srinivas','Boston', 'MA', 'USA','2','8000','4000', 'AAAAAAB', 'A007');
INSERT INTO customers VALUES('C00012', 'Steven','Phoenix', 'AZ', 'USA','1','5000','7000', 'KRFYGJK', 'A012');
INSERT INTO customers VALUES('C00008', 'Karolina','Toronto', 'ON', 'Canada','1','7000','7000', 'HJKORED', 'A004');
INSERT INTO customers VALUES('C00003', 'Martin','Toronto', 'ON', 'Canada','2','8000','7000', 'MJYURFD', 'A004');
INSERT INTO customers VALUES('C00009', 'Ramesh','Dallas', 'TX', 'USA','3','8000','7000', 'Phone No', 'A002');
INSERT INTO customers VALUES('C00014', 'Reggie','Boston', 'MA', 'USA','2','8000','11000', 'AAAATGF', 'A001');
INSERT INTO customers VALUES('C00016', 'Venkat','Boston', 'MA', 'USA','2','8000','11000', 'JRTVFDD', 'A007');
INSERT INTO customers VALUES('C00011', 'Sandra','Chicago', 'IL', 'USA','3','7000','11000', 'PPHGRTS', 'A010');


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
	(
		`orderID` VARCHAR(6) NOT NULL PRIMARY KEY,
		`orderTotal` INT(4),
		`advance_amount` INT(4),
		`date` CHAR(10),
		`custID` VARCHAR(6) NOT NULL REFERENCES customers(custID),
		`agentID` VARCHAR(6) NOT NULL REFERENCES salesAgents(agentID),
		`orderDescription` CHAR (40)
	);

INSERT INTO orders VALUES('200100','1000','600', '08/01/2020', 'C00013', 'A003', 'SOD');
INSERT INTO orders VALUES('200110','3000','500', '04/15/2020', 'C00019', 'A010', 'SOD');
INSERT INTO orders VALUES('200107','4500','900', '08/30/2020', 'C00007', 'A010', 'SOD');
INSERT INTO orders VALUES('200112','2000','400', '05/30/2020', 'C00016', 'A007', 'SOD');
INSERT INTO orders VALUES('200113','4000','600', '06/10/2020', 'C00022', 'A002', 'SOD');
INSERT INTO orders VALUES('200102','2000','300', '05/25/2020', 'C00012', 'A012', 'SOD');
INSERT INTO orders VALUES('200114','3500','2000', '08/15/2020', 'C00002', 'A008', 'SOD');
INSERT INTO orders VALUES('200122','2500','400', '09/16/2020', 'C00003', 'A004', 'SOD');
INSERT INTO orders VALUES('200118','500','100', '07/20/2020', 'C00023', 'A006', 'SOD');
INSERT INTO orders VALUES('200119','4000','700', '09/16/2020', 'C00007', 'A010', 'SOD');
INSERT INTO orders VALUES('200121','1500','600', '09/23/2020', 'C00008', 'A004', 'SOD');
INSERT INTO orders VALUES('200130','2500','400', '07/30/2020', 'C00025', 'A011', 'SOD');
INSERT INTO orders VALUES('200134','4200','1800', '09/25/2020', 'C00004', 'A005', 'SOD');
INSERT INTO orders VALUES('200108','4000','600', '02/15/2020', 'C00008', 'A004', 'SOD');
INSERT INTO orders VALUES('200103','1500','700', '05/15/2020', 'C00021', 'A005', 'SOD');
INSERT INTO orders VALUES('200105','2500','500', '07/18/2020', 'C00025', 'A011', 'SOD');
INSERT INTO orders VALUES('200109','3500','800', '07/30/2020', 'C00011', 'A010', 'SOD');
INSERT INTO orders VALUES('200101','3000','1000', '07/15/2020', 'C00001', 'A008', 'SOD');
INSERT INTO orders VALUES('200111','1000','300', '07/10/2020', 'C00020', 'A008', 'SOD');
INSERT INTO orders VALUES('200104','1500','500', '03/13/2020', 'C00006', 'A004', 'SOD');
INSERT INTO orders VALUES('200106','2500','700', '04/20/2020', 'C00005', 'A002', 'SOD');
INSERT INTO orders VALUES('200125','2000','600', '10/10/2020', 'C00018', 'A005', 'SOD');
INSERT INTO orders VALUES('200117','800','200', '10/20/2020', 'C00014', 'A001', 'SOD');
INSERT INTO orders VALUES('200123','500','100', '09/16/2020', 'C00022', 'A002', 'SOD');
INSERT INTO orders VALUES('200120','500','100', '07/20/2020', 'C00009', 'A002', 'SOD');
INSERT INTO orders VALUES('200116','500','100', '07/13/2020', 'C00010', 'A009', 'SOD');
INSERT INTO orders VALUES('200124','500','100', '06/20/2020', 'C00017', 'A007', 'SOD');
INSERT INTO orders VALUES('200126','500','100', '06/24/2020', 'C00022', 'A002', 'SOD');
INSERT INTO orders VALUES('200129','2500','500', '07/20/2020', 'C00024', 'A006', 'SOD');
INSERT INTO orders VALUES('200127','2500','400', '07/20/2020', 'C00015', 'A003', 'SOD');
INSERT INTO orders VALUES('200128','3500','1500', '07/20/2020', 'C00009', 'A002', 'SOD');
INSERT INTO orders VALUES('200135','2000','800', '09/16/2020', 'C00007', 'A010', 'SOD');
INSERT INTO orders VALUES('200131','900','150', '08/26/2020', 'C00012', 'A012', 'SOD');
INSERT INTO orders VALUES('200133','1200','400', '06/29/2020', 'C00009', 'A002', 'SOD');