ALTER TABLE fix_costs
RENAME COLUMN remaining_runs TO max_run;

ALTER TABLE fix_costs
RENAME CONSTRAINT chk_remaining_runs_non_negative
TO chk_max_run_positive;

ALTER TABLE fix_costs
ADD COLUMN run_count INT NOT NULL DEFAULT 0;

ALTER TABLE fix_costs
DROP CONSTRAINT IF EXISTS chk_max_run_positive;

ALTER TABLE fix_costs
ADD CONSTRAINT chk_max_run_positive
CHECK (max_run IS NULL OR max_run >= 0);

ALTER TABLE fix_costs
ADD CONSTRAINT chk_run_count_positive
CHECK (run_count >= 0);
