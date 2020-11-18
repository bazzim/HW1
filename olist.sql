/* 
Dataset: Brazilian E-Commerce Public Dataset by Olist
Data Source: Kaggle (Only 2018 data is taken)
Description: The dataset contains orders made at Olist Store. Olist connects small businesses from all over Brazil
			 to channels without hassle and with a single contract. Those merchants are able to sell their products
             through the Olist Store and ship them directly to the customers using Olist logistics partners.
*/

/* create a database */
DROP DATABASE IF EXISTS olist;
CREATE DATABASE olist;

USE olist;

/* Create tables to import raw data */
-- Create table customer_dataset
DROP TABLE IF EXISTS olist.customer_dataset;
CREATE TABLE olist.customer_dataset(
  customer_id varchar(50),
  customer_unique_id varchar(50),
  customer_zip_code_prefix varchar(10),
  customer_city varchar(50),
  customer_state varchar(5)
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_customers_dataset.csv" 
INTO TABLE olist.customer_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- Create table order_items_dataset
DROP TABLE IF EXISTS olist.order_items_dataset;
CREATE TABLE olist.order_items_dataset(
  order_id varchar(50),
  order_item_id int,
  product_id varchar(50),
  seller_id varchar(50),
  shipping_limit_date datetime,
  price float,
  freight_value float,
  sales int
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_order_items_dataset_new.csv" 
INTO TABLE olist.order_items_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- Create table order_payments_dataset
DROP TABLE IF EXISTS olist.order_payments_dataset;
CREATE TABLE olist.order_payments_dataset(
  order_id varchar(50),
  payment_sequential int,
  payment_type varchar(30),
  payment_installments int,
  payment_value float
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_order_payments_dataset.csv" 
INTO TABLE olist.order_payments_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- Create table orders_dataset
DROP TABLE IF EXISTS olist.orders_dataset;
CREATE TABLE olist.orders_dataset(
  order_id varchar(50),
  customer_id varchar(50),
  order_status varchar(30),
  order_purchase_timestamp datetime,
  order_approved_at datetime,
  order_delivered_carrier_date datetime,
  order_delivered_customer_date datetime,
  order_estimated_delivery_date datetime,
  fix_id int
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_orders_dataset_new.csv" 
INTO TABLE olist.orders_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- Create table products_dataset
DROP TABLE IF EXISTS olist.products_dataset;
CREATE TABLE olist.products_dataset(
  product_id varchar(50),
  product_category_name text,
  product_name_lenght int NULL,
  product_description_lenght INT NULL,
  product_photos_qty int NULL,
  product_weight_g int NULL,
  product_length_cm int NULL,
  product_height_cm int NULL,
  product_width_cm int NULL,
  cost int
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_products_dataset.csv" 
INTO TABLE olist.products_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- Create table sellers_dataset
DROP TABLE IF EXISTS olist.sellers_dataset;
CREATE TABLE olist.sellers_dataset(
  seller_id varchar(50),
  seller_zip_code_prefix varchar(20),
  seller_city varchar(50),
  seller_state varchar(10)
);
LOAD DATA LOCAL INFILE "~/Desktop/olist/olist_sellers_dataset.csv" 
INTO TABLE olist.sellers_dataset 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;