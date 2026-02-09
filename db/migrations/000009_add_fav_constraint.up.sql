WITH ranked AS (
    SELECT
        favorite_id,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY created_at
        ) AS new_pos
    FROM favorite_items
)
UPDATE favorite_items f
SET position = r.new_pos
FROM ranked r
WHERE f.favorite_id = r.favorite_id;

ALTER TABLE favorite_items
ADD CONSTRAINT uq_favorite_items_user_position
UNIQUE (user_id, position);