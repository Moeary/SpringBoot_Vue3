-- 创建护士表
CREATE TABLE doctor (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      sex ENUM('男', '女') NOT NULL,
      room VARCHAR(255) NOT NULL,
      grade VARCHAR(255) NOT NULL
);