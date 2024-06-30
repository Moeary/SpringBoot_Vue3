CREATE TABLE check_request (
                               id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                               register_id INT(9) NOT NULL,
                               medical_technology_id INT(9) NOT NULL,
                               check_info VARCHAR(512),
                               check_position VARCHAR(255),
                               creation_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                               check_employee_id INT(9),
                               inputcheck_employee_id INT(9),
                               check_time DATETIME,
                               check_result VARCHAR(512),
                               check_state VARCHAR(64),
                               check_remark VARCHAR(512),
                               FOREIGN KEY (register_id) REFERENCES register(id),
                               FOREIGN KEY (medical_technology_id) REFERENCES medical_technology(id),
                               FOREIGN KEY (check_employee_id) REFERENCES employee(id),
                               FOREIGN KEY (inputcheck_employee_id) REFERENCES employee(id)
);

-- 假设以下数据在关联表中已存在
-- register 表中 id 为 1 到 20 的记录
-- medical_technology 表中 id 为 1 到 3 的记录
-- employee 表中 id 为 1 到 5 的记录

INSERT INTO check_request (register_id, medical_technology_id, check_info, check_position, check_employee_id, inputcheck_employee_id, check_time, check_result, check_state, check_remark)
VALUES
    (1, 1, '常规检查', '头部', 1, 2, '2023-03-02 10:00:00', '正常', '已完成', '无'),
    (2, 2, '复查', '胸部', 2, 3, '2023-03-03 14:30:00', '轻微异常', '已审核', '需复诊'),
    (3, 3, '术后检查', '腹部', 3, 4, '2023-03-04 09:15:00', '恢复良好', '已打印', '无'),
    (20, 1, '定期检查', '腿部', 5, 1, '2023-03-10 16:45:00', '正常', '已完成', '无');