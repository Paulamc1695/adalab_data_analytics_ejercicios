-- Ejercicio 1. Crea la tabla Empleadas. De momento no te preocupes por definir restricciones a los datos que se pueden introducir,
-- o por definir claves primarias o foráneas. Puedes ver a continuación un ejemplo de la tabla:

-- Crea un nuevo esquema y actívalo, para no tener conflictos. Utiliza los siguientes comandos

CREATE SCHEMA creacion_bbdd;
USE creacion_bbdd;

CREATE TABLE empleadas (
	id_empleada INT,
	salario FLOAT,
	nombre VARCHAR(50),
	apellido VARCHAR(100),
	pais CHAR(3)
);

-- 2. Modifica la siguiente tabla, pero añadiendo una restricción de tabla que comprueba si la edad de la persona es mayor de 16 años. 
-- Llámala Personas2:

CREATE TABLE personas2 (
	id_empleada INT NOT NULL,
	salario FLOAT,
	nombre VARCHAR(50),
	apellido VARCHAR(100) NOT NULL,
	pais CHAR(3),
    edad INT,
    ciudad VARCHAR(25) DEFAULT 'Madrid',
	CHECK (edad > 16)
);

-- 3. Crea las tabla Empleadas (la llamo Empleadas_2 si no, da ERROR) y empleadas_en_proyectos, definiendo claves primarias, claves foránea,
--  tipos de datos, etc. Haz que cuando se elimine una Empleada, se eliminen todas las entradas en empleadas_en_proyectos asociadas:

CREATE TABLE Empleadas_2 (
	id_empleada INT PRIMARY KEY AUTO_INCREMENT,
	salario FLOAT,
	nombre VARCHAR(50),
	apellido VARCHAR(100),
	pais CHAR(3)
);


CREATE TABLE empleadas_en_proyectos (
    id_empleada_en_proyecto INT,
    id_proyecto INT,
    PRIMARY KEY (id_empleada_en_proyecto, id_proyecto),
    CONSTRAINT fk_empleadas_proyecto
        FOREIGN KEY (id_empleada_en_proyecto)
        REFERENCES empleadas (id_empleada) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

ALTER TABLE empleadas ADD UNIQUE (id_empleada); -- PARCHE: se crea un índice único ya que la tabla 'empleadas no tenía PK)-- Error 1822