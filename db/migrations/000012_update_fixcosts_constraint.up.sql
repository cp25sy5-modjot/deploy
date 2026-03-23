ALTER TABLE fix_costs
DROP CONSTRAINT chk_remaining_runs_positive;

ALTER TABLE fix_costs
ADD CONSTRAINT chk_remaining_runs_non_negative
CHECK (remaining_runs >= 0);