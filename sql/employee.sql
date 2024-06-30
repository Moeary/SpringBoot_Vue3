-- 创建医院员工表
CREATE TABLE employee (
                          id INT(9) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
                          deptment_id INT(9) COMMENT '所在科室id',
                          regist_level_id INT(9) COMMENT '挂号级别id',
                          scheduling_id INT(9) COMMENT '排班id',
                          realname VARCHAR(64) COMMENT '真实姓名',
                          password VARCHAR(64) COMMENT '密码',
                          delmark INT(1) DEFAULT 1 COMMENT '生效标记，1-生效，0-已删除',
                          FOREIGN KEY (deptment_id) REFERENCES department(id),
                          FOREIGN KEY (regist_level_id) REFERENCES regist_level(id),
                          FOREIGN KEY (scheduling_id) REFERENCES scheduling(id)
) COMMENT '医院员工表';

-- 插入20条随机数据
INSERT INTO employee (deptment_id, regist_level_id, scheduling_id,  realname, password) VALUES
                                                                                            (1, 1, 1, '张三', '123456'),
                                                                                            (2, 2, 2, '李四', 'abcdef'),
                                                                                            (3, 3, 3, '王五', 'password'),
                                                                                            (1, 2, 4, '赵六', 'qwerty'),
                                                                                            (2, 1, 5, '孙七', 'zxcvbn'),
                                                                                            (3, 3, 6, '周八', 'asdfgh'),
                                                                                            (1, 1, 7, '吴九', 'poiuyt'),
                                                                                            (2, 2, 8, '郑十', 'lkjhgf'),
                                                                                            (3, 1, 9, '陈十一', 'mnbvcx'),
                                                                                            (1, 3, 10, '杨十二', '1qaz2wsx'),
                                                                                            (2, 1, 11, '何十三', '3edc4rfv'),
                                                                                            (3, 2, 12, '马十四', '5tgb6yhn'),
                                                                                            (1, 3, 13, '林十五', '7ujm8ik'),
                                                                                            (2, 2, 14, '刘十六', '9olp0'),
                                                                                            (3, 1, 15, '郭十七', '123qwe'),
                                                                                            (1, 2, 16, '朱十八', '456rty'),
                                                                                            (2, 3, 17, '徐十九', '789uio'),
                                                                                            (3, 1, 18, '沈二十', 'asd123'),
                                                                                            (1, 2, 19, '曹二十一', 'fgh456'),
                                                                                            (2, 1, 20, '黄二十二', 'jkl789');