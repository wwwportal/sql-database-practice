-- Lab 6B

-- Customers Table:
Create Table Customers (
Customer_ID	int	primary key	not null,
Name	varchar(45)	not null,
Email	varchar(45) 	not null,
Phone_Number	varchar(45)	not null,
Street_Address 	varchar(45)	not null,
City	varchar(45)	not null,
Province	char(2)	not null,
Postal_Code	char(6)	not null
);

-- Orders Table:
CREATE TABLE orders(
Order_ID int		primary key	NOT NULL,
Order_Date 	date 	NOT NULL,
Customer_ID	int	NOT NULL,
Constraint	ordersFK	foreign key(Customer_ID) references customers(Customer_ID) on update cascade
);

-- Product Type Table:
Create Table Product_Type (
Product_Type_ID	int	primary key	not null,
Name	varchar(45)	not null
);

-- Products Table:
CREATE TABLE products(
Product_ID 		int	primary key	NOT NULL,
Name 		varchar(45)		NOT NULL,
Description 	varchar(45)		NOT NULL,
Price 		decimal(6,2)		NOT NULL,
Product_Type_ID int NOT NULL,
Constraint	productsFK	foreign key(Product_Type_ID) references product_type(Product_Type_ID) on update cascade
);

-- Order_Line Table:
CREATE TABLE Order_Line(
Product_ID 	int 	NOT NULL,
Order_ID 	int		NOT NULL,
Quantity 	int		NOT NULL,
Price 		decimal(6,2)	NOT NULL,
Line_Total 	decimal(8,2)	NOT NULL,
Constraint	order_linePK 	primary key(product_ID, order_ID),
Constraint 	order_lineFK1 	foreign key(order_ID) references orders(order_ID) on update cascade,
Constraint	order_lineFK2 	foreign key(Product_ID) references products(Product_ID) on update cascade
);

Insert into customers values
('1', 'Yassine Amraoui', 'yassine.amraoui@gmail.com', '6135551234', '123 Maple Street', 'Ottawa', 'ON', 'K1A0B1');
Insert into customers values
('2', 'Jane Doe', 'jane.doe@gmail.com', '6135555678', '456 Oak Avenue', 'Ottawa', 'ON', 'K1A0B2');
Insert into customers values
('3', 'Alex Johnson', 'alex.johnson@gmail.com', '6135559876', '789 Pine Road', 'Ottawa', 'ON', 'K1A0B3');
Insert into customers values
('4', 'Emily Davis', 'emily.davis@gmail.com', '6135554321', '321 Cedar Lane', 'Ottawa', 'ON', 'K1A0B4');
Insert into customers values
('5', 'Michael Brown', 'michael.brown@gmail.com', '6135556789', '654 Birch Way', 'Ottawa', 'ON', 'K1A0B5');
Insert into customers values
('6', 'Sarah Wilson', 'sarah.wilson@gmail.com', '6135558765', '987 Spruce Street', 'Ottawa', 'ON', 'K1A0B6');

select * from customers;

Insert into product_type values
	('1', 'Software');
Insert into product_type values
	('2', 'Hardware');
Insert into product_type values
	('3', 'Service');

select * from product_type;

Insert into products values (1, 'Windows', 'operating system', '189.99', '1');
Insert into products values ('2', 'Visual Studio', 'integrated development environment', '0.00', '1');
Insert into products values ('3', 'Mouse', 'computer cursor input device', '10.99', '2');
Insert into products values ('4', 'Google drive', 'data storage service', '0.00', '3');
Insert into products values ('5', 'Dell UltraSharp', 'computer monitor', '549.99', '2');
Insert into products values ('6', 'Microsoft 365', 'productivity and collaboration software', '9.99', '3');

select * from products;

Update customers
	Set phone_number = '6137835656'
	Where  customer_ID = 1;

Update customers
	Set postal_code = 'J3H2K7'
	Where  customer_ID = 2;

