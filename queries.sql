-- Получить общий баланс пользователя
SELECT u.username, SUM(a.balance) AS total_balance
FROM Users u
JOIN Accounts a ON u.user_id = a.user_id
WHERE u.user_id = 1
GROUP BY u.username;

-- Получить все транзакции за определенный период
SELECT t.transaction_id, t.amount, t.description, c.category_name
FROM Transactions t
JOIN Categories c ON t.category_id = c.category_id
WHERE t.transaction_date BETWEEN '2024-10-01' AND '2024-10-31';

-- Получить все активные долги пользователя
SELECT d.debt_name, d.amount, d.amount_paid, d.interest_rate
FROM Debts d
WHERE d.user_id = 1 AND d.amount_paid < d.amount;

-- Получить бюджет пользователя по категориям
SELECT c.category_name, SUM(b.amount) AS total_budget
FROM Budgets b
JOIN Categories c ON b.category_id = c.category_id
WHERE b.user_id = 1
GROUP BY c.category_name;
