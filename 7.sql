-- Task 2.1
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;
GRANT SELECT, INSERT ON accounts, transactions TO accountant;
GRANT ALL PRIVILEGES ON accounts, customers, transactions TO administrator;
GRANT INSERT, UPDATE, DELETE ON accounts, customers TO support;
-- Task 2.2
CREATE USER user_1;
CREATE USER user_2;
CREATE USER user_3;
GRANT administrator to user_1;
GRANT accountant to user_2;
GRANT support to user_3;
-- Task 2.3
CREATE USER God;
GRANT ALL PRIVILEGES on accounts, customers, transactions TO God WITH GRANT OPTION;
-- Task 2.4
REVOKE ALL PRIVILEGES ON accounts, customers, transactions FROM GOD;
-- Task 3.2
ALTER TABLE customers
    ALTER COLUMN name SET NOT NULL;
ALTER TABLE customers
    ALTER COLUMN birth_date SET NOT NULL;
-- Task 5.1
CREATE INDEX acc_cur ON accounts (customer_id, currency);
-- Task 5.2
CREATE INDEX cur_bal ON accounts (currency, balance);
-- Task 6
DO
$$
    DECLARE
        bal INT;
        lim INT;
    BEGIN
--         SAVEPOINT s1;
        UPDATE accounts
        SET balance = balance - 400
        WHERE account_id = 'RS88012';
        UPDATE accounts
        SET balance = balance + 400
        WHERE account_id = 'NT10204';
        SELECT balance INTO bal FROM accounts WHERE account_id = 'RS88012';
        SELECT accounts.limit INTO lim FROM accounts WHERE account_id = 'RS88012';
        IF bal < lim THEN
--             ROLLBACK TO SAVEPOINT s1;
            UPDATE transactions SET status = 'rollback' WHERE id = 3;
        ELSE
            COMMIT;
            UPDATE transactions SET status = 'commited' WHERE id = 3;
        END IF;
    END;
$$
