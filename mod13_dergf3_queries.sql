--Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.
CREATE VIEW paymentPerRep AS
SELECT a.name, SUM(c.payments) AS total
FROM salesAgents a
JOIN customers c ON a.agentID = c.agentID
GROUP BY a.name;

--Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.
CREATE VIEW paymentByCountry AS
SELECT a.country, SUM(c.payments) as total
FROM salesAgents a
JOIN customers c ON a.agentID = c.agentID
GROUP BY a.agentID;

--Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.
SELECT o.orderID, c.custName, a.name, SUM(a.commission)
FROM salesAgents a
JOIN customers c ON a.agentID = c.agentID
JOIN orders o ON a.agentID = o.agentID
GROUP BY c.custName, o.orderID;

--In the customers table, for customers from NY update the city value to change it from “NY” to “New York”.
--A. Now write an query to select all customers from New York City.
UPDATE customers
SET city = 'New York'
WHERE city = 'NY';

CREATE VIEW custFromNewYork AS
SELECT *
FROM customers
WHERE city = 'New York';

--Increase the commission for sales agents from Canada by 20%.
--B. Calculate the commission for each order where the agent is from Canada. Display order id, customer name, agent name, and commission amount.
UPDATE salesAgents
SET commission = commission + (commission * .20)
WHERE country = 'CAN';

SELECT o.orderID, c.custName, a.name, a.commission
FROM salesAgents a
JOIN customers c ON a.agentID = c.agentID
JOIN orders o ON a.agentID = o.agentID
WHERE a.country = 'CAN';

--Update customers with level 0 to level 1.
--C. Select all customers names and cust id with level 1.

UPDATE customers c
SET c.level = 1
WHERE c.level = 0;

SELECT *
FROM customers c
WHERE c.level = 1;

--Delete sales agents from NH.
--E. Write a query to select all columns for all sales agents
DELETE FROM salesAgents
WHERE state = 'NH';

SELECT *
FROM salesAgents;

--Delete customers whose name begins with “W”.
--F. Select all columns for all customers.
DELETE FROM customers
WHERE custName LIKE 'W%';

SELECT *
FROM customers;