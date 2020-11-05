CREATE USER data_analyst 
IDENTIFIED BY 'password';

SELECT user FROM mysql.user;

SHOW GRANTS FOR 'data_analyst';
/*Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.*/

GRANT SELECT,UPDATE,DELETE ON *.* TO 'data_analyst' WITH GRANT OPTION;
/*SQL Error [1142] [42000]: CREATE command denied to user 'data_analyst'@'172.17.0.1' for table 'tape'*/
/*Cuando tratas de crear una tabla te niega el permiso porque el user data_analyst no tiene los privilegios para crear*/
UPDATE sakila.film
SET title='Pelicula n1', last_update=CURRENT_TIMESTAMP
WHERE film_id=0;

REVOKE  UPDATE ON *.*  FROM data_analyst;
