/* 5.1: Calculate the total balance across all accounts for each customer*/
SELECT 
customers.customer_id, customers.first_name ,SUM(accounts.balance) AS Totalbalance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id,customers.first_name;

/* 5.2: Calculate the average loan amount for each loan term*/
SELECT loan_term, AVG(loan_amount) AS loan_average FROM loans GROUP BY loan_term;

/* 5.3: Find the total loan amount and interest across all loans*/
SELECT loan_id, SUM(interest_rate) AS total_interest_amount, SUM(loan_amount ) AS total_loan_amount
FROM loans GROUP BY loan_id;

/* 5.4:  Find the most frequent transaction type*/
SELECT transaction_type , COUNT(transaction_type) transaction_frequency FROM transactions
GROUP BY transaction_type
ORDER BY transaction_frequency DESC;

/*  Analyze transactions by account and transaction type*/
SELECT accounts.account_type, transactions.transaction_type,
AVG(accounts.balance) AS average_balance,
SUM(accounts.balance) AS total_balance,
AVG(transactions.transaction_amount ) AS average_transaction_amount,
SUM(transactions.transaction_amount ) AS total_transaction_amount,
FROM accounts
JOIN transactions
ON transactions.account_id = accounts.account_id
GROUP BY accounts.account_type, transactions.transaction_type;





