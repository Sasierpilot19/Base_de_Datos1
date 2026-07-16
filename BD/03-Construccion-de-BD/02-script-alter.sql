-- ALTER TABLE

use pruebaatributos;

SELECT *
FROM alumno;

TRUNCATE TABLE alumno;

--Muestra los datos de una tabla
SELECT *
	COLUMN_NAME,
	DATA_TYPE,
	CARACTER_MAXIMUM_LENGHT,
	IS_UNULLABLE
FROM INFORMATION_SCHEMA;

-- Agregar una columna 
ALTER TABLE alumno
ADD telfono VARCHAR(20) NOT NULL;
GO

-- Agregar mas de una columna 
ALTER TABLE alumno
ADD 
curp VARCHAR(18),
matricula VARCHAR(13) NOT NULL;
GO

--Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telfono VARCHAR(30);
GO

-- AGREGAR RESTRICCIONES 
-- PRIMARY KEY

SELECT TOP 0 *
INTO alumno2
FROM alumno; 

SELECT
	o.name AS nombre_restriccion,
	o.type_desc AS tipo_restriccion
FROM sys.objects AS O
WHERE o.parent_object_id = OBJECT_ID('alumno2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;

-- PRIMARY KEY 

ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY  (num_alumno);

-- Crear una tabla para la foreign key

CREATE TABLE carrera(
	carrera_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_carrera
	PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL
);

ALTER TABLE alumno2
ADD carrera_id INT;

ALTER TABLE alumno2 
ADD CONSTRAINT fk_alumno2_carrera
FOREIGN KEY  (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- AGREGAR UN CHECK
ALTER TABLE akumno2
ADD CONSTRAINT ck_alumno2_telfono
CHECK (telfono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

-- AGREGAR UN DEFAULT
ALTER TABLE alumno2
ADD activo BIT NOT NULL;

ALTER TABLE alumno2 
ADD CONSTRAINT df_alumno2_activo
DEFAULT 1
FOR activo;

-- AGREGAR UN UNIQUE 
ALTER TABLE alumno2
ADD CONSTRAINT uq_alumno2_matricula
UNIQUE (matriucla);

--ELIMINAR RESTRICCIONES
SELECT
	o.name AS nombre_restriccion,
	o.type_desc AS tipo_restriccion
FROM sys.objects AS O
WHERE o.parent_object_id = OBJECT_ID('alumno2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;

-- ELIMINAR FOREIGN KEY
ALTER TABLE alumno2 
DROP CONSTRAINT fk_alumno2_carrera;

-- ELIMINAR PRIMARY KEY 
ALTER TABLE alumno2
DROP CONSTRAINT pk_alumno2;

ALTER TABLE carrera
DROP CONSTRAINT carrera;

-- ELIMINAR UNIQUES 
ALTER TABLE alumno2
DROP CONSTRAINT uq_alumno2_matricula;

-- ELIMINAR CHECKS
ALTER TABLE alumno2
DROP CONSTRAINT ck_alumno2_telefono;

-- ELIMINAR COLUMNA
ALTER TABLE alumno2
DROP COLUMN matricula;

-- DROP 
-- ELIMINAR LA TABLA ALUMNO

DROP TABLE alumno2;

-- ELIMINAR MAS DE UNA TABLA A LA VEZ

DROP TABLE alumno, carrera;

USE master;

IF DB_ID ('pruebaatributos')IS NOT NULL 
BEGIN 
DROP DATABASE pruebaatributos;
END