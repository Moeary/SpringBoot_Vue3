CREATE TABLE drug_info (
                           id INT(9) AUTO_INCREMENT PRIMARY KEY,
                           drug_code VARCHAR(255),
                           drug_name VARCHAR(255),
                           drug_format VARCHAR(255),
                           drug_unit VARCHAR(16),
                           manufacturer VARCHAR(255),
                           drug_dosage VARCHAR(64),
                           drug_type VARCHAR(64),
                           drug_price DECIMAL(8,2),
                           mnemonic_code VARCHAR(255),
                           creation_date DATE
);
INSERT INTO drug_info (drug_code, drug_name, drug_format, drug_unit, manufacturer, drug_dosage, drug_type, drug_price, mnemonic_code, creation_date)
VALUES
-- 以下数据仅供参考，请根据实际情况修改
('A001', '感冒灵颗粒', '10g*9袋', '盒', 'XX药业', '颗粒剂', '非处方药', 12.50, 'ganmaolingkeli', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('B002', '阿莫西林胶囊', '0.25g*12粒', '盒', 'YY制药', '胶囊剂', '处方药', 8.80, 'amoxilinjiaonang', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('C003', '维生素C片', '0.1g*100片', '瓶', 'ZZ药厂', '片剂', '非处方药', 5.60, 'weishengsuspian', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('D004', '布洛芬缓释胶囊', '0.3g*12粒', '盒', 'XX药业', '胶囊剂', '非处方药', 15.90, 'buluofenhuanshijiaonang', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('E005', '复方板蓝根颗粒', '10g*9袋', '盒', 'YY制药', '颗粒剂', '非处方药', 9.90, 'fufangbanlangenkeli', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('F006', '云南白药', '0.25g*10粒', '瓶', 'ZZ药厂', '散剂', '非处方药', 28.50, 'yunnanbaiyao', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('G007', '藿香正气水', '10ml*10支', '盒', 'XX药业', '口服液', '非处方药', 11.20, 'huoxiangzhengqishui', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('H008', '头孢菌素胶囊', '0.25g*12粒', '盒', 'YY制药', '胶囊剂', '处方药', 22.60, 'toubaojunsusuijiaonang', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('I009', '葡萄糖注射液', '500ml', '瓶', 'ZZ药厂', '注射剂', '处方药', 8.90, 'putaotangzhusheye', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY)),
('J010', '生理盐水', '10ml*10支', '盒', 'XX药业', '注射剂', '处方药', 5.20, 'shengliyanshui', DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY));
