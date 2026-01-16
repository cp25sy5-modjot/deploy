CREATE INDEX idx_items_tx_cat
ON transaction_items(transaction_id, category_id);
CREATE INDEX idx_items_cat_price
ON transaction_items(category_id, price);