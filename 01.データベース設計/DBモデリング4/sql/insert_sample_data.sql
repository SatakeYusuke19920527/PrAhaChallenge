-- User
INSERT INTO u (uid, uname, email, displayName) VALUES 
('u_0001', 'test1', 'test1@gmail.com', 'テストユーザ1'),
('u_0002', 'test2', 'test2@gmail.com', 'テストユーザ2'),
('u_0003', 'test3', 'test3@gmail.com', 'テストユーザ3'),
('u_0004', 'test4', 'test4@gmail.com', 'テストユーザ4'),
('u_0005', 'test5', 'test5@gmail.com', 'テストユーザ5')

-- File
INSERT INTO f (fid, fname, directoryPath, sortNo, owner, updateUser, content, history) VALUES 
('f_0001','f_name_001','test1¥test2¥test3','test1¥test2¥test3_0001','u_0001','u_0002',"test content 1",'更新しました 1'),
('f_0002','f_name_002','test1¥test2','test1¥test2_0001','u_0001','','',''),
('f_0003','f_name_003','test1','test1_0001','u_0001','','',''),
('f_0004','f_name_004','test1¥test2','test1¥test2_0001','u_0001','','',''),
('f_0005','f_name_005','test1¥test2¥test3','test1¥test2¥test3_0002','u_0005','u_0002',"test content 5",'更新しました 5')
