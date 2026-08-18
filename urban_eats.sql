START TRANSACTION;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS locations;


CREATE TABLE locations(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
location_name VARCHAR(50) NOT NULL,
location_city VARCHAR(100) NOT NULL);

CREATE TABLE menu_items(
item_name VARCHAR(50) NOT NULL,
item_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
customer_name VARCHAR(50) NOT NULL,
customer_email VARCHAR(50) NOT NULL,
customer_loyalty_points INT DEFAULT 0
);

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
order_location VARCHAR(50) NOT NULL,
customer_id INT NOT NULL,
location_id INT NOT NULL,
order_date DATE,
order_total DECIMAL(10,2),

FOREIGN KEY (customer_id) REFERENCES customers(id),
FOREIGN KEY (location_id) REFERENCES locations(id)
);

INSERT INTO locations(location_name,location_city) VALUES
('Urban Eats Highway K','O-FALLON'),
('Urban Eats Manchester Rd','Manchester'),
('Urban Eats St peters Rd','St peters');

INSERT INTO menu_items(item_name,item_price) VALUES
('Pizza','9.99'),
('Pasta','15.99'),
('Lemonade','3.99');

INSERT INTO customers(customer_name,customer_email,customer_loyalty_points) VALUES
('Sugi','sugi@gmail.com',50),
('Lakshmi','lakshmi@gmail.com',20),
('Sam','sam@gmail.com',30);

INSERT INTO orders(order_location,customer_id,location_id,order_date,order_total) VALUES
('Urban Eats Highway K','1','1','2026-07-19',100.89),
('Urban Eats Manchester','2','3','2026-06-12',50.89),
('Urban Eats Highway K','1','2','2026-07-13',40.89);


ROLLBACK;


