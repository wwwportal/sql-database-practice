
CREATE TABLE orders(
ID int primary key	NOT NULL,
Order_Date 	date NOT NULL
);

CREATE TABLE products(
ID int primary key NOT NULL,
Name varchar(45) NOT NULL,
Description varchar(45)	NOT NULL,
Price decimal(6,2) NOT NULL
);

CREATE TABLE order_line(
Products_ID int NOT NULL,
Orders_ID int NOT NULL,
Quantity int NOT NULL,
Price decimal(6,2) NOT NULL,
Line_Total 	decimal(8,2) NOT NULL,
Constraint	order_linePK primary key(products_ID, orders_ID),
Constraint 	order_lineFK foreign key(orders_ID) references orders(ID),
Constraint	order_lineFK foreign key(products_ID) references products(ID)
);
