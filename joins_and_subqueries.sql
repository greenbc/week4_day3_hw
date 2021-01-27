-- Q1
SELECT customer_id, first_name, last_name, district
FROM customer
FULL JOIN address 
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas';

-- Q2
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- Q3
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Q4
SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country LIKE 'Nepal';

-- Q5
SELECT staff.staff_id, first_name, last_name, COUNT(payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment_id) DESC;
-- Jon Stephens

-- Q6
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Q7
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(amount) > 1
);

-- Q8
SELECT *
FROM payment
WHERE amount = 0;
-- 24