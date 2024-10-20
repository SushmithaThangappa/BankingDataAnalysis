/*4.1 Query to retrive Customer Information */
SELECT * FROM customers;

/*4.2: Query accounts for a specific customer */
SELECT * FROM customers WHERE customer_id=10;

/*4.3: Find the customer name and account balance for each account */
SELECT first_name,last_name,balance FROM customers
JOIN accounts 
ON customers.customer_id = accounts.customer_id ;

/*4.4: Analyze customer loan balances: */
 SELECT customer_id,balance AS loan_balance FROM accounts
 ORDER BY customer_id ;

/*4.5: List all customers who have made a transaction in the 2024-03 */
SELECT accounts.customer_id,transactions.transaction_date
FROM accounts
JOIN transactions 
ON accounts.account_id = transactions.account_id 
WHERE 
transaction_date BETWEEN '2024-03-01' AND '2024-03-31'
ORDER BY transaction_date;