/* 6.1: Create a view of active loans with payments greater than $1000:*/
CREATE VIEW view_active_loans AS
SELECT *  FROM loan_payments
WHERE payment_amount > 1000;

SELECT * FROM view_active_loans;

/*6.2: Create an index on transaction_date in the transactions table for performance optimization:*/
CREATE INDEX index_trans_date ON transactions(transaction_type );