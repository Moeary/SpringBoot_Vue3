-- 创建护士表
CREATE TABLE nurse (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       sex ENUM('男', '女') NOT NULL,
                       room VARCHAR(255) NOT NULL,
                       grade VARCHAR(255) NOT NULL
);

-- 插入 20 条随机数据
INSERT INTO nurse (name, sex, room, grade)
SELECT
    -- 生成随机姓名
    CONCAT('护士', i),
    -- 随机选择性别
    CASE WHEN RAND() < 0.5 THEN '男' ELSE '女' END,
    -- 随机生成房间号
    CONCAT('房间', FLOOR(RAND() * 100) + 1),
    -- 随机选择级别
    ELT(FLOOR(RAND() * 3) + 1, '初级', '中级', '高级')
FROM (
         -- 生成 20 行数据
         SELECT 1 AS i UNION ALL
         SELECT 2 UNION ALL
         SELECT 3 UNION ALL
         SELECT 4 UNION ALL
         SELECT 5 UNION ALL
         SELECT 6 UNION ALL
         SELECT 7 UNION ALL
         SELECT 8 UNION ALL
         SELECT 9 UNION ALL
         SELECT 10 UNION ALL
         SELECT 11 UNION ALL
         SELECT 12 UNION ALL
         SELECT 13 UNION ALL
         SELECT 14 UNION ALL
         SELECT 15 UNION ALL
         SELECT 16 UNION ALL
         SELECT 17 UNION ALL
         SELECT 18 UNION ALL
         SELECT 19 UNION ALL
         SELECT 20
     ) AS numbers;