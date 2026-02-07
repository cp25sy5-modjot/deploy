DROP INDEX IF EXISTS idx_favorite_items_user_id;
DROP TABLE IF EXISTS favorite_items;

DROP COLUMN IF EXISTS unsubscribed_at FROM users;
DROP COLUMN IF EXISTS deleted_at FROM users;
