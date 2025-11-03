-- CREATE DATABASE SalesDB

CREATE SCHEMA IF NOT EXISTS sales;

CREATE TABLE IF NOT EXISTS sales.customers(
	customer_id SERIAL primary key,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	phone VARCHAR(15)
);

SELECT column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'sales' AND table_name = 'customers';

CREATE TABLE IF NOT EXISTS sales.products(
	product_id SERIAL primary key,
	product_name VARCHAR(100) NOT NULL,
	price NUMERIC(10,2) NOT NULL,
	stock_quantity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.customers(customer_id),
    order_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS sales.order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.orders(order_id),
    product_id INT REFERENCES sales.products(product_id),
    quantity INT NOT NULL CHECK (quantity >= 1)
);

SELECT column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'sales' AND table_name = 'order_items';
