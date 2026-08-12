-- Crear la base de datos
CREATE DATABASE universidad;
GO

-- Usar la base de datos
USE universidad;
GO

-- Tabla profesores
CREATE TABLE profesores(
	id_Profesor INT NOT NULL IDENTITY(1,1),
	especialidad VARCHAR(50) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,

	CONSTRAINT pk_profesores
	PRIMARY KEY (id_Profesor)
);
GO

-- Tabla cursos
CREATE TABLE cursos(
	id_Curso INT NOT NULL IDENTITY(1,1),
	n_Curso VARCHAR(50) NOT NULL,
	creditos INT NOT NULL,
	id_Profesor INT NOT NULL,

	CONSTRAINT pk_cursos
	PRIMARY KEY (id_Curso),

	CONSTRAINT fk_cursos_profesores
	FOREIGN KEY (id_Profesor)
	REFERENCES profesores(id_Profesor)
);
GO
