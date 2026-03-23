DROP CONSTRAINT IF EXISTS chk_remaining_runs_non_negative;

ALTER TABLE fix_costs
ADD CONSTRAINT chk_remaining_runs_positive
CHECK (remaining_runs IS NULL OR remaining_runs > 0);