-- 创建排班规则表
CREATE TABLE scheduling (
                            id INT(9) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
                            rule_name VARCHAR(64) COMMENT '排班规则名称',
                            week_rule VARCHAR(14) COMMENT '星期规则，例如：1111110 表示周一到周六上班，周日休息',
                            delmark INT(1) DEFAULT 1 COMMENT '生效标记，1-正常，0-已删除'
) COMMENT '排班规则表';

-- 插入示例数据
INSERT INTO scheduling (rule_name, week_rule) VALUES
                                                  ('每周一到周五', '1111100'),
                                                  ('每周一三五', '1010100'),
                                                  ('每天', '1111111');