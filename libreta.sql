select count(*) from ciudades c

select sum(c.poblacion) from ciudades c;

select avg(c.poblacion) from ciudades c;

select min(c.poblacion) from ciudades c;

select max(c.poblacion) from ciudades c;

select count(*) from idiomaspaises i where i.codigo_pais = 'MEX';


select min(p.superficie ),max(p.superficie ) from paises p;


SELECT p.nombre
FROM paises p
WHERE p.superficie = (SELECT max(superficie) FROM paises);



SELECT p.codigo ,p.nombre
FROM paises p
WHERE p.superficie = (SELECT min(superficie) FROM paises);  



-- cuenta ahorros

select count(*) as cuentas_registradas from cuentas c;

select sum(c.capital ) from cuentas c ;

select max(c.capital ) from cuentas c ;

select min(c.capital ) from cuentas c ;

-- quien tiene

select c.nombre,c.capital 
from cuentas c
where c.capital = (select max(capital) from cuentas);


select concat('$',round(avg(capital)) ) from cuentas;


-- paises

select upper(p.nombre ) from paises p ;

select lower(p.nombre ) from paises p ;

select p.nombre,length(p.nombre),p.poblacion  from paises p;s

select substring(p.nombre,1,3) from paises p;

// asi al reves
select substring(p.nombre, length(p.nombre) -2 ,3) from paises p;

select concat_ws(' - ',p.nombre,p.continente) from paises p 

-- expresion,inicio,longitud
select substring(p.nombre,3,5) from paises p;

-- cuenta ahorros

select  nombre from cuentas; -- obtener clieentes con nombre en mayusculas

select 
	id_cuenta,
	concat_ws(' ',nombre ,apellido_paterno,apellido_materno )
	as nombre_completo
from cuentas;


select id_cuenta,nombre,length(nombre) from cuentas;


select id_cuenta,nombre,substring(nombre,1,3) from cuentas;

-- sintaxis sospechosa fecha::DATE



-- LABORATORIO GUIADO

-- 1
select
	nombre,
	poblacion
from ciudades
where codigo_pais  ='MEX';

-- 2 
select 
	nombre
	poblacion
from paises
where poblacion > 1000000000;

--3 
select 
	nombre,
	poblacion
from paises
where (poblacion > 50000000) and (poblacion < 100000000);


select 
	nombre,
	poblacion
from paises
where poblacion between 50000000 and  100000000;


-- 4 
select 	codigo_pais, nombre from ciudades where codigo_pais = 'MEX' or  codigo_pais = 'ESP';


select 	codigo_pais, nombre from ciudades where codigo_pais in ('MEX','ESP');

-- 5
select sum(poblacion) from paises where continente = 'North America';

-- 1 

select 
    nombre, 
    población
from 
ciudades 
order by nombre desc;

-- 2

select 
    nombre, 
    poblacion
from 
ciudades 
where codigo_pais = 'MEX'
order by nombre asc;

3 -- 

select 
    nombre, poblacion 
from 
    paises 
where continente = 'Asia' limit 5;

-- 4
select 
    nombre, poblacion 
from 
    paises 
where continente = 'Asia'
order by nombre desc
 limit 5;


-- 5 

select continente , 
    sum(poblacion) as total_poblacion
from paises 
group by continente;

--6 
select codigo_pais, 
    sum(poblacion) as total_poblacion
from ciudades 
group by codigo_pais;





