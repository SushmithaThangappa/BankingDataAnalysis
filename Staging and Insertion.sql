CREATE TABLE accounts_staging_table
(
		   account_id INT,
           customer_id INT,
           account_type VARCHAR(50),
           balance DECIMAL(10, 2)
);
SELECT DISTINCT customer_id FROM accounts_staging_table
WHERE customer_id NOT IN (SELECT customer_id FROM customers);

DELETE FROM accounts_staging_table WHERE customer_id NOT IN (SELECT customer_id FROM customers);

INSERT INTO accounts(account_id,customer_id,account_type,balance) SELECT account_id,customer_id,account_type,balance FROM accounts_staging_table;
SELECT * FROM ACCOUNTS;

CREATE TABLE transations_staging_table
(
			transaction_id INT ,
           account_id INT,
           transaction_date DATE,
           transaction_amount DECIMAL(10, 2),
           transaction_type VARCHAR(50)
);

 DELETE FROM transations_staging_table WHERE account_id NOT IN (SELECT account_id FROM accounts); 
 
INSERT INTO transactions(transaction_id,account_id,transaction_date,transaction_amount,transaction_type)
SELECT transaction_id,account_id,transaction_date,transaction_amount,transaction_type FROM transations_staging_table; 

CREATE TABLE loans_staging_table
(
		   loan_id INT ,
           customer_id INT,
           loan_amount DECIMAL(10, 2),
           interest_rate DECIMAL(5, 2),
           loan_term INT
);

DELETE FROM loans_staging_table WHERE customer_id NOT IN ( SELECT customer_id FROM customers);

INSERT INTO loans(loan_id,customer_id,loan_amount,interest_rate,loan_term)
	SELECT loan_id,customer_id,loan_amount,interest_rate,loan_term FROM loans_staging_table;

SELECT * FROM loans;

CREATE TABLE loan_payments_staging_table
(
           payment_id INT PRIMARY KEY,
           loan_id INT,
           payment_date DATE,
           payment_amount DECIMAL(10, 2)
);
DELETE FROM loan_payments_staging_table WHERE loan_id NOT IN( SELECT loan_id  FROM loans );

INSERT INTO loan_payments(payment_id,loan_id,payment_date,payment_amount)
	SELECT payment_id,loan_id,payment_date,payment_amount FROM loan_payments_staging_table;
