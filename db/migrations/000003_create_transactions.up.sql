CREATE TABLE transactions (
    transaction_id VARCHAR(255) PRIMARY KEY,
    user_id        VARCHAR(255) NOT NULL,
    date           TIMESTAMP NOT NULL,
    type           VARCHAR(50) NOT NULL,

    CONSTRAINT fk_transactions_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);
