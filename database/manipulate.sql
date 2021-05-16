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
