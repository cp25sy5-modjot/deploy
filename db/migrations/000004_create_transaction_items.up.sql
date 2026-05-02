CREATE TABLE transaction_items (
    transaction_id VARCHAR(255) NOT NULL,
    item_id        VARCHAR(255) NOT NULL,
    title          VARCHAR(20) NOT NULL,
    price          NUMERIC(12,2) NOT NULL,
    category_id    VARCHAR(255),

    PRIMARY KEY (transaction_id, item_id),

    CONSTRAINT fk_items_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_items_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE SET NULL
);
