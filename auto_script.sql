-- Заполнение таблицы Users
INSERT INTO Users (username, email, password_user, login_user)
SELECT 
    'user' || num,
    'user' || num || '@example.com',
    md5(random()::text),
    'login' || num
FROM generate_series(1, 10) AS num;

-- Заполнение таблицы Accounts
INSERT INTO Accounts (user_id, account_name, balance, currency)
SELECT 
    (SELECT user_id FROM Users ORDER BY random() LIMIT 1),
    'Account ' || num,
    (random() * 10000)::DECIMAL(15, 2),
    CASE (random() * 2)::INT
        WHEN 0 THEN 'USD'
        WHEN 1 THEN 'EUR'
        ELSE 'RUB'
    END
FROM generate_series(1, 20) AS num;

-- Заполнение таблицы Categories
INSERT INTO Categories (category_name, is_income)
VALUES 
    ('Salary', TRUE),
    ('Food', FALSE),
    ('Transport', FALSE),
    ('Entertainment', FALSE),
    ('Utilities', FALSE);

-- Заполнение таблицы Transactions
INSERT INTO Transactions (account_id, category_id, amount, description, place, file_path)
SELECT 
    (SELECT account_id FROM Accounts ORDER BY random() LIMIT 1),
    (SELECT category_id FROM Categories ORDER BY random() LIMIT 1),
    (random() * 1000 - 500)::DECIMAL(15, 2),
    'Transaction ' || num,
    'Place ' || (random() * 10)::INT,
    '/path/to/image' || num || '.jpg'
FROM generate_series(1, 100) AS num;

-- Заполнение таблицы Debts
INSERT INTO Debts (user_id, debt_name, amount, amount_paid, interest_rate, description)
SELECT 
    (SELECT user_id FROM Users ORDER BY random() LIMIT 1),
    'Debt ' || num,
    (random() * 5000)::DECIMAL(15, 2),
    (random() * 1000)::DECIMAL(15, 2),
    (random() * 10)::DECIMAL(5, 2),
    'Description for debt ' || num
FROM generate_series(1, 15) AS num;

-- Заполнение таблицы Budgets
INSERT INTO Budgets (user_id, category_id, amount, start_date, end_date)
SELECT 
    (SELECT user_id FROM Users ORDER BY random() LIMIT 1),
    (SELECT category_id FROM Categories ORDER BY random() LIMIT 1),
    (random() * 2000)::DECIMAL(15, 2),
    NOW() - (random() * 365)::INT * INTERVAL '1 day',
    NOW() + (random() * 365)::INT * INTERVAL '1 day'
FROM generate_series(1, 10) AS num;