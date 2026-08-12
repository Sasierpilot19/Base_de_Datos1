-- Crear la base de datos
CREATE DATABASE escuela;
GO

-- Usar la base de datos
USE escuela;
GO

-- Tabla alumno
CREATE TABLE alumno(
    id_Alumno INT NOT NULL IDENTITY(1,1),
    matricula VARCHAR(15) NOT NULL,
    semestre INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    CONSTRAINT pk_alumno PRIMARY KEY (id_Alumno),
    CONSTRAINT uq_alumno_matricula UNIQUE (matricula),
    CONSTRAINT ck_alumno_semestre CHECK (semestre BETWEEN 1 AND 12)
);
GO

--Tabla materia
CREATE TABLE materia(
    clave_M CHAR(6) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    creditos INT NOT NULL,
    CONSTRAINT pk_materia PRIMARY KEY (clave_M),
    CONSTRAINT ck_materia_creditos CHECK (creditos > 0)
);
GO

--Tabla inscribe
CREATE TABLE inscribe(
    id_Alumno INT NOT NULL,
    clave_M CHAR(6) NOT NULL,
    fecha_Inscripcion DATETIME2 NOT NULL
    CONSTRAINT df_inscribe_fecha DEFAULT SYSDATETIME(),
    cali_final DECIMAL(4,2),
    CONSTRAINT pk_inscribe PRIMARY KEY (id_Alumno, clave_M),
    CONSTRAINT fk_inscribe_alumno FOREIGN KEY (id_Alumno)
    REFERENCES alumno(id_Alumno),
    CONSTRAINT fk_inscribe_materia FOREIGN KEY (clave_M)
    REFERENCES materia(clave_M),
    CONSTRAINT ck_inscribe_califinal CHECK (cali_final BETWEEN 0 AND 10)
);
GO
