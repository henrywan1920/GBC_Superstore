/* Create tables in the database GBC_Superstore. */
USE GBC_Superstore;

/* Create table people */
CREATE TABLE IF NOT EXISTS people (
	regional_manager VARCHAR(255) NOT NULL,
	region ENUM('West', 'East', 'Central', 'South', 'North') NOT NULL,
	PRIMARY KEY (regional_manager)
);

/* Create table customers */
CREATE TABLE IF NOT EXISTS customers (
	customer_id VARCHAR(64) NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    segment ENUM('Consumer', 'Corporate', 'Home Office') NOT NULL,
	PRIMARY KEY (customer_id)
);

/* Create table address */
CREATE TABLE IF NOT EXISTS address (
    city VARCHAR(64) NOT NULL,
    state VARCHAR(64) NOT NULL,
    postal_code VARCHAR(5) NOT NULL,
    region ENUM('West', 'East', 'Central', 'South', 'North') NOT NULL,
    PRIMARY KEY (postal_code)
);

/* Create table products */
CREATE TABLE IF NOT EXISTS products (
	product_id VARCHAR(64) NOT NULL,
    category ENUM('Furniture', 'Office Supplies', 'Technology') NOT NULL,
    sub_category VARCHAR(64) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_id)
);

/* Create table shipments */
CREATE TABLE IF NOT EXISTS shipments (
	order_id VARCHAR(64) NOT NULL REFERENCES orders (order_id),
    order_date DATE NOT NULL,
    ship_date DATE NOT NULL,
    ship_mode ENUM('First Class', 'Second Class', 'Standard Class') NOT NULL,
    PRIMARY KEY (order_id)
);

/* Create table orders */
CREATE TABLE IF NOT EXISTS orders (
	order_id VARCHAR(64) NOT NULL REFERENCES orders (order_id),
    customer_id VARCHAR(64) NOT NULL REFERENCES customers (order_id),
    product_id VARCHAR(64) NOT NULL REFERENCES products (product_id),
    postal_code VARCHAR(5) NOT NULL REFERENCES address (postal_code),
    sales DECIMAL(7, 4) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(3, 2) NOT NULL,
    profit DECIMAL(7, 4) NOT NULL,
    PRIMARY KEY (order_id, customer_id, product_id, postal_code)
);

/* Create table Returns */
CREATE TABLE IF NOT EXISTS returns (
	order_id VARCHAR(64) NOT NULL REFERENCES orders (order_id),
    product_id VARCHAR(64) NOT NULL REFERENCES products (product_id),
    PRIMARY KEY (order_id, product_id)
)