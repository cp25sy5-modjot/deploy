CREATE TABLE categories (
    category_id   VARCHAR(255) PRIMARY KEY,
    user_id       VARCHAR(255) NOT NULL,
    category_name VARCHAR(20) NOT NULL,
    budget        NUMERIC(12,2),
    color_code    VARCHAR(7),
    created_at    TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT fk_categories_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);
