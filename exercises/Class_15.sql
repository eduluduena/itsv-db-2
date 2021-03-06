/*1. Create a view named list_of_customers, it should contain the following columns:
 *  customer id
    customer full name,
    address
    zip code
    phone
    city
    country
    status (when active column is 1 show it as 'active', otherwise is 'inactive')
    store id */
CREATE OR REPLACE VIEW list_of_customers AS 
	SELECT customer.customer_id, CONCAT_WS(' ', first_name, last_name) AS `full_name`, address.address,
		address.postal_code AS `zip_code`, address.phone, city.city, country.country,
		CASE WHEN customer.active THEN 'Active' ELSE 'Inactive' END AS `status`, store_id FROM customer
		INNER JOIN address USING (address_id)
		INNER JOIN city USING (city_id)
		INNER JOIN country USING (country_id);
	
/* 2. Create a view named film_details, it should contain the following columns:
 *  film id, title, description, category, price, length, rating, actors - as a string of all the actors separated by comma.
 * Hint use GROUP_CONCAT */
CREATE OR REPLACE VIEW film_details AS 
	SELECT film_id, title, description, replacement_cost, `length`, rating,
		GROUP_CONCAT(CONCAT_WS(' ', actor.first_name, actor.last_name) SEPARATOR ', ') AS `actors` FROM film
		INNER JOIN film_category USING (film_id)
		INNER JOIN category USING (category_id)
		INNER JOIN film_actor USING (film_id)
		INNER JOIN actor USING (actor_id)
		GROUP BY film.film_id, category.name;
		
/* 3. Create view sales_by_film_category, it should return 'category' and 'total_rental' columns. */
CREATE OR REPLACE VIEW sales_by_film_category AS 
	SELECT category.name, COUNT(*) AS `total_rental` FROM category
		INNER JOIN film_category USING (category_id)
		INNER JOIN film USING (film_id)
		INNER JOIN inventory USING (film_id)
		INNER JOIN rental USING (inventory_id)
		GROUP BY category_id;
	
CREATE OR REPLACE VIEW sales_by_film_category AS
	SELECT COUNT(*) FROM rental
		INNER JOIN inventory USING (inventory_id)
		INNER JOIN film USING (film_id)
		INNER JOIN film_category USING (film_id)
		GROUP BY film_category.category_id;
	
/* 4. Create a view called actor_information where it should return
 * actor id, first name, last name and the amount of films he/she acted on. */
CREATE OR REPLACE VIEW actor_information AS
	SELECT actor_id, first_name, last_name, COUNT(*) AS `films_acted_on` FROM actor
		INNER JOIN film_actor USING (actor_id)
		INNER JOIN film USING (film_id)
		GROUP BY actor_id;
