/*
----------------------------------------
SWIGGY SALES ANALYSIS PROJECT
DATA CLEANING SCRIPT
----------------------------------------
Author: Mohd Shakib
----------------------------------------
*/

-- Null Check
SELECT *
FROM swiggy_data
WHERE state IS NULL
   OR city IS NULL
   OR order_date IS NULL
   OR restaurant_name IS NULL
   OR location IS NULL
   OR category IS NULL
   OR dish_name IS NULL
   OR price_inr IS NULL
   OR rating IS NULL
   OR rating_count IS NULL;
   
   
   -- Blank/Empty String Check
   SELECT *
FROM swiggy_data
WHERE state = ''
   OR city = ''
   OR restaurant_name = ''
   OR location = ''
   OR category = ''
   OR dish_name = '';
   
   -- Duplicate Detection (Business Columns)
   SELECT
state, city, order_date, restaurant_name, location,
category, dish_name, price_inr, rating, rating_count,
COUNT(*) AS duplicate_count
FROM swiggy_data
GROUP BY
state, city, order_date, restaurant_name, location,
category, dish_name, price_inr, rating, rating_count
HAVING COUNT(*) > 1;

-- Duplicate Removal using ROW_NUMBER()
-- Create cleaned table

CREATE TABLE swiggy_clean AS
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY state, city, order_date, restaurant_name,
        location, category, dish_name, price_inr, rating, rating_count
        ORDER BY order_date
    ) AS rn
    FROM swiggy_data
) t
WHERE rn = 1;

-- DATE STANDARDIZATION
SET SQL_SAFE_UPDATES = 0;
-- Replace slash with dash
UPDATE swiggy_clean
SET order_date = REPLACE(order_date, '/', '-');

UPDATE swiggy_clean
SET order_date_new = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE swiggy_clean DROP COLUMN order_date;
ALTER TABLE swiggy_clean CHANGE order_date_new order_date DATE;
