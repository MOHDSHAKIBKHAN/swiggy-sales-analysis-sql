/*
----------------------------------------
SWIGGY SALES ANALYSIS PROJECT
DATA CLEANING SCRIPT
----------------------------------------
Author: Mohd Shakib
----------------------------------------
*/

-- DIMENSIONAL MODELLING (STAR SCHEMA)
-- Date Dimension

CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    year INT,
    month INT,
    quarter INT,
    week INT
);
-- Populate data entry in table
INSERT INTO dim_date (order_date, year, month, quarter, week)
SELECT DISTINCT
order_date,
YEAR(order_date),
MONTH(order_date),
QUARTER(order_date),
WEEK(order_date)
FROM swiggy_clean;


-- Location Dimension

CREATE TABLE dim_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    state VARCHAR(100),
    city VARCHAR(100),
    location VARCHAR(255)
);

 -- Populate data entry in table
INSERT INTO dim_location (state, city, location)
SELECT DISTINCT state, city, location
FROM swiggy_clean;

-- Restaurant Dimension
CREATE TABLE dim_restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255)
);  
-- Populate data entry in table
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT restaurant_name
FROM swiggy_clean;

-- Category Dimension
CREATE TABLE dim_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(100)
);

-- Populate data entry in table
INSERT INTO dim_category (category)
SELECT DISTINCT category
FROM swiggy_clean;

-- Dish Dimension
CREATE TABLE dim_dish (
    dish_id INT AUTO_INCREMENT PRIMARY KEY,
    dish_name VARCHAR(255)
);

-- Populate data entry in table
INSERT INTO dim_dish (dish_name)
SELECT DISTINCT dish_name
FROM swiggy_clean;