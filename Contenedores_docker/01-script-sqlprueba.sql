

--Crear Base de Datos pruebaG1


--Permite crear una base de datos (SQL-LDD)
CREATE DATABASE pruebaG1;

--Utiliza la base de datos
USE pruebaG1;

--Crear una tabla (SQL-LDD)
CREATE TABLE alumno (
id INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
edad INT NOT NULL,
matricula INT NOT NULL,
direccion VARCHAR(30) NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);
-- Agregar alumnos
INSERT INTO alumno (id, nombre, edad, matricula, direccion)
VALUES (1, 'Angel', 20, 24301804, 'Calle 1986516'),
	   (2, 'Raziel', 20, 24301905, 'Calle 689866');
	   
	   
--Seleccionar los alumnos
SELECT *
FROM alumno;

--Cambiar el nombre de un alumno
UPDATE alumno
SET nombre = 'Nicolas'
WHERE id = 2;

