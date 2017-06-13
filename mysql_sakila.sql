# Sakila MySQL Assignment

# 1. All customers inside city_id 312
#### Return: first name, last name, email, address
SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address.city_id = 312;

# 2. All comedy films
#### Return: film title, description, release year, rating, special features, genre
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'comedy';

# 3. All films with actor_id 5
#### Return: actor id, actor name, film title, description, and release year
SELECT actor.actor_id, actor.first_name, actor.last_name, film.title, film.description, film.release_year
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE actor.actor_id = 5;

# 4. All customers in store_id = 1 in cities 1, 42, 312, and 459
#### Return: first name, last name, email, address
SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address ON address.address_id = customer.address_id
WHERE customer.store_id = 1 AND (address.city_id = 1 OR address.city_id = 42 OR address.city_id = 312 OR address.city_id = 459);

# 5. All films rated G with behind the scenes special features and actor_id 15
#### Return: title, description, release year, rating, special feature (use LIKE)
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.rating = 'G' AND actor.actor_id = 15 AND film.special_features LIKE '%behind the scenes%';

# 6. all the actors in film id 369
#### Return: film id, title, actor id, actor name
SELECT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.film_id = 369;

# 7. All drama films with rental rate of 2.99
#### Return: film title, description, release year, rating, special features, and genre
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN inventory ON inventory.film_id = film.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN payment ON payment.rental_id = rental.rental_id
WHERE payment.amount = 2.99 AND category.name = 'drama'
GROUP BY film.title;

# 8. All action films featuring Sandra Kilmer
#### Return: film title, description, release year, special features, genre, and actor's name
SELECT film.title, film.description, film.release_year, film.special_features, category.name, actor.first_name, actor.last_name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'action' AND actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER';