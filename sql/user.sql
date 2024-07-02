CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      id_number VARCHAR(18) UNIQUE NOT NULL,
                      password VARCHAR(255) NOT NULL,
                      is_admin BOOLEAN DEFAULT FALSE
);
INSERT INTO user (id_number, password, is_admin) VALUES
     ('340521200304075217', '111111', TRUE), -- 管理员
     ('420114200405172213', '111111', FALSE); -- 普通用户
