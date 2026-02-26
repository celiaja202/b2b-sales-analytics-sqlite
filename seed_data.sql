
BEGIN TRANSACTION;

INSERT INTO accounts VALUES
(1,'Account_01','UK','Mid-market','Manufacturing'),
(2,'Account_02','Italy','Mid-market','Automotive'),
(3,'Account_03','Germany','SMB','Construction');

INSERT INTO products VALUES
(1,'SKU-PPE-001','PPE',20),
(2,'SKU-TOO-002','Tools',35),
(3,'SKU-ELE-003','Electrical',15);

INSERT INTO quotes VALUES
(1,1,'Celia','Inbound','2025-01-10','Won',5),
(2,2,'Rep_A','Outbound','2025-02-01','Lost',14),
(3,3,'Celia','Inbound','2025-02-15','Won',3);

INSERT INTO quote_lines VALUES
(1,1,1,10,30,0.05),
(2,1,2,5,50,0.08),
(3,2,3,20,22,0.10),
(4,3,1,15,28,0.02);

INSERT INTO orders VALUES
(1,1,1,'2025-01-15','2025-01-20','Shipped'),
(2,3,3,'2025-02-20','2025-02-23','Shipped');

INSERT INTO order_items VALUES
(1,1,1,10,30,20),
(2,1,2,5,50,35),
(3,2,1,15,28,20);

COMMIT;
