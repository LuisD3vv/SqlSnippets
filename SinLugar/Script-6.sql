/*
1FN una sola cosa por tabla (valores atomicos, no listas)
2FN cada columna debe de depender de toda la tabla(descomponer)
3FN Nadie depende de otro que no sea la clave(no transiciones en una misma tabla)

Modelo relacional
Tipos de relaciones
1:1 uno a uno
1:M uno a muchos
M:M muchos a muchos
**/


select * from empleados;

select nombre, salario from empleados
where salario > 2000;

select nombre, Fecha_ingreso from empleados
order by Fecha_ingreso asc ;

select Nombre, count(Empleado_ID) as total_emp
from empleados
group by Nombre;

select * from empleados
where Nombre like 'L%'; -- Nombres que comienzan con L

select nombre, salario from empleados
where salario > 2000 and salario < 3000; -- Utilizando conectores logicos

select nombre, Fecha_ingreso from empleados
order by Fecha_ingreso asc 
limit 5;

-- Salario promedio por departamento con AVG

--Todos los empleados del departamento ventas

select nombre from empleados
where Departamento_ID = 1;

-- empleados que no estan asignados a ningun proyecto

select empleados.Nombre, proyectos.Nombre_proyecto
from empleado_proyecto
left join empleados on empleado_proyecto.Empleado_ID = empleados.Empleado_ID
left join proyectos on Empleado_proyecto.Proyecto_ID = proyectos.Proyecto_ID ;


select empleados.Nombre, proyectos.Nombre_proyecto
from empleados
left join empleado_proyecto on empleados.Empleado_ID = empleado_proyecto.Empleado_ID 
left join proyectos on Empleado_proyecto.Proyecto_ID = proyectos.Proyecto_ID ;


select * from empleados;

select nombre,salario from empleados
	where nombre in ('Luis Ramírez', 'Carlos Fernández');


select nombre,salario from empleados
	where salario between 2000 and 2500;

select * from departamentos;

-- CREAR UN CONDICIONAL BASICO QUE IMPRIMIRA SEGUN LA CONDICION DESEADA
select
	nombre,salario,
	case 
		when salario >= 3000 then 'ALTO'
		when salario >= 2000 then 'MEDIO'
		else 'BAJO'
	end as Nivel -- como nombrar a esta nueva columna de comparacion.
from empleados
order by salario desc;
	
INSERT INTO empleados (Nombre, Salario, Departamento_ID, Fecha_ingreso) VALUES
('Lissandro', 1000, 1, '2025-05-05');

-- Los valores utilizados en el IN, se pueden utilizar como recursos logicos dado que es un dato bool true o false 0 o 1
select nombre,salario from empleados;

select 	
	nombre, salario,
	case
		when salario >= 100000 then 'TIPO 1- Ejecutivo'
		when salario >= 30000 then 'TIPO 2- Accionista'
		when salario >= 20000 then 'TIPO 3- Area IT'
		when salario >= 10000 then 'TIPO 4- Becario'
		when salario >= 1000 then 'TIPO 5- Pendejo'
	end as Categoria_Salarial
from empleados
order by salario desc;
	
update empleados 
set salario = 120000
where nombre in ('Pavel Beltrán','Kevin Omar','Luis Chan', 'Joto Zepeda');


update empleados 
set salario = 150000
where nombre = 'Lissandro';

select distinct nombre from empleados; -- Aqui lo nuevo es el uso del distinct jeje.

--operadores logicos
>
<
=
==
!=
<>
-- Contanto las putas palabras y restando la diferencia
select count(city) - count(distinct city)
from station

--Encontrando la ciudad con mas y con menos caracteres
select nombre, min(length(nombre)) from empleados
group by nombre
order by length(nombre) asc, nombre asc -- Se pueden utilizar dos parametros para order, por logica uno despues del otro
limit 1;

select nombre, max(length(nombre)) from empleados
group by nombre
order by length(nombre) desc, nombre desc
limit 1;

--Seleccionar palabras que contengan una vocal a la verga
select distinct nombre 
from empleados
where nombre like 'a%' 
or nombre like 'e%' 
or nombre like 'i%'
or nombre like 'o%' 
or nombre like  'u%';

-- Otro ejercicio nuevo utilizando el pinche where y agrupacion logica
-- por defecto el subtring de la primera letra sera subtring(tabla,1,1) y la ultima subtring(tabla,len(tabla),1)
SELECT nombre
from empleados
where 
(SUBSTRING(nombre, 1 ,1)  like '%a%' 
or SUBSTRING(nombre, 1 ,1)  like '%e%'
or SUBSTRING(nombre, 1 ,1)  like '%i%'
or SUBSTRING(nombre, 1 ,1)  like '%o%'
or SUBSTRING(nombre, 1 ,1)  like  '%u%')
and 
(SUBSTRING(nombre, length(nombre),1) like '%a%'
or SUBSTRING(nombre, length(nombre) ,1) like '%e%' 
or SUBSTRING(nombre, length(nombre) ,1) like '%i%' 
or SUBSTRING(nombre, length(nombre) ,1) like '%o%' 
or SUBSTRING(nombre, length(nombre) ,1) like  '%u%');

--Ejemplo con tabla de nosotoros
select nombre as inicia_con_vocal
from empleados
where SUBSTRING(lower(nombre), 1, 1) IN ('a', 'e', 'i', 'o', 'u')
and SUBSTRING(lower(nombre), length(nombre), 1) in ('a','e','i','o','u');


-- Si existe el pinche were not jjaaj y luego el in como en estte ejemplo, aqui el ejemplo es donde el nombre no comience con una vocal.
SELECT distinct nombre
from empleados
where not
(SUBSTRING(nombre, 1 ,1)  like '%a%' 
or SUBSTRING(nombre, 1 ,1)  like '%e%'
or SUBSTRING(nombre, 1 ,1)  like '%i%'
or SUBSTRING(nombre, 1 ,1)  like '%o%'
or SUBSTRING(nombre, 1 ,1)  like  '%u%')

-- tambien parfa extraer solo la palabra izquieda podemos utilziar el left como aqui
select lower(nombre) from empleados where left(nombre,1) in ('a', 'e', 'i', 'o', 'u');
select lower(nombre) from empleados where right(nombre,1) in ('a', 'e', 'i', 'o', 'u');


-- Otro ejemplo 
SELECT distinct nombre
from empleados
where 
(SUBSTRING(nombre, 1 ,1) not in ('a','e','i','o','u') and SUBSTRING(nombre, length(nombre) ,1) not in ('a','e','i','o','u'));


--El ejemplo aqui dado fue de como se utilizan la sintraxis de ordenacion basica desde selec hasta order by
/*
From - Especica el origen de los datos
where - especifican condiciones que deben de reunir los registros 
group by - seperar los registros en grupos especificos
having - condicion que debe de tener cada grupo
order by - ordenar los registros de acuerdo a un orden especifico
 **/

select nombre, salario
from empleados
where nombre in ('Lissandro','Eduardo Aguilar','Harvey Json')
group by nombre,salario
having salario = 150000
order by nombre asc ;

--where like (que sea similar)
update empleados
set nombre = 'Harvey Json'
where nombre = 'William Hernandez';

update empleados
set salario = 150000
where nombre in ('Eduardo Aguilar','Harvey Json');


select nombre, salario from empleados
where round(salario,1)