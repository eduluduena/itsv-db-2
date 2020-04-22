#Ej N°1
SELECT * FROM actor a WHERE EXISTS (SELECT * FROM actor aa WHERE a.last_name = aa.last_name) ORDER  BY a.last_name

#Ej N°2
#No Me Salio

#Ej NÂ°3
SELECT * FROM customer c WHERE (SELECT COUNT(*) FROM rental rr WHERE rr.customer_id = c.customer_id) = 1;

#Ej N°4
SELECT * FROM customer c WHERE (SELECT COUNT(*) FROM rental rr, customer cc WHERE rr.customer_id = cc.customer_id) > 1

#Ej N°5
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id = fa.film_id AND (f.title = "BETRAYED REAR" OR f.title = "CATCH AMISTAD");
	
#Ej N°6
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id=fa.film_id AND f.title="BETRAYED REAR" AND a.actor_id NOT IN (
		SELECT aa.actor_id from actor aa, film_actor faa, film ff WHERE aa.actor_id = faa.actor_id 
			AND ff.film_id=faa.film_id AND ff.title="CATCH AMISTAD");

#Ej N°7
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id=fa.film_id AND f.title="BETRAYED REAR" AND a.actor_id IN (
		SELECT aa.actor_id from actor aa, film_actor faa, film ff WHERE aa.actor_id = faa.actor_id 
			AND ff.film_id=faa.film_id AND ff.title="CATCH AMISTAD");


#Ej N°8
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id = fa.film_id AND (f.title != "BETRAYED REAR" OR f.title != "CATCH AMISTAD");