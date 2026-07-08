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