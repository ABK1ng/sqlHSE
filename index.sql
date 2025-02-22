CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_accounts_user ON Accounts(user_id);
CREATE INDEX idx_transactions_account ON Transactions(account_id);
CREATE INDEX idx_transactions_date ON Transactions(transaction_date);
CREATE INDEX idx_debts_user ON Debts(user_id);
CREATE INDEX idx_budgets_user ON Budgets(user_id);