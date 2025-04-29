-- Set the root password
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');
SELECT 'Root password is set to password' AS message;

-- Create database
CREATE DATABASE IF NOT EXISTS madhav;
SELECT 'Database madhav created.....' AS message;

-- Use database
USE madhav;
SELECT 'Using database madhav' AS message;

-- Create table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
SELECT 'Table users created' AS message;

INSERT INTO users (username, email) VALUES 
('madhav', 'acharyamadan351@gmail.com');
SELECT 'Madhav Data is inserted now enjoy...' AS message;

-- Display inserted records
SELECT * FROM users;
