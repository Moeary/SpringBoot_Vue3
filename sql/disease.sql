CREATE TABLE disease (
                         id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         disease_code VARCHAR(64),
                         disease_name VARCHAR(255) NOT NULL,
                         diseaseICD VARCHAR(64),
                         disease_category VARCHAR(64)
);

INSERT INTO disease (disease_code, disease_name, diseaseICD, disease_category) VALUES
       ('URTI', '上呼吸道感染', 'J06.9', '呼吸系统疾病'),
       ('AGE', '急性肠胃炎', 'K52.9', '消化系统疾病'),
       ('HTN', '高血压', 'I10', '循环系统疾病'),
       ('HIVD', '腰椎间盘突出', 'M51.1', '骨骼肌肉系统疾病'),
       ('DM', '糖尿病', 'E11.9', '内分泌系统疾病'),
       ('Asthma', '哮喘', 'J45.9', '呼吸系统疾病'),
       ('AR', '过敏性鼻炎', 'J30.9', '耳鼻喉科疾病'),
       ('UTI', '尿路感染', 'N39.0', '泌尿系统疾病'),
       ('GA', '胃炎', 'K29.9', '消化系统疾病'),
       ('HA', '头痛', 'R51', '神经系统疾病'),
       ('Dermatitis', '皮炎', 'L30.9', '皮肤科疾病'),
       ('Conjunctivitis', '结膜炎', 'H10.9', '眼科疾病'),
       ('Pharyngitis', '咽炎', 'J02.9', '耳鼻喉科疾病'),
       ('Bronchitis', '支气管炎', 'J40', '呼吸系统疾病'),
       ('Pneumonia', '肺炎', 'J18.9', '呼吸系统疾病'),
       ('Otitis Media', '中耳炎', 'H66.9', '耳鼻喉科疾病'),
       ('Sinusitis', '鼻窦炎', 'J32.9', '耳鼻喉科疾病'),
       ('Cystitis', '膀胱炎', 'N30.0', '泌尿系统疾病'),
       ('GERD', '胃食管反流病', 'K21.9', '消化系统疾病'),
       ('IBS', '肠易激综合征', 'K58.9', '消化系统疾病');
