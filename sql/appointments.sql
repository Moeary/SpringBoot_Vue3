CREATE TABLE appointments (
      id INT AUTO_INCREMENT PRIMARY KEY,
      user_id INT,
      id_number VARCHAR(20),
      appointment_date VARCHAR(10),  -- 改为 VARCHAR 类型
      is_expert BOOLEAN,
      payment_amount DECIMAL(10,2),
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (user_id) REFERENCES user(id),
      FOREIGN KEY (id_number) REFERENCES user(id_number)
);
