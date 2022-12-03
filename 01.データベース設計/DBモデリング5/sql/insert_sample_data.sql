-- User
INSERT INTO u (uid, uname, email, displayName) VALUES 
('u_0001', 'test1', 'test1@gmail.com', 'テストユーザ1'),
('u_0002', 'test2', 'test2@gmail.com', 'テストユーザ2'),
('u_0003', 'test3', 'test3@gmail.com', 'テストユーザ3'),
('u_0004', 'test4', 'test4@gmail.com', 'テストユーザ4'),
('u_0005', 'test5', 'test5@gmail.com', 'テストユーザ5')

-- Slack
INSERT INTO s (sid, workspace, channel) VALUES 
('s_0001','praha1','#_question'),
('s_0002','praha1','#_review'),
('s_0003','praha1','#_todays_work'),
('s_0004','praha1','#_運営からの連絡'),
('s_0005','praha1','#_twitter')

-- PeriodType
INSERT INTO pt (ptid, periodType) VALUES 
('p_0001','hour'),
('p_0002','day'),
('p_0003','week'),
('p_0004','month')

-- Reminder
INSERT INTO r (rid, settingUser,settingNumber ,ptid, content) VALUES 
('r_0001','u_0001', 1, 'p_0001', 'task1 終わりましたか？'),
('r_0002','u_0002', 2, 'p_0002', 'task2 終わりましたか？'),
('r_0003','u_0003', 3, 'p_0003', 'task3 終わりましたか？')

-- To
INSERT INTO t (rid, address,channelOrUser) VALUES 
('r_0001','u_0001',0),
('r_0001','u_0002',0),
('r_0001','u_0003',0),
('r_0002','praha1¥#_question',1),
('r_0003','praha1',1)