CREATE TABLE users (
    user_id      VARCHAR(255) PRIMARY KEY,
    google_id    VARCHAR(255),
    name         VARCHAR(15) NOT NULL,
    status       VARCHAR(20) NOT NULL,
    onboarding   BOOLEAN NOT NULL DEFAULT false,
    created_at   TIMESTAMP NOT NULL DEFAULT now(),
    updated_at   TIMESTAMP NOT NULL DEFAULT now()
);
