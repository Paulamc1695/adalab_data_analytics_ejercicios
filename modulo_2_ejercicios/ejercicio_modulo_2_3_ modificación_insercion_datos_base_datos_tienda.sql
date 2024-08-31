-- 8. Usar las tablas ya creadas llamadas customers (clientes/as) y employees, que están en la base de datos tienda.
-- Crea una copia de la tabla customers, ya que vamos a modificar los datos originales de dicha tabla. Para ello ejecuta la siguiente sentencia:

CREATE TABLE IF NOT EXISTS customers_mod  -- o También CREATE TABLE customers_mod LIKE customers
SELECT * 
FROM customers;

--  ¡¡DESACTIVAR Safe Updates (rejects UPDATEs and DELETEs with no restrictions)!!

-- Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000);

-- Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.
--  Fíjate que ahora no tenemos toda la información.

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)    
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, '07005', 'España', 10, 45673453);

-- Introduce 5 filas nuevas con la información que consideres relevante para los campos disponibles en una misma instrucción. 
-- Se recuerda que el Indice(=la clave primaria), no es necesaria especificarla. En 3 de las nuevas filas debes dejar vacio el campo 'contactFirstName'.

-- Primero modificamos la clausula NOT NULL por NULL en la columna 'contact_first_name' para poder dejar el campo vacío (porque da "Error Code: 1048. Column 'contact_first_name' cannot be null").
ALTER TABLE customers_mod
MODIFY contact_first_name VARCHAR(50) NULL;

-- Y volvemos a ejecutar la tabla:

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES
    (345, 'Grupo X', 'Martínez', NULL, '12345678', 'Calle del Sol', 'Apto 5', 'Barcelona', 'Cataluña', '08001', 'España', 12, 1234567),
    (346, 'Empresa Y', 'Gómez', 'Ana', '87654321', 'Avenida del Norte', NULL, 'Madrid', NULL, '28001', 'España', 11, 2345678),
    (347, 'Comercial Z', 'López', NULL, '11223344', 'Paseo de la Reforma', 'Oficina 2', 'Valencia', NULL, '46001', 'España', 13, 3456789),
    (348, 'Inversiones W', 'Fernández', NULL, '55667788', 'Calle de la Luna', NULL, 'Sevilla', 'Andalucía', '41001', 'España', 14, 4567890),
    (349, 'Servicios A', 'Castro', 'Luis', '99887766', 'Ronda del Sur', 'Local 1', 'Bilbao', NULL, '48001', 'España', 15, 5678901);
    
-- Actualiza ahora los datos faltantes correspondientes al customer_number 344 con la información dada.

UPDATE customers_mod
SET address_line1 = 'Polígono Industrial de Son Castelló',
    address_line2 = 'Nave 92',
    city = 'Palma de Mallorca',
    state = 'España',
    postal_code = '28123',
    country = 'España',
    sales_rep_employee_number = 25,
    credit_limit = 5000000
WHERE customer_number = 344;

-- Vamos ahora a romper a propósito la tabla con la que estamos trabajando.
-- Para ello primero vamos a realizar una copia de la misma antes de ejecutar lo siguiente con el nombre customers_destroy.

CREATE TABLE IF NOT EXISTS customers_destroy 
SELECT * 
FROM customers_mod;

-- Una vez creada la copia y guardada a buen recaudo.
-- Vamos a actualizar algunos de los cambios sin especificar la condición del WHERE. Para ello modifica el campo los siguientes campos de

UPDATE customers_mod
SET address_line1 = 'Vamos',
    address_line2 = 'a',
    postal_code = 'fastidiar',
    country = 'la tabla :)';
    
-- Tras esto restaura la tabla que has trasteado con la copia que te has creado previamente.    
-- Actualiza ahora los datos de la tabla customers_mod, para que las 10 primeras empresas sean gestionadas por la representante de ventas numero 2.
-- El resto de empresas no deben ser modificadas.

UPDATE customers_mod 
SET sales_rep_employee_number = 2 
WHERE customer_number IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- Eliminar registros con NULL en contact_first_name

DELETE FROM customers_mod 
WHERE contact_first_name IS NULL;

-- Ejecutar un DELETE sin WHERE (¡Cuidado! Esto eliminará todos los registros de la tabla)

DELETE FROM customers_mod;
    
