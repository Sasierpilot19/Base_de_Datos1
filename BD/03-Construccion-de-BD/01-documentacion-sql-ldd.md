# Construccion de base de datos con SQL- LDD

SQL (Structured Query Lenguage) se divide en 5 grandes catetorias:

1. **DDL (Data Definition Language)**
2. **DML (Data Manipulation Language)**
3. **DQL (Data Query Leaguage)***
4. **DCL (Data Control Language)**
5. **TCL (Transaction Control Language)**

## SQL-DDL
**Lenguaje de definicion de datos** 

Se utiliza para crear y modificar la estructura de una base de datos:

- Base de datos 
- Tablas 
- Vistas 
- Indices 
- Restricciones 
- Esquemas 
- Store procedures
- Trigger
- Functions

## Comandos principales

| Comando   |Descripcion|
|-----------|-----------|
|           |           |
| CREATE | Crear objetos  |
|  ALTER| Modifica objetos |
| DROP| Eliminar objetos  |
| TRUNCATE| Vaciar una tabla |

## SQL-DML

**Lenguaje de manipulacion de datos**

Sirve para **trabajar con la informacion almacenada** 
Aqui no cambia la estructura, sino los registros

## Comandos principales

| Comando   |Descripcion|
|-----------|-----------|
| INSERT| Inserta registros |
| UPDATE| Actualiza Registros |
| DELATE| Elimina registros|  

## SQL-DQL

**Lenguaje de consulta de datos**

Su funcion es **consultar informacion**

## Comandos principales

| Comando   |Descripcion|
|-----------|-----------|
| SELECT| Consultar información |

Generalmente se combina con:

- WHERE
- ORDER BY 
- GROUP BY 
- HAVING 
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTINCT 
- TOP / LIMIT
- Funciones de agregadoo (SUM, AVG, MAX, MIN, COUNT)
- Funciones de ventana (window function)

## Nomenclatura snake_case 

**snake_case** es la convencion mas recomendada el dia de hoy si se busca una 
nomenclatura moderna, portable y alineada con buenas practicas en distintos motores
de base de datos.

La razon es que funciona de forma consistente en **SQL Server, MySQL y postgreSQL**.
Con snake_case se evitan problemas de mayusculas y se hacen las consultas mas legibles

**Estandar de construccion:**

| Objeto  |Convencion |Ejemplo|
|-----------|-----------|-----------|
| Base de datos | snake_case  | control_escolar |
| Esquema | snake_case  | ventas, rh, segusridad |
| Tabla | snake_case  | cliente, pedido, detalle_pedido |
| Columna | snake_case  | cliente_id, fecha_registro, nombre, correo_electronico |
| PK | <tabla>_id  | cliente_id, categoria_id,  |
| FK | Igual que la PK referenciada  | cliente_id, producto_id  |
| Tabla Puente | <tabla1>_<tabla2>  | alumno_curso, provedor_producto   |

**Nombre de las restricciones**

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tabla_referenciada
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_actvio

## ALTER TABLE

Permite modificar una tabla existente

- Agregar columnas
- Eliminar columnas 
- modificar columnas 
- agregar restricciones 
- eliminar restricciones

