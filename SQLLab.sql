1. Select all the records from the "Customers" table.
		SELECT * FROM customers

2. Get distinct countries from the Customers table.
		SELECT DISTINCT country FROM customers

3. Get all the records from the table Customers where the Customer’s ID starts with “BL”.
		SELECT * FROM customers WHERE customer_id LIKE 'BL%'

4. Get the first 100 records of the orders table.
		SELECT * FROM orders LIMIT 100

5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
		SELECT * FROM customers WHERE postal_code='1010' OR postal_code='3012' OR postal_code='12209' OR postal_code='05023'

6. Get all orders where the ShipRegion is not equal to NULL.
		SELECT * FROM orders WHERE ship_region IS NOT NULL

7. Get all customers ordered by the country, then by the city.
		SELECT * FROM customers ORDER BY country, city

8. Add a new customer to the customers table. You can use whatever values/
		INSERT INTO customers VALUES ('ZANDE', 'Zander Inc.', 'Zander Michael', 'President', '1643 Shangrai la Dr SE', 'Grand Rapids', 
							 'MI', '49508', 'United States', '616-834-0824', '616-555-5555')

9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.
		UPDATE orders SET ship_region='EuroZone' WHERE ship_country='France'

10. Delete all orders from `order_details` that have a quantity of 1.
		DELETE FROM order_details WHERE quantity=1

11. Calculate the average, max, and min of the quantity at the `order details` table.
		SELECT AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details

12. Calculate the average, max, and min of the quantity at the `order details` table, grouped by the orderid.
		SELECT AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details GROUP BY order_id

13. Find the CustomerID that placed order 10290 (orders table)
		SELECT customer_id FROM orders WHERE order_id=10290

14. Do an inner join, left join, right join on orders and customers tables. (These are three separate queries, one for each type of join.)
		SELECT orders.order_id, customers.company_name
		FROM orders
		INNER JOIN customers ON orders.customer_id = customers.customer_id
		
		SELECT customers.company_name, orders.order_id 
		FROM customers
		LEFT JOIN orders ON customers.customer_id = orders.customer_id
		
		SELECT orders.order_id, customers.company_name
		FROM orders
		RIGHT JOIN customers ON orders.customer_id = customers.customer_id

15. Use a join to get the ship city and ship country of all the orders which are associated with an employee who is in London.
		SELECT orders.ship_city, orders.ship_country
		FROM orders
		INNER JOIN employees ON orders.employee_id = employees.employee_id AND employees.city = 'London'

16. Use a join to get the ship name of all orders that include a discontinued product. (See orders, order_details, and products. 
	1 means discontinued.)
		SELECT orders.ship_name
		FROM ((orders
		INNER JOIN order_details ON orders.order_id = order_details.order_id) 
		INNER JOIN products ON order_details.product_id = products.product_id AND products.discontinued = 1)
		
17. Get first names of all employees who report to no one.
		SELECT first_name FROM employees WHERE reports_to IS NULL

18. Get first names of all employees who report to Andrew.
		SELECT first_name FROM employees WHERE reports_to=2
		
