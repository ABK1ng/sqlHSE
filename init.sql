-- Пользователи
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_user VARCHAR(255) NOT NULL,
    login_user VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Счета
CREATE TABLE Accounts (
    account_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    account_name VARCHAR(100) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    currency VARCHAR(10) NOT NULL
);

-- Категории
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    is_income BOOLEAN DEFAULT FALSE
);

-- Транзакции 
CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES Accounts(account_id) ON DELETE CASCADE,
    category_id INT REFERENCES Categories(category_id) ON DELETE SET NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    place VARCHAR(100),
    file_path VARCHAR(255), 
);

-- Долги
CREATE TABLE Debts (
    debt_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    debt_name VARCHAR(100) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL, 
    amount_paid DECIMAL(15, 2) DEFAULT 0.00, 
    interest_rate DECIMAL(5, 2) DEFAULT 0.00,
    description TEXT, 
);

-- Бюджет
CREATE TABLE Budgets (
    budget_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    category_id INT REFERENCES Categories(category_id) ON DELETE SET NULL,
    amount DECIMAL(15, 2) NOT NULL,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
);