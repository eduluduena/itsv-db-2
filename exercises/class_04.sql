USE sakila;
 
#Ej N°1
SELECT title, special_features 
	FROM film f 
	WHERE rating="PG-13";

#Ej N°2
SELECT DISTINCT `length` 
	FROM film f;
	
#Ej N°3
SELECT title, rental_rate, replacement_cost 
	FROM film WHERE replacement_cost BETWEEN 20.00 AND 24.00
	
#Ej N°4
SELECT title, film_category, rating FROM film
	WHERE special_features LIKE 'Behind the Scenes';


#Ej N°5
SELECT first_name, last_name FROM actor a, film_actor fa , film f 
	WHERE a.actor_id = fa.actor_id 
	AND fa.film_id = f.film_id 
	AND f.title = "ZOOLANDER FICTION";
	
#Ej N°6
SELECT address, city, country FROM store
	INNER JOIN address ON store.address_id = address.address_id
	INNER JOIN city ON address.city_id = city.city_id
	INNER JOIN country ON city.country_id = country.country_id
	WHERE store.store_id = 1;

#Ej N°7
SELECT f1.title, f2.title, f1.rating FROM film f1, film f2
	WHERE f1.rating = f2.rating AND f1.film_id != f2.film_id;

#Ej N°8
SELECT film.*, staff.first_name, staff.last_name FROM inventory
	INNER JOIN film ON inventory.film_id = film.film_id
	INNER JOIN store ON inventory.store_id = store.store_id
	INNER JOIN staff ON store.manager_staff_id = staff.staff_id
	WHERE store.store_id = 2;