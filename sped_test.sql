EXPLAIN ANALYZE
SELECT c.category_name, SUM(t.amount) AS total_spent
FROM Transactions t
JOIN Categories c ON t.category_id = c.category_id
WHERE t.transaction_date >= '2023-01-01'
GROUP BY c.category_name;