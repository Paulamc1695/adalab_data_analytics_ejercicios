-- Haz un esquema que resuelva los conflictos de la tabla dada.
-- Resultado: Dividimos la tabla dada en tres tablas para cumplir la normalizacion y las formas normales.

CREATE SCHEMA introduccion_bbdd_normalizacion;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nombre_cliente VARCHAR(50),
	apellido_cliente VARCHAR(50)
);

CREATE TABLE articulo (
	id_articulo INT AUTO_INCREMENT PRIMARY KEY,
	articulo_marca VARCHAR(50),
	articulo_tipo VARCHAR(50),
    precio_unitario INT
);

CREATE TABLE pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	cantidad INT,
	articulo_tipo VARCHAR(50),
	id_cliente INT, 
    id_articulo INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo)
);
    