-- ----------------------------------------
-- 1) Drop new constraints
-- ----------------------------------------
ALTER TABLE fix_costs
DROP CONSTRAINT IF EXISTS chk_run_count_not_exceed_max;

ALTER TABLE fix_costs
DROP CONSTRAINT IF EXISTS chk_run_count_positive;

ALTER TABLE fix_costs
DROP CONSTRAINT IF EXISTS chk_max_run_positive;

-- ----------------------------------------
-- 2) Drop run_count column
-- ----------------------------------------
ALTER TABLE fix_costs
DROP COLUMN IF EXISTS run_count;

-- ----------------------------------------
-- 3) Rename max_run -> remaining_runs
-- ----------------------------------------
ALTER TABLE fix_costs
RENAME COLUMN max_run TO remaining_runs;

-- ----------------------------------------
-- 4) Restore old constraint
-- ----------------------------------------
ALTER TABLE fix_costs
ADD CONSTRAINT chk_remaining_runs_positive
CHECK (
    remaining_runs IS NULL
    OR remaining_runs > 0
);
