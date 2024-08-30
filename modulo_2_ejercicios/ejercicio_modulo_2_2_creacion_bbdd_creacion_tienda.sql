-- 4. Crea la tabla customers (sin tener en cuenta claves foráneas relacionadas con la tabla employees).

-- Antes de hacer nada, crea un nuevo esquema y actívalo, para no tener conflictos. Utiliza los siguientes comandos:

CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

CREATE TABLE customers_1 (
	id_customer_1 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(30)
);

-- 5. Crea la tabla employees (sin tener en cuenta claves foráneas relacionadas con la tabla customers):

CREATE TABLE employees_1 (
	id_employee_1 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(30)  
);

-- 6. Crea de nuevo las dos tablas(con un nombre diferente a las dos creadas anteriormente) teniendo en cuenta:
-- las claves foráneas y restricciones para los datos (por ejemplo que el límite de crédito nunca sea negativo...):

CREATE TABLE customers_2 (
	id_customer_2 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) UNIQUE,
    limite_credito FLOAT NOT NULL CHECK (limite_credito > 0)
);

CREATE TABLE employees_2 (
	id_employee_2 INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) UNIQUE,
    id_customEr_2 INT NOT NULL,
    FOREIGN KEY (id_customer_2) REFERENCES customers_2 (id_customer_2) 
);