CREATE TABLE medical_record_disease (
                                        medical_record_id INT(9) NOT NULL,
                                        disease_id INT(9) NOT NULL,
                                        PRIMARY KEY (medical_record_id, disease_id),  -- 联合主键
                                        FOREIGN KEY (medical_record_id) REFERENCES medical_record(id),
                                        FOREIGN KEY (disease_id) REFERENCES disease(id)
);

-- 假设 medical_record 表中 id 为 1 到 20 的记录已存在
-- 假设 disease 表中已有对应疾病的记录

INSERT INTO medical_record_disease (medical_record_id, disease_id) VALUES
   (1, 1),  -- 假设疾病id 1 为“上呼吸道感染”
   (2, 2),  -- 假设疾病id 2 为“急性肠胃炎”
   (3, 3); -- 假设疾病id 3 为“高血压”
