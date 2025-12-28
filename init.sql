CREATE DATABASE IF NOT EXISTS richkware;

USE richkware;

CREATE TABLE IF NOT EXISTS user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS device (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    ip VARCHAR(255),
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS device_info (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    device_id BIGINT,
    info_key VARCHAR(255),
    info_value TEXT,
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE IF NOT EXISTS rmc (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS configuration (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    config_key VARCHAR(255) UNIQUE,
    config_value TEXT
);

CREATE TABLE IF NOT EXISTS location (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    latitude DOUBLE,
    longitude DOUBLE,
    device_id BIGINT,
    FOREIGN KEY (device_id) REFERENCES device(id)
);