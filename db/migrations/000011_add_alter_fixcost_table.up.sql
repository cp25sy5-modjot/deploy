CREATE TABLE push_tokens (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    token TEXT NOT NULL UNIQUE,
    platform TEXT,
    device_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_push_tokens_user_id
ON push_tokens (user_id);

ALTER TABLE transactions
ADD COLUMN run_date DATE NULL,
ADD COLUMN fix_cost_id TEXT NULL;

CREATE UNIQUE INDEX ux_tx_fix_cost_run
ON transactions (fix_cost_id, run_date)
WHERE fix_cost_id IS NOT NULL;

ALTER TABLE fix_costs
ADD COLUMN last_run_at TIMESTAMP WITH TIME ZONE NULL;

CREATE INDEX idx_fix_cost_next_run
ON fix_costs (status, next_run_date);