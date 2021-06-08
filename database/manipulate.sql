--Display all data for all tables
SELECT * FROM customers;
SELECT * FROM items;
SELECT * FROM stores;
SELECT * FROM payments;
SELECT * FROM order_details;

--insert for each
INSERT INTO customers(first_name,last_name,email,phone_number) VALUES (:first_name_input, :last_name_input, :email_input, :phone_number_input);
INSERT INTO items(name, price) VALUES (:item_name, :item_price);
INSERT INTO order_details(quanity, total_price, item_id, store_id, order_id) VALUES (:order_details_quanity, :total_price, :item_id, :store_id, order_id);
INSERT INTO payments(payment_type, customer_id, company)  VALUES (:payment_type, customer_id,);
INSERT INTO stores(state, city, zip_code, street, address_number) VALUES (:state, :city, :zip_code, :street, :address_number);

--delete for each // the other entinites should never be deleted only added
DELETE customers WHERE id = :customer_id;
DELETE order_details WHERE id = order_details_id;
DELETE orders WHERE id = order_id;

--update entinties // My thought process is that these can changed in order
--to update singual attributes if they choose, other ways input the same to keep it 
UPDATE customers SET first_name = :new_first_name, last_name = :new_last_name, email = :new_email, 
phone_number = :new_phone_number WHERE customer_id = wanted_customer_id;

UPDATE items SET name = :new_name, price = :new_price WHERE price_id = wanted _price_id;

UPDATE stores SET state = :new_state, city = :new_city, zip_code = :new_zip_code, 
street = :new_street, address_number = new_address_number WHERE store_id = wanted_store_id;

UPDATE payments SET paymemt_type = :new_payment_type, customer_id = :new_customer_id, company = new_company WHERE id = wanted_id;

UPDATE order_details SET quanity = :new_quanity, total_price = :new_total_price, item_id = :new_item_id, store_id = store_new_id,  
order_id = new_order_id WHERE id = wanted_id;
-----------------------------------------------------------------------------------------------------------------------------------------------
--DRAFT QUERIES--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
--ACRTUAL QUERIES------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM bsg_people;
SELECT * FROM customers;
SELECT * FROM items;
SELECT * FROM stores;
SELECT * FROM payments;
SELECT * FROM order_details;
SELECT * FROM orders;


--customer queries---------------------------------------------------------------------------------------------
INSERT INTO customers (first_name, last_name, email, phone_number) VALUES (?,?,?,?);
UPDATE customers SET first_name = ?, last_name = ?, email = ?, phone_number = ? WHERE customer_id = ?;
DELETE FROM order_details WHERE order_id = (SELECT order_id FROM orders WHERE customer_id = ?);
DELETE FROM payments WHERE customer_id = ?;
DELETE FROM orders WHERE customer_id = ?;
DELETE FROM customers WHERE customer_id = ?;
SELECT * FROM customers WHERE first_name = ?;
DELETE FROM customers WHERE customer_id = ?;
DELETE FROM orders WHERE customer_id = ?;
DELETE FROM payments WHERE customer_id = ?;

 --item queries------------------------------------------------------------------------------------------------
 INSERT INTO items (name, price) VALUES (?,?);
 UPDATE items set name = ?, price = ? WHERE item_id = ?;
 DELETE FROM order_details WHERE item_id = ?;
 DELETE FROM items WHERE item_id = ?;
 SELECT * FROM items WHERE name = ?;

 --order_details queries-----------------------------------------------------------------------------------------------
 INSERT INTO order_details (quantity, total_price, item_id, store_id, order_id) VALUES (?,?,?,?,?);
 UPDATE order_details SET quantity = ?, total_price = ?, item_id = ?, store_id = ?, order_id = ?  WHERE order_details_id = ?;
 DELETE FROM order_details WHERE order_details_id = ?;
 SELECT * FROM order_details WHERE order_details_id = ?;

 --order queries------------------------------------------------------------------------------------------------
 INSERT INTO orders (total_price, payment_id, customer_id, store_id) VALUES (?,?,?,?);
 UPDATE orders SET total_price = ?, payment_id = ?, customer_id = ?, store_id = ? WHERE order_id = ?;
 SELECT * FROM orders WHERE order_id = ?;
 DELETE FROM order_details WHERE order_id = ?;
 DELETE FROM orders WHERE order_id = ?;

 --payment queries----------------------------------------------------------------------------------------------
 INSERT INTO payments (payment_type, customer_id, company) VALUES (?,?,?);
 UPDATE payments SET payment_type = ?, customer_id = ?, company = ? WHERE payment_id = ?;
 DELETE FROM order_details WHERE order_id = (SELECT order_id FROM orders WHERE payment_id = ?);
 DELETE FROM orders WHERE payment_id = ?;
 DELETE FROM payments WHERE payment_id = ?
 SELECT * FROM payments WHERE payment_id = ?

 --stores queries------------------------------------------------------------------------------------------------
INSERT INTO stores (state, city, zip_code, street, address_number) VALUES (?,?,?,?,?);
UPDATE stores SET state = ?, city = ?, zip_code = ?, street = ?, address_number = ? WHERE  store_id = ?;
DELETE FROM order_details WHERE order_id = (SELECT order_id FROM orders WHERE store_id = ?);
DELETE FROM orders WHERE store_id = ?;
DELETE FROM stores WHERE store_id = ?;
SELECT * FROM stores WHERE store_id = ?