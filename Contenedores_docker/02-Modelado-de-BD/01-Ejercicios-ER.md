# EJERCICIOS MODELO ENTIDAD RELACION 
```
Ejercicio 1. 
```
En un hospital se registra informacion de sus pacientes

> de cada paciente se desea almacenar: 

- Algo que lo identifique 
- Nombre 
- Fecha de nacimiento 

> De un expediente medico se almacena:

- Numero de expediente
- Fecha de apertura
- Tipo de sangre

> Reglas de negocio:

1. Cada paciente debe tener exactamente 1 expediente medico
2. Cada expediente medico pertenece a un unico paciente 
3. No puede existir un expediente sin paciente
4. No puede haber un paciente sin expediente

## Resultado Modelo E-R
### Hospital
![alt text](../../img/Ejercicio1.drawio.png)

```
Ejercicio 2. 
```
Una universidad adminitra: 

- Profesores 
- Cursos 

> De cada profesor se almacena:
 
- Clave profesor 
- Nombre
- Especialidad 

> De cada curso se almacena: 

- Identificacion del curso 
- Nombre del curso 
- Créditos

> Reglas de negocio:

- Un profesor puede impartir varios cursos 
- Un curso solamente puede ser impartido por un profesor
- Puede existir un profesor que actualmente no imaprta cursos
- Todo curso debe ser asignado a un profesor

Se debe realizar lo siguiente:

- Entidades
- Identificar la relacion

**IMPARTE** 
- Determinar la cardinalidad
- Determinar la participacion 

## Resultado Modelo E-R
### Universidad
![alt text](../../img/Ejercicio2.drawio.png)
```
Ejercicio 3.
```
Una escuela administra alumnos y materias:

> De cada alumno se almacena:
- Matricula 
- Nombre 
- Semestre

> De cada materia se almacena: 
- Clave de la materia
- Nombre
- Creditos

> Reglas de negocio:

1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos inscritos 
4. Todo alumno debe estar inscrito en almenos una materia 
5. De cada inscripcion se debe almacenar fecha de inscripcion y 
calificacion final 

**INSCRIBE**
- Determinar la cardinalidad
- Determinar la participacion 

## Resultado Modelo E-R

### Escuela
![alt text](../../img/Ejercicio3.drawio.png)

```
Ejercicio 4.
```
Una empresa encargada de realizar venta de productos:

> De cada cliente se almacena:
- Numero de cliente que lo identifique
- Su nombre que es una persona moral
- RFC

> La empresa realiza pedidos en los cuales almacena:
- Numero de pedido 
- Fecha

> La empresa almacena productos de los cuales registra:
- Numero de producto 
- Nombre 
- Precio

> Al realizar los pedidos deben registrar: 
- La cantidad de productos pedidos
- Precio

> Reglas de negocio:
1. Un cliente puede realizar muchos pedidos
2. Cada pedido pertenece a un solo cliente
3. Un pedido puede contener varios productos
4. Un producto puede aparecer en muchos pedidos
5. Un pedido debe de tener al menos un poducto
6. Un producto puede no haber sido vendido 
7. El detalle del pedido no existe sin pedido 
8. El detalle del pedido no existe sin producto
9. El detalle almacena cantidad y precio de venta

## Resultado Modelo E-R
### Empresa 

![alt text](../../img/Ejercico4-1.drawio.png)
-------
![alt text](../../img/Ejercicio4-2.drawio.png)

```
Ejercicio 5
```

## Modelo E-R

![alt text](../../img/Ejercicio5.drawio.png)