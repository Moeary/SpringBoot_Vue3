CREATE TABLE inspection_request (
                                    id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                    register_id INT(9) NOT NULL,
                                    medical_technology_id INT(9) NOT NULL,
                                    inspection_info VARCHAR(512),
                                    inspection_position VARCHAR(255),
                                    creation_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                                    inspection_employee_id INT(9),
                                    inputinspection_employee_id INT(9),
                                    inspection_time DATETIME,
                                    inspection_result VARCHAR(512),
                                    inspection_state VARCHAR(64),
                                    inspection_remark VARCHAR(512),
                                    FOREIGN KEY (register_id) REFERENCES register(id),
                                    FOREIGN KEY (medical_technology_id) REFERENCES medical_technology(id),
                                    FOREIGN KEY (inspection_employee_id) REFERENCES employee(id),
                                    FOREIGN KEY (inputinspection_employee_id) REFERENCES employee(id)
);
-- 假设以下数据在关联表中已存在
INSERT INTO inspection_request (register_id, medical_technology_id, inspection_info, inspection_position, inspection_employee_id, inputinspection_employee_id, inspection_time, inspection_result, inspection_state, inspection_remark)
VALUES
    (1, 1, '血常规检查', '血液', 1, 2, '2023-03-02 11:00:00', '正常', '已完成', '无'),
    (2, 2, '尿常规检查', '尿液', 2, 3, '2023-03-03 15:30:00', '轻微异常', '已审核', '需复查'),
    (3, 3, '肝功能检查', '血液', 3, 4, '2023-03-04 10:15:00', '恢复良好', '已打印', '无'),
    (20, 1, '血糖检查', '血液', 5, 1, '2023-03-10 17:45:00', '正常', '已完成', '无');