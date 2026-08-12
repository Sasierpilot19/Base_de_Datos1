/*===========================================================================
DQL (Data Query Language ) en SQLServer

Archivo: 06-filtrado_registros_where.sql

Descripcion: Se recuperan unicamente las filas que cumplen determinadas 
condiciones mediante la clausula where

 /*Orden sintactico
 
 SELECT / TOP / DISTINCT
 FROM
 JOIN / ON 
 WHERE
 ORDER BY 
 HAVING
 ORDER BY
 */

 /* Orden de ejecucion 

FROM / JOINS (INNER, LEFT, RIGHT, CROSS, FULL, SELF)
 WHERE 
 GROUP BY
 HAVING 
 SELECT *
 DISTINCT 
 ORDER BY 
 TOP
 */

===========================================================================*/

/*===========================================================================
SINTAXIS 

SELECT
	columna_1,
	columna_2,
	columna_n,
FROM nombre_tabla
WHERE condicion;

NOTA: La condicion puede ser relacional y a combinacion de esta con logica.

NOTA: El SELECT no filtra registros
===========================================================================*/

/*Seleccionar ek producto cuyo precio sea $200*/

SELECT
	p.codigo AS [Código],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos As p
WHERE precio = 200;

-- Seleccionar el cliente cuyo identificadorr es 25

SELECT 
	c.id_cliente,
	CONCAT (c.nombre,' ',
			c.apellido_paterno,' ', 
			c.apellido_materno) AS nombre_completo,
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;


-- Comparacion de cadenas de texto 
-- Los valores de texto deben escribirse entre comillas simples 

-- Seleccionar las categorias donde el nombre sea Computo

SELECT
	c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

--Seleccionar los datos del cliente con nombre Cliente1

SELECT 
	c.nombre [Nombre]
FROM clientes AS c
WHERE c.nombre = 'Cliente1';

-- Seleccionar los datos del empleado que no pertenezca al departamento 1
SELECT
	e.id_departamento [Departamento],
	e.nombre [Nombre empleado] ,
	e.id_empleado [id de empleado]
FROM empleados AS e
WHERE e.id_departamento != 1;

-- Seleccionar los datos de los productos donde el precio sea superior a $400
SELECT
	p.nombre AS [Nombre producto],
	p.precio AS [Precio producto]
FROM productos AS p
WHERE p.precio > 400;

-- Seleccionar los datos de los productos con existencia critica inferior a 10 unidades 
SELECT 
	p.nombre AS [Nombre producto],
	p.existencia AS [Existencias]
FROM productos AS p
WHERE p.existencia < 10;

-- Seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante
SELECT 
	e.nombre AS [Nombre empleado],
	e.salario AS [Salario]
FROM empleados AS e
WHERE e.salario >= 30000;

-- Seleccionar los datos de los productos donde sus precios sean de $10 o menos
SELECT
	p.nombre AS [Nombre producto],
	p.precio AS [Precio producto]
FROM productos AS p
WHERE p.precio <= 100;

-- Comparacion de fechas 
-- Las fechas deben de escribirse entre comillas simples 
-- Se recomienda el formato AAAA-MM-DD


-- Seleccionar los datos de las ventas realizadas el 24 de diciembre de 2025

SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';

--Seleccionar los datos de las ventas realizadas en los meses de Abril

SELECT
	v.id_venta,
	v.fecha,
	YEAR (v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	DAY (v.fecha) AS [Dia],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE MONTH (fecha) = 4;

-- Seleccionar todas las ventas anteriores al 1 de Febrero de 2025

SELECT
	v.id_venta,
	v.fecha,
	YEAR (v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	DAY (v.fecha) AS [Dia],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE YEAR (fecha)= 2025 AND MONTH (fecha) = 2 AND DAY (fecha) <= 1;


--DISTINCT 
--Quita elementos repetidos de una o la combinacion de columnas

SELECT DISTINCT
	sexo
FROM clientes AS c;
GO

SELECT DISTINCT
	c.id_ciudad
FROM clientes AS c
INNER JOIN ciudades AS cu
ON c.id_ciudad = c.id_ciudad;

--Seleccionar los descuentos unicos de las ventas 
SELECT 
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;

SELECT
	p.id_categoria,
	p.id_proveedor
FROM productos AS p;

--TOP
--Limita la cantidad de filas devueltas por una consulta 

SELECT TOP (10)
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;

SELECT TOP (10) PERCENT
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;

SELECT
	v.id_venta,
	v.fecha,
	YEAR (v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	FORMAT (v.fecha, 'MMMM') AS [mes_ingles],
	FORMAT (v.fecha, 'MMMM', 'es-ES') AS [mes_español],
	DAY (v.fecha) AS [Dia],
	FORMAT (v.fecha, 'dddd') AS [dia_ingles],
	UPPER(FORMAT (v.fecha, 'dddd','es-ES')) AS [dia_español],
	UPPER(FORMAT (v.fecha, 'ddd','es-ES')) AS [mes_abreviatura]
FROM ventas AS v
WHERE YEAR (fecha)= 2025 AND MONTH (fecha) = 2 AND DAY (fecha) <= 1;

--Seleccionar los datos de los productos mostrando el codigo y el valor del inventario 
--donde el valor del inventario debe ser mayor a 50,000

SELECT 
	p.codigo AS [codigo_producto],
	p.existencia AS existencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia) > 50000;

--Mostrar los productos con precio que este entre $200 - $300

SELECT 
	p.codigo AS [codigo_producto],
	p.existencia AS existencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200 AND p.precio <= 300;

SELECT 
	p.codigo AS [codigo_producto],
	p.existencia AS existencia,
	p.precio AS precio,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio BETWEEN 200 AND 300;