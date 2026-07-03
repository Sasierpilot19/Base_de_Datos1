--Crearuna base de datos 

CREATE DATABASE bdconstraint; 
GO

--Usar la base de datos
USE bdconstraint;
GO

--Razon de Cardinalidad 1:1

--Crear tabla Paciente
CREATE TABLE paciente(
	Idpaciente INT NOT NULL,
	Nombre VARCHAR (40) NOT NULL,
	Apellido1 VARCHAR (20) NOT NULL,
	Apellido2 VARCHAR (20) NULL,
	Fechanaci DATE NOT NULL,
	CONSTRAINT pk_paciente
	PRIMARY KEY (Idpaciente)
);
GO 

CREATE TABLE expediente(
	Idexp INT NOT NULL PRIMARY KEY,
	Fechaapertura DATE NOT NULL,
	Tiposangre char (3) NULL,
	Idpaciente INT NOT NULL,
	CONSTRAINT unique_idpaciente
	UNIQUE (Idpaciente),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (Idpaciente)
	REFERENCES paciente(Idpaciente)
);
GO

DROP TABLE expediente;

--DATOS PARA LAS TABLAS

SELECT GETDATE()


INSERT INTO paciente
VALUES (1,'José Domingo','Perez','Hernandez','1995-03-21')

INSERT INTO paciente
VALUES (2,'José Luis','Herrera','Gallardo','1978-04-06')

INSERT INTO paciente
VALUES (3,'Ian Antonio','García','Jimenez','2007-06-06')

INSERT INTO paciente
VALUES (4,'Angel Raziel','Orozco','Peña','2006-03-15')

--INSERTAR EXPEDIENTE

INSERT INTO expediente
VALUES (1,GETDATE(), '+0', 1);

INSERT INTO expediente
VALUES (2,'2026-06-17', '+0', 2);

SELECT * FROM expediente