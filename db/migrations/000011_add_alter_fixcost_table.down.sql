DROP INDEX IF EXISTS idx_fix_cost_next_run;
DROP INDEX IF EXISTS ux_tx_fix_cost_run;
DROP INDEX IF EXISTS idx_push_tokens_user_id;

ALTER TABLE fix_costs
DROP COLUMN IF EXISTS last_run_at;

ALTER TABLE transactions
DROP COLUMN IF EXISTS run_date,
DROP COLUMN IF EXISTS fix_cost_id;

DROP TABLE IF EXISTS push_tokens;

