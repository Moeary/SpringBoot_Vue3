CREATE TABLE disposal_request (
  id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  register_id INT(9) NOT NULL,
  medical_technology_id INT(9) NOT NULL,
  disposal_info VARCHAR(512),
  disposal_position VARCHAR(255),
  creation_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  disposal_employee_id INT(9),
  inputdisposal_employee_id INT(9),
  disposal_time DATETIME,
  disposal_result VARCHAR(512),
  disposal_state VARCHAR(64),
  disposal_remark VARCHAR(512),
  FOREIGN KEY (register_id) REFERENCES register(id),
  FOREIGN KEY (medical_technology_id) REFERENCES medical_technology(id),
  FOREIGN KEY (disposal_employee_id) REFERENCES employee(id),
  FOREIGN KEY (inputdisposal_employee_id) REFERENCES employee(id)
);

INSERT INTO disposal_request (register_id, medical_technology_id, disposal_info, disposal_position, disposal_employee_id, inputdisposal_employee_id, disposal_time, disposal_result, disposal_state, disposal_remark)
VALUES
    (1, 1, '输液治疗', '静脉', 1, 2, '2023-03-02 12:00:00', '完成', '已完成', '无'),
    (2, 2, '伤口包扎', '手臂', 2, 3, '2023-03-03 16:30:00', '已包扎', '已审核', '需换药'),
    (3, 3, '雾化治疗', '呼吸道', 3, 4, '2023-03-04 11:15:00', '完成', '已打印', '无'),
    (20, 1, '注射治疗', '肌肉', 5, 1, '2023-03-10 18:45:00', '完成', '已完成', '无');