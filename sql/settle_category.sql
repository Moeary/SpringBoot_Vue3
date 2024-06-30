-- 创建结算类别表
CREATE TABLE settle_category (
                                 id INT(9) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
                                 settle_code VARCHAR(64) COMMENT '类别编码',
                                 settle_name VARCHAR(64) COMMENT '类别名称',
                                 sequence_no INT(3) COMMENT '显示顺序号',
                                 delmark INT(1) DEFAULT 1 COMMENT '生效标记，1-正常，0-已删除'
) COMMENT '结算类别表';

-- 插入示例数据
INSERT INTO settle_category (settle_code, settle_name, sequence_no) VALUES
       ('ZJ', '自费', 1),
       ('YB', '医保', 2),
       ('GJ', '公费', 3);