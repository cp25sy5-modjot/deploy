CREATE INDEX idx_users_google_id ON users(google_id);
CREATE INDEX idx_categories_user_id ON categories(user_id);
CREATE INDEX idx_transactions_user_date
    ON transactions(user_id, date DESC);
CREATE INDEX idx_items_transaction_id
    ON transaction_items(transaction_id);
CREATE INDEX idx_items_category_id
    ON transaction_items(category_id);
