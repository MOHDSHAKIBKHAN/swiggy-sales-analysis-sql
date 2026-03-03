/*
----------------------------------------
SWIGGY SALES ANALYSIS PROJECT
DATA CLEANING SCRIPT
----------------------------------------
Author: Mohd Shakib
----------------------------------------
*/

-- FACT TABLE LOAD
CREATE TABLE fact_swiggy_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,
    price_inr DECIMAL(10,2),
    rating DECIMAL(3,2),
    rating_count INT,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);
-- Load Fact Table (Key Mapping)
INSERT INTO fact_swiggy_orders
(date_id, location_id, restaurant_id, category_id, dish_id,
 price_inr, rating, rating_count)

SELECT
d.date_id,
l.location_id,
r.restaurant_id,
c.category_id,
di.dish_id,
s.price_inr,
s.rating,
s.rating_count

FROM swiggy_clean s
JOIN dim_date d ON s.order_date = d.order_date
JOIN dim_location l
ON s.state = l.state
AND s.city = l.city
AND s.location = l.location
JOIN dim_restaurant r ON s.restaurant_name = r.restaurant_name
JOIN dim_category c ON s.category = c.category
JOIN dim_dish di ON s.dish_name = di.dish_name;
