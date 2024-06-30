-- 创建科室表
CREATE TABLE department (
                            id INT(9) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
                            dept_code VARCHAR(64) COMMENT '科室编码，如：SJNK',
                            dept_name VARCHAR(64) COMMENT '科室名称，如：神经内科',
                            dept_type VARCHAR(64) COMMENT '科室类型',
                            delmark INT(1) DEFAULT 1 COMMENT '生效标记，1-正常，0-已删除'
) COMMENT '科室表';

-- 插入20条随机数据
INSERT INTO department (dept_code, dept_name, dept_type) VALUES
                                                             ('SJNK', '神经内科', '临床科室'),
                                                             ('GXWK', '骨外科', '临床科室'),
                                                             ('NK', '内科', '临床科室'),
                                                             ('WK', '外科', '临床科室'),
                                                             ('FCK', '妇产科', '临床科室'),
                                                             ('EK', '儿科', '临床科室'),
                                                             ('ZQNK', '肿瘤内科', '临床科室'),
                                                             ('XYXK', '心血管内科', '临床科室'),
                                                             ('HXNK', '呼吸内科', '临床科室'),
                                                             ('XNKK', '消化内科', '临床科室'),
                                                             ('GNK', '泌尿外科', '临床科室'),
                                                             ('SMK', '烧伤科', '临床科室'),
                                                             ('ZLK', '肿瘤科', '临床科室'),
                                                             ('GXYK', '感染性疾病科', '临床科室'),
                                                             ('JSK', '精神科', '临床科室'),
                                                             ('YYK', '眼科', '临床科室'),
                                                             ('EBK', '耳鼻喉科', '临床科室'),
                                                             ('KQK', '口腔科', '临床科室'),
                                                             ('PFK', '皮肤科', '临床科室'),
                                                             ('ZYXK', '中医科', '临床科室');
