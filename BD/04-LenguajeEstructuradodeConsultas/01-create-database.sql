/*===========================================================================
DQL (Data Query Language ) en SQLServer

Archivo: 01-create-database-sql

Descripcion: Crear la base de datos para la practica de las consultas 
===========================================================================*/
USE master;
GO

if DB_ID('comercial_db') IS NOT NULL 
BEGIN 
	ALTER DATABASE comercial_db
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE

	DROP DATABASE comercial_db
END 
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'La base de datos comercial_db se creo correctamente';
GO
