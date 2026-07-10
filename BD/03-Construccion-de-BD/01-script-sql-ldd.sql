/* Construccion de base de datos con SQL-LDD 
 (CREATE, ALTER, DROP)*/

-- Crear una base de datos 

CREATE DATABASE empresa_patito;
GO

-- Utilizar la base de datos 

USE empresa_patito;
GO

--Crear tabla
CREATE TABlE alumno(
	alumno_id INT,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO


INSERT INTO alumno
VALUES (1, 'Domingo', 'Sarabia', 'Mendez', '1942-03-14', 'domingo@gmail.com');
INSERT INTO alumno
VALUES (1, 'Patricio', 'Pineda', 'Robles', '1952-12-19', 'patricio@gmail.com');
GO

SELECT *
FROM alumno;

DROP TABLE alumno;

CREATE TABlE alumno(
	alumno_id INT NOT NULL CONSTRAINT pk_alumno PRIMARY KEY(alumno_id),
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO



INSERT INTO alumno
VALUES (1, 'Domingo', 'Sarabia', 'Mendez', '1942-03-14', 'domingo@gmail.com');
INSERT INTO alumno
VALUES (2, 'Patricio', 'Pineda', 'Robles', '1952-12-19', 'patricio@gmail.com');
GO

SELECT *
FROM alumno;



CREATE TABlE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25),
	CONSTRAINT pk_alumno PRIMARY KEY(alumno_id)
);
GO

-- Primary key con IDENTITY
CREATE TABLE categoria (
	categoria_id INT IDENTITY (1,1),
	nombre VARCHAR(25) NOT NULL,
	activo BIT NOT NULL
);
GO

INSERT INTO categoria
VALUES ('carnes frias', 1);

INSERT INTO categoria
VALUES ('carnes frias', 1);

SELECT * FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria (
	categoria_id INT IDENTITY (1,1) CONSTRAINT pk_categoria PRIMARY KEY(categoria_id),
	nombre VARCHAR(25) NOT NULL UNIQUE,
	activo BIT NOT NULL,
);
GO

INSERT INTO categoria
VALUES ('carnes frias', 1);

INSERT INTO categoria
VALUES ('carnes frias', 1);
GO

CREATE TABLE categoria (
	categoria_id INT IDENTITY (1,1) CONSTRAINT pk_categoria PRIMARY KEY(categoria_id),
	nombre VARCHAR(25) NOT NULL CONSTRAINT uq_categoria_nombre UNIQUE,
	activo BIT NOT NULL,
);
GO

DROP TABLE categoria;
--

-- Restriccion Check

-- Primera forma de construccion (!!NO USAR!!)
CREATE TABLE producto(
	producto_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	nombre VARCHAR (20) NOT NULL UNIQUE,
	precio DECIMAL (10,2) NOT NULL CHECK (precio > 0.0),
	existencia INT NULL CHECK  (existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL DEFAULT 1
); 
GO 

INSERT INTO producto
VALUES ('Pitufo',450, 98, DEFAULT);

INSERT INTO producto
VALUES ('Quemadita',12, 89, DEFAULT);

INSERT INTO producto (nombre, existencia, precio)
VALUES ('pantera rosa', 76, 123);

TRUNCATE TABLE producto;
GO

SELECT * FROM producto;

DROP TABLE producto;

-- Segunda forma de construccion

CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY (1,1) 
	CONSTRAINT pk_producto PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL 
	CONSTRAINT uq_producto_nombre UNIQUE,
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio 
	CHECK (precio > 0.0),
	existencia INT NOT NULL 
	CONSTRAINT ck_producto_existencia
	CHECK (precio BETWEEN 1 AND 100),
	tipo CHAR (1) NOT NULL
	CONSTRAINT ck_producto_tipo 
	CHECK (tipo = 'R' OR tipo = 'P'),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1
	);
	GO

	DROP TABLE producto;
	-- Tercera forma de construccion 
	-- el DEFAULT siempre va en columna

	CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY (1,1), 
	nombre VARCHAR(20) NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL, 
	tipo CHAR (1) NOT NULL,
	activo BIT NOT NULL,
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_producto_tipo
	CHECK (tipo IN ('R', 'P'))
	);
	GO

	--Creacion de la base de datos empresa_yoda

	CREATE DATABASE empresa_yoda;

	USE empresa_yoda;
	GO

	CREATE TABLE categoria(
		categoria_id INT NOT NULL IDENTITY (1,1)
		CONSTRAINT pk_categoria_ PRIMARY KEY,
		nombre VARCHAR(20) NOT NULL
		CONSTRAINT uq_categoria_nombre UNIQUE,
		activo BIT NOT NULL
		CONSTRAINT df_categoria_activo
		DEFAULT 1
	);
	GO

	CREATE TABLE producto(
		producto_id INT NOT NULL,
		fabricante_id CHAR(3) NOT NULL,
		nombre VARCHAR(25) NOT NULL,
		existencia INT NOT NULL,
		precio NUMERIC(10,2) NOT NULL,
		activo BIT NOT NULL,
		CONSTRAINT df_producto_activo
		DEFAULT 1,
		categoria_id INT NOT NULL,
		CONSTRAINT pk_producto
		PRIMARY KEY (producto_id, fabricante_id),
		CONSTRAINT uq_producto_nombre 
		UNIQUE (nombre),
		CONSTRAINT ck_producto_existencia
		CHECK (existencia > 0),
		CONSTRAINT ck_producto_precio
		CHECK (precio BETWEEN 1 AND 10000),
		CONSTRAINT fk_producto_categoria
		FOREIGN KEY (categoria_id)
		REFERENCES categoria (categoria_id)
	);
	GO


	INSERT INTO categoria (nombre)
	VALUES ('Front end'),
		   ('Back end'),
		   ('Cloud')

SELECT * FROM categoria;

INSERT INTO producto
VALUES (1, 'ff1', 'Tailwind', 987.34, 45, DEFAULT, 1);

INSERT INTO producto
VALUES (2, 'ff1', 'Bootstrap', 597.8,245, 0, 1);

INSERT INTO producto
VALUES (1, 'ff2', 'AWS', 987.34, 45, 0, 3);

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL 
	CONSTRAINT pk_proveedor
	PRIMARY KEY,
	empresa VARCHAR (30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL,
);
GO
  
DROP TABLE proveedor;

CREATE TABLE contacto_proveedor(
	contacto_id INT,
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR (15) NOT NULL,
	proveedor INT
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor)
	REFERENCES proveedor (proveedor_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

DROP TABLE contacto_proveedor;

INSERT INTO proveedor
VALUES (1,'patito de hule', NULL, 67888.01),
	   (2,'Bimbo', NULL, 5678.05),
	   (3,'Dulces Domingo', NULL, 6789.01),
	   (4,'Drugs Kevin', NULL, 6785.01),
	   (0,'Todas Mias','Engañifas',666.69);

INSERT INTO proveedor
VALUES ('Soyla','Vaca','Del corral','122242334',2),
	   ('Carmen', 'se perdio','la cedenita', '122242334',2),
	   ('Juanito', 'dulce','Terruño','122242334',2),
	   ('Laura', 'No esta','Comiendo','122242334',1);

WHERE proveedor_id = 2;

UPDATE proveedor;
SET preoveedor_id = 10;
WHERE proveedor_id = 2;

--Integridad referencial ON DELETE Y ON UPDATE SET NULL

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL 
	CONSTRAINT pk_proveedor
	PRIMARY KEY,
	empresa VARCHAR (30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL,
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT,
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR (15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET NULL 
	ON UPDATE SET NULL
);

INSERT INTO proveedor
VALUES (1,'patito de hule', NULL, 67888.01),
	   (2,'Bimbo', NULL, 5678.05),
	   (3,'Dulces Domingo', NULL, 6789.01),
	   (4,'Drugs Kevin', NULL, 6785.01);

INSERT INTO contacto_proveedor
VALUES ('Soyla','Vaca','Del corral','122242334',2),
	   ('Carmen', 'se perdio','la cedenita', '122242334',2),
	   ('Juanito', 'dulce','Terruño','122242334',2),
	   ('Laura', 'No esta','Comiendo','122242334',1);

SELECT * FROM proveedor AS p
INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id = cp.proveedor_id;
DELETE FROM proveedor
WEHERE proveedor_id = 2;

SELECT * FROM proveedor
SELECT * FROM contacto_proveedor

-- Integridad Referencial ON DELETE Y ON UPDATE SET DEFAULT

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL 
	CONSTRAINT pk_proveedor
	PRIMARY KEY,
	empresa VARCHAR (30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (10,2) NOT NULL,
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT,
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR (15) NOT NULL,
	proveedor_id INT
	CONSTRAINT df_contacto_proveedor_proveedor_id
	DEFAULT 0,
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
);


INSERT INTO proveedor
VALUES (1,'patito de hule', NULL, 67888.01),
	   (2,'Bimbo', NULL, 5678.05),
	   (3,'Dulces Domingo', NULL, 6789.01),
	   (4,'Drugs Kevin', NULL, 6785.01),
	   (0,'Todas Mias','Engañifas',666.69);

INSERT INTO contacto_proveedor
VALUES ('Soyla','Vaca','Del corral','122242334',2),
	   ('Carmen', 'se perdio','la cedenita', '122242334',2),
	   ('Juanito', 'dulce','Terruño','122242334',2),
	   ('Laura', 'No esta','Comiendo','122242334',1);
	   
	   
SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

DELETE proveedor
WHERE proveedor_id = 2;

UPDATE contacto_proveedor
SET proveedor_id = 3
WHERE proveedor_id = 0;

UPDATE contacto_proveedor
SET proveedor_id = 6
WHERE proveedor_id = 3;


-- TODO : Realizar ejercicio completo de construccion de una diagrama Relacional,
--aplicando las restricciones y se continua con ALTER y DROP