
USE tienda;

-- 1. Realiza una consulta SELECT que obtenga los nombres, teléfonos y direcciones de todas las empresas cliente de la tabla customers.

SELECT customer_name, phone, address_line1, address_line2, city, state, postal_code, country
FROM customers;

-- 2. Realiza una consulta que obtenga los teléfonos y direcciones de aquellas empresas de la tabla customers que se encuentren en USA (es su país).

SELECT phone, address_line1, address_line2, city, state, postal_code
FROM customers
WHERE country = "USA";

-- 3. Realiza una consulta que obtenga los nombres y apellidos de las personas de contacto en cada empresa que no tenga segunda linea de dirección.

SELECT contact_last_name, contact_first_name FROM customers
WHERE address_line2 IS NULL;

-- 4. Registros que tengan un valor guardado para el campo state. Solo es valido para ciertos países por lo que habrá varias entradas con valor NULL.

SELECT *
FROM customers
WHERE state IS NOT NULL;

-- 5. Registros que correspondan a clientes de USA pero que no tengan un valor guardado para el campo state.

SELECT *
FROM customers
WHERE country = "USA" AND state IS NULL; -- (NO tengan valor guardado = IS NULL <> IS NOT NULL)

-- 6. Selecciona el país (country) correspondiente a los registros de clientes con un límite de crédito (credit_limit) mayor que $10000.

SELECT country
FROM customers
WHERE credit_limit > 10000; -- (No se escriben los símbolos monetarios)