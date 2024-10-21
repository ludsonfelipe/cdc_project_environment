-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255),
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_timestamp TIMESTAMP,
    order_estimated_delivery_date DATE
);

-- Order Items Table
CREATE TABLE order_items (
    order_id VARCHAR(255),
    order_item_id VARCHAR(255),
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    price DECIMAL(10, 2),
    shipping_charges DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(255),
    customer_state VARCHAR(255)
);

-- Payments Table
CREATE TABLE payments (
    order_id VARCHAR(255),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(255) PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_weight_g DECIMAL(10, 2),
    product_length_cm DECIMAL(10, 2),
    product_height_cm DECIMAL(10, 2),
    product_width_cm DECIMAL(10, 2)
);



ALTER SYSTEM SET wal_level = logical;
ALTER TABLE
    customers REPLICA IDENTITY FULL;
ALTER TABLE
    orders REPLICA IDENTITY FULL;
ALTER TABLE
    order_items REPLICA IDENTITY FULL;
ALTER TABLE
    payments REPLICA IDENTITY FULL;
ALTER TABLE
    products REPLICA IDENTITY FULL;
