-- El dia de hoy comenzaremos con subconsultas
-- Basicamente es una consulta dentro de otra consulta, para combinar datos

SELECT * FROM Episodios
WHERE serie_id = (SELECT serie_id FROM Series WHERE titulo = 'Sherlock');

-- Hay que fijarse porque mysql es sensible a case

SELECT titulo FROM Series
WHERE serie_id IN (
SELECT serie_id FROM Episodios
group by serie_id
having avg(duracion) > 8
);

/*
La subconsulta dentro de la otra, puede ser como tal una consulta con sus propias
condiciones y todo como vemos en el ejemplo que hasta se usan agregacion.
pero el resultado de esa consulta se resume a un numero de ID que se comparan
en el select exterior.
*/

-- Condicional IF

SELECT 
	titulo,
	rating_imdb,
	IF(rating_imdb >= 8,'Alto','Bajo') AS 'Categoria de rating'
FROM Episodios;

SELECT 
	nombre,
    YEAR(fecha_nacimiento) as nacimiento, -- solo para devolver y comprobar la edad
    IF(YEAR(fecha_nacimiento) > 2000,'young','old') AS 'Categoria edad actores'
FROM Actores;

-- Funcion Condicional Case WHEN, para estructuras condicionales mas complejas

SELECT
	titulo,
    CASE
		WHEN año_lanzamiento >= 2020 THEN 'Nueva'
        WHEN año_lanzamiento between 2010 and 2019 THEN 'Clasico'
        ELSE 'Antigua'
		END AS categoria
FROM Series;
        
-- Ejericio 1 de plataforma

SELECT 
	titulo,
    CASE
		WHEN año_lanzamiento < 2010 THEN 'Antigua'
        WHEN año_lanzamiento >= 2010 THEN 'Reciente'
        END as Antigüedad
FROM Series;


-- El otro ejercicio de la plataforma

SELECT 
	titulo,
    CASE
    -- necesita estar en comillas, para evitar que sql piense que es una columna o identificador
		WHEN genero = 'Drama' THEN 'Dramático'
        WHEN genero = 'Comedia' THEN 'Divertido'
        ELSE 'Otro'
        END AS 'Categoría de Género'
FROM Series;

select * from Series;


-- Realizar cast a los tipos de datos

describe Episodios;

Select * from Episodios
where cast(fecha_estreno AS date) > '2010-01-01';


SELECT 
titulo,
cast(año_lanzamiento as char) as 'Año de lanzamiento'
FROM 
Series;


SELECT titulo, 
CAST(año_lanzamiento AS CHAR) AS
'Año de Lanzamiento' FROM Series;