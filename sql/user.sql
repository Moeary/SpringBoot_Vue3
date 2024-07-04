CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      id_number VARCHAR(18) UNIQUE NOT NULL,
                      password VARCHAR(255) NOT NULL,
                      is_admin BOOLEAN DEFAULT FALSE
);
