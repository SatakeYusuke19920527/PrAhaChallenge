-- User
INSERT INTO u (uid, uname, email, displayName) VALUES 
('u_0001', 'test1', 'test1@gmail.com', 'テストユーザ1'),
('u_0002', 'test2', 'test2@gmail.com', 'テストユーザ2'),
('u_0003', 'test3', 'test3@gmail.com', 'テストユーザ3'),
('u_0004', 'test4', 'test4@gmail.com', 'テストユーザ4'),
('u_0005', 'test5', 'test5@gmail.com', 'テストユーザ5')

-- ワークスペース
INSERT INTO ws (wsid, wsname) VALUES 
('ws_0001', 'ワークスペース1'),
('ws_0002', 'ワークスペース2'),
('ws_0003', 'ワークスペース3'),
('ws_0004', 'ワークスペース4'),
('ws_0005', 'ワークスペース5')

-- チャネル
INSERT INTO c (cid, wsid, cname) VALUES 
('c_0001', 'ws_0001', 'チャネル1'),
('c_0002', 'ws_0001', 'チャネル2'),
('c_0003', 'ws_0001', 'チャネル3'),
('c_0004', 'ws_0002', 'チャネル4'),
('c_0005', 'ws_0002', 'チャネル5')

-- メッセージ
INSERT INTO m (mid, cid, speaker, message, sendtime) VALUES 
('m_0001','c_0001','u_0001','test message1', '2022/11/15 13:01:12'),
('m_0002','c_0001','u_0002','test message2', '2022/11/15 13:01:13'),
('m_0003','c_0001','u_0001','test message3', '2022/11/15 13:01:14'),
('m_0004','c_0002','u_0002','test message4', '2022/11/15 13:01:15'),
('m_0005','c_0002','u_0001','test message5', '2022/11/15 13:01:16'),
('m_0006','c_0003','u_0002','test message6', '2022/11/15 13:01:17'),
('m_0007','c_0003','u_0001','test message7', '2022/11/15 13:01:18'),
('m_0008','c_0004','u_0004','test message8', '2022/11/15 13:01:17'),
('m_0009','c_0004','u_0005','test message9', '2022/11/15 13:01:18')

-- スレッド
INSERT INTO t (tid, mid, speaker, tmessage,sendtime) VALUES 
('t_0001','m_0001','u_0002','test thread message1', '2022/11/15 14:01:12'),
('t_0002','m_0001','u_0001','test thread message2', '2022/11/15 14:01:13'),
('t_0003','m_0001','u_0002','test thread message3', '2022/11/15 14:01:14'),
('t_0004','m_0002','u_0001','test thread message4', '2022/11/15 14:01:15'),
('t_0005','m_0002','u_0002','test thread message5', '2022/11/15 14:01:16')

-- ワークスペース・ユーザの中間テーブル
INSERT INTO rwu (wsid, uid) VALUES 
('ws_0001','u_0001'),
('ws_0001','u_0002'),
('ws_0001','u_0003'),
('ws_0001','u_0004'),
('ws_0001','u_0005'),
('ws_0002','u_0001'),
('ws_0002','u_0002')

INSERT INTO rcu (cid, uid) VALUES 
('c_0001','u_0001'),
('c_0001','u_0002'),
('c_0001','u_0003'),
('c_0002','u_0001'),
('c_0002','u_0002')

