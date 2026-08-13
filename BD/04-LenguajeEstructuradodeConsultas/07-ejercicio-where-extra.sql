/*==============================================
Ejercicio extra con la base de datos NorthWind
===============================================*/

CREATE DATABASE NorthWind;
GO

USE NorthWind;
GO
-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.

SELECT *
	o.OrderId AS numero_orden,
	o.CustomerId AS cliente,
	o.ShipCountry AS pais_envio,
	o.OrderDate AS fecha_orden,
	UPPER (FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER (FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART (YEAR o.OrderDate) AS [año_orden]
FROM Orders AS o;
WHERE o.ShipCountry IN ('France','Brazil','Belgium')
	AND 
	o.CustomerId IN ('VICTE','HANAR','SUPRD')
	AND 
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31'
ORDER BY  o.OrderDate DESC;

-- Mostrar todos los productos que no pertenecen a la categoria 1,7 o 12

-- OPERADOR BETWEEN
-- Permite comprobar si un valor se encuentra dentro de un rango inclusivo

/*==================================================================
WHERE columna BETWEEN limite_inferior AND limite_superior
====================================================================*/

-- Mostrar empleados con salario entre $15,000 y $20,000, incluyendo ambos limites

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE e.salario>=15000
      AND
      e.salario<=20000;

-- Mostrar los productos que los precios esten en el rango de 100 y 200
SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio BETWEEN 100 AND 200;
-- Mostrar las ventas del 1 de enero de 2025 al 10 de enero de 2025
SELECT
    v.id_venta AS [numero_venta],
    v.id_cliente AS [cliente],
    v.id_empleado AS [vendedor],
    v.fecha AS [fecha_venta],
    UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
    UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
    DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;

SELECT *
FROM Customers AS c
WHERE c.CompanyName LIKE 'Bo%';

-- Buscar los correos de los clientes que terminen exactamente con 10@gmail.com

SELECT *
    c.id_cliente,
    c.nombre,
    c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@gmai.com'

-- Mostrar los nombres de los productos que contienen el caracter 1

SELECT *
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%';

SELECT *
FROM Customers AS c
WHERE c.CompanyName LIKE '%er%';
