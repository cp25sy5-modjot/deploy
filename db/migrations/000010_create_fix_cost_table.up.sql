-- ========================================
-- ENUM TYPES
-- ========================================

CREATE TYPE fix_cost_status AS ENUM (
    'active',
    'paused',
    'finished'
);

CREATE TYPE interval_type AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly'
);

-- ========================================
-- TABLE: fix_costs
-- ========================================

CREATE TABLE fix_costs (
    fix_cost_id VARCHAR PRIMARY KEY,
    user_id VARCHAR NOT NULL,
    title VARCHAR(255) NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    category_id VARCHAR NOT NULL,

    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NULL,
    remaining_runs INT NULL,

    interval_type interval_type NOT NULL,
    interval_value INT NOT NULL CHECK (interval_value > 0),

    next_run_date TIMESTAMP NOT NULL,
    status fix_cost_status NOT NULL DEFAULT 'active',

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_fix_cost_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_fix_cost_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE RESTRICT
);

-- ========================================
-- INDEXES
-- ========================================

CREATE INDEX idx_fix_costs_next_run_date
ON fix_costs(next_run_date);

CREATE INDEX idx_fix_costs_status
ON fix_costs(status);

CREATE INDEX idx_fix_costs_user_id
ON fix_costs(user_id);

ALTER TABLE fix_costs
ADD CONSTRAINT chk_remaining_runs_positive
CHECK (remaining_runs IS NULL OR remaining_runs > 0);