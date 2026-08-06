/*===========================================================================
DQL (Data Query Language ) en SQLServer

Archivo: 05-basic-queries.sql

Descripcion: Se realizan consultas basicas con SELECT
===========================================================================*/

USE comercial_db;
GO

/*======================================
Uso de SELECT * 
Sintaxis
SELECT * FROM nombre_tabla
Nota: el * significa todas laas columnas de la tabla, 
no se recomienda utilizarla siempre: 
1) Reduce la claridad de la consulta 
2) Puede aumentar el consumo de recursos 
3) Puede afectar aplicaciones futuras 
=======================================*/

SELECT * FROM productos; 

--Proyeccion de la tabla productos
SELECT 
	codigo,
	nombre,
	precio 
FROM productos;
GO
--Alias de columna (Sobrenombre que se le pone a un campo)
SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio  AS precio_unitario
FROM productos;
GO
--Alias con espacios 
SELECT 
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio  AS [precio unitario]
FROM productos;
GO
SELECT 
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio  AS 'precio unitario'
FROM productos;
GO
--Alias sin la instruccion AS (NO RECOMENDADO)
SELECT 
	codigo codigo producto,
	nombre nombre producto,
	precio precio unitario
FROM productos
GO
SELECT 
	codigo [codigo_producto],
	nombre [nombre_producto],
	precio [precio_unitario]
FROM productos;
GO
--Alias de tabla (Util en los JOINS y en nombres ambigüos)

SELECT 
	p.codigo,
	p.nombre,
	p.precio 
FROM productos AS p;
GO

SELECT 
	categorias.id_categoria,
	categorias.nombre,
	productos.id_producto,
	productos.nombre,
	productos.precio
FROM categorias
INNER JOIN
productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT 
	c.id_categoria,
	c.nombre,
	p.id_producto,
	p.nombre,
	p.precio
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria = p.id_categoria;
GO

SELECT 
	p.codigo AS Código,
	p.nombre AS [Nombre producto],
	p.precio 'Precio unitario'
FROM productos AS p;
GO

--Columnas calculadas , campos calculados, y E-R (atributo derivado)

-- Seleccionar el codigo, nombre, precio, existencia, y el valor del inventario 

SELECT 
	p.codigo AS codigo_producto,
	p.nombre AS nombre_producto,
	p.precio As precio_unitario,
	p.existencia ,
	(p.existencia * p.precio) AS precio_inventario
FROM productos AS p;
GO

-- TO DO : Operadores Aritmeticos
-- campos calculados 
/*=================================================================
	+ suma
	- resta
	* multiplicacion
	/ division
	% Modulo o residuo de la division
===================================================================*/

-- Seleccionar los empleados y calcular su salario anual

SELECT 
	e.nombre,
	e.apellido_paterno,
	e. salario AS salario_anual,
	(salario * 12) AS salario_anual
FROM empleados AS e;
GO
/*Seleccionar el detalle de las ventas, mostrando 
 numero de venta, cantidad,precio, descuento
 calcular el importe bruto (cantidad por el precio)
 calcular el importe con descuento (importe_bruto * descuento / 100)
 calcular el importe neto (importe bruto * 1 - el descuento / 100 )*/

 SELECT 
 dv.id_venta AS #venta,
 dv.cantidad AS cantidad_vendida,
 dv.precio AS [precio de venta],
 dv.descuento AS 'descuento de venta',
 (dv.cantidad * dv.precio) AS importe_bruto,
 (dv.cantidad * dv.precio) / (100.0) AS importe_descuento,
 dv.cantidad * dv.precio * (1.0  - descuento / 100.0) AS importe_neto
 FROM detalle_ventas AS dv