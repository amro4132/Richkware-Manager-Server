-- Postgres-compatible initialization for Richkware DB
-- The database is created by Postgres when using POSTGRES_DB env; this script creates tables

CREATE TABLE IF NOT EXISTS app_user (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS device (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    ip VARCHAR(255),
    user_id BIGINT,
    CONSTRAINT fk_device_user FOREIGN KEY (user_id) REFERENCES app_user(id)
);

CREATE TABLE IF NOT EXISTS device_info (
    id BIGSERIAL PRIMARY KEY,
    device_id BIGINT,
    info_key VARCHAR(255),
    info_value TEXT,
    CONSTRAINT fk_deviceinfo_device FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE IF NOT EXISTS rmc (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    user_id BIGINT,
    CONSTRAINT fk_rmc_user FOREIGN KEY (user_id) REFERENCES app_user(id)
);

CREATE TABLE IF NOT EXISTS configuration (
    id BIGSERIAL PRIMARY KEY,
    config_key VARCHAR(255) UNIQUE,
    config_value TEXT
);

CREATE TABLE IF NOT EXISTS location (
    id BIGSERIAL PRIMARY KEY,
    latitude double precision,
    longitude double precision,
    device_id BIGINT,
    CONSTRAINT fk_location_device FOREIGN KEY (device_id) REFERENCES device(id)
);