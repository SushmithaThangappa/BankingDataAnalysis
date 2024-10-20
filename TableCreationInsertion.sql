USE loandb;
CREATE TABLE customers 
      (
           customer_id INT PRIMARY KEY,
           first_name VARCHAR(50),
           last_name VARCHAR(50),
           address VARCHAR(100),
           city VARCHAR(50),
           state VARCHAR(50),
           zip VARCHAR(20)
       );
CREATE TABLE accounts
(
	account_id INT PRIMARY KEY,
	customer_id INT,
	account_type VARCHAR(50),
	balance DECIMAL(4,2),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions
(
	transaction_id INT PRIMARY KEY,
	account_id INT,
	transaction_date DATE,
	transaction_amount DECIMAL(10,2),
	transaction_type VARCHAR(50),
	FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans
(
	loan_id INT PRIMARY KEY,
	customer_id INT,
	loan_amount DECIMAL(10,2),
	interest_rate DECIMAL(4,2),
	loan_term INT,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE loan_payments
(
	payment_id INT PRIMARY KEY,
	loan_id INT,
	payment_date DATE,
	payment_amount DECIMAL(10,2),
	FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
ALTER TABLE accounts
ALTER COLUMN balance DECIMAL(10,2);

