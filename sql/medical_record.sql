CREATE TABLE medical_record (
                                id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                register_id INT(9) UNIQUE,  -- 一个挂号记录对应唯一一条病历
                                readme VARCHAR(512),
                                present VARCHAR(512),
                                present_treat VARCHAR(512),
                                history VARCHAR(512),
                                allergy VARCHAR(512),
                                physique VARCHAR(512),
                                proposal VARCHAR(512),
                                careful VARCHAR(512),
                                diagnosis VARCHAR(512),
                                cure VARCHAR(512),
                                FOREIGN KEY (register_id) REFERENCES register(id)
);

-- 假设 register 表中 id 为 1 到 20 的记录已存在

INSERT INTO medical_record (register_id, readme, present, present_treat, history, allergy, physique, proposal, careful, diagnosis, cure) VALUES
       (1, '发热、咳嗽', '体温38.5℃，咳嗽有痰', '口服退烧药', '无', '无', '咽部充血', '血常规检查', '注意休息', '上呼吸道感染', '对症治疗'),
       (2, '腹痛、腹泻', '腹痛剧烈，伴有腹泻', '无', '胃炎', '海鲜', '腹部压痛', '腹部B超', '清淡饮食', '急性肠胃炎', '抗感染治疗'),
       (3, '头痛、头晕', '头痛持续，伴有头晕', '服用止痛药', '高血压', '青霉素', '血压偏高', '头部CT', '按时服药', '高血压', '降压治疗'),
       (20, '腰痛、腿麻', '腰痛剧烈，伴有腿麻', '服用止痛药', '腰椎间盘突出', '无', '腰椎活动受限', '腰椎核磁共振', '避免久坐', '腰椎间盘突出', '保守治疗');
