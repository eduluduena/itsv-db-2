
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, a.address, p.amount AS 'min_amount'
    FROM customer c, address a, payment p
    WHERE c.address_id = a.address_id 
    AND p.customer_id = c.customer_id
    AND p.amount IN (SELECT MIN(p2.amount) FROM payment p2WHERE p2.customer_id = c.customer_id) ORDER BY min_amount;

SELECT DISTINCT c.customer_id, c.first_name, c.last_name, a.address, p.amount AS 'min_amount'
    FROM customer c, address a, payment p
    WHERE c.address_id = a.address_id 
    AND p.customer_id = c.customer_id
    AND p.amount <= ALL (SELECT p2.amount FROM payment p2 WHERE p2.customer_id = c.customer_id)
    ORDER BY min_amount;

#Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, a.address, p.amount AS 'min_amount', p3.amount AS "max_amount"
    FROM customer c, address a, payment p, payment p3 
    WHERE c.address_id = a.address_id 
    AND p.customer_id = c.customer_id
    AND p3.customer_id = c.customer_id 
    AND p.amount <= ALL (SELECT p2.amount FROM payment p2 WHERE p2.customer_id = c.customer_id)
    AND p3.amount >= ALL (SELECT p2.amount FROM payment p2 WHERE p2.customer_id = c.customer_id)
    ORDER BY min_amount;
