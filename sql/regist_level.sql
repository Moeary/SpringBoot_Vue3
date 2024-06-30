-- 创建挂号级别表
CREATE TABLE regist_level (
  id INT(9) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
  regist_code VARCHAR(64) COMMENT '号别编码',
  regist_name VARCHAR(64) COMMENT '号别名称',
  regist_fee DECIMAL(8,2) COMMENT '挂号费',
  regist_quota INT(5) COMMENT '挂号限额',
  sequence_no INT(3) COMMENT '显示顺序号',
  delmark INT(1) DEFAULT 1 COMMENT '生效标记，1-正常，0-已删除'
) COMMENT '挂号级别表';

-- 插入示例数据
INSERT INTO regist_level (regist_code, regist_name, regist_fee, regist_quota, sequence_no) VALUES
('PT', '普通号', 10.00, 200, 1),
('ZJ', '专家号', 50.00, 50, 2),
('TSGH', '特需挂号', 200.00, 20, 3);