CREATE TABLE prescription (
                              id INT(9) AUTO_INCREMENT PRIMARY KEY,
                              register_id INT(9),
                              drug_id INT(9),
                              drug_usage VARCHAR(255),
                              drug_number VARCHAR(255),
                              creation_time DATETIME,
                              drug_state VARCHAR(64),
                              FOREIGN KEY (register_id) REFERENCES disease(id),  -- 假设存在名为"病历表"的表，并将 register_id 关联到该表的 id
                              FOREIGN KEY (drug_id) REFERENCES drug_info(id)   -- 假设存在名为"药品表"的表，并将 drug_id 关联到该表的 id
);

-- 插入 20 条随机数据
INSERT INTO prescription (register_id, drug_id, drug_usage, drug_number, creation_time, drug_state)
SELECT
        FLOOR(RAND() * 10) + 1,  -- 假设病历表 id 范围为 1-10，请根据实际情况修改
        FLOOR(RAND() * 20) + 1,  -- 假设药品表 id 范围为 1-20，请根据实际情况修改
        CASE FLOOR(RAND() * 3)
            WHEN 0 THEN '口服，一日三次，每次一片'
            WHEN 1 THEN '静脉注射，一日一次'
            ELSE '外用，一日两次'
            END,
        CONCAT(FLOOR(RAND() * 10) + 1,
               CASE FLOOR(RAND() * 3)
                   WHEN 0 THEN '盒'
                   WHEN 1 THEN '瓶'
                   ELSE '支'
                   END),
        DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY),  -- 随机生成过去一年内的日期
        CASE FLOOR(RAND() * 2)
            WHEN 0 THEN '未取药'
            ELSE '已取药'
            END
FROM DUAL
LIMIT 20;