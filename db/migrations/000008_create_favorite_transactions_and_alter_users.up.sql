CREATE TABLE favorite_items (
    favorite_id VARCHAR PRIMARY KEY,
    user_id        VARCHAR NOT NULL,
    title          VARCHAR NOT NULL,
    price          NUMERIC(12,2),
    category_id    VARCHAR,
    position       INTEGER NOT NULL,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT fk_items_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_favorite_items_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE INDEX idx_favorite_items_user_id
    ON favorite_items(user_id);

ALTER TABLE users
ADD COLUMN unsubscribed_at TIMESTAMP NULL,
ADD COLUMN deleted_at TIMESTAMP NULL;
