-- DIA 4 | JOINS

 --  INNER JOIN (combinador dos tablas con coincidencias en ambas tablas (interseccion de conjuntos))


SELECT * FROM Series;
SELECT * FROM Actuaciones;

-- Las intersecciones en las tablas, union en base a aun id especifico(no necesariamente un id)
SELECT
S.titulo,
A.personaje
from Series as S
INNER JOIN Actuaciones as A
on S.serie_id = A.serie_id
--  cuando hay columnas unicas no se necesita el . y algo
WHERE S.titulo = 'the Crown'; 


-- Dato curioso es que se pueden mostrar columnas especificas de la union

SELECT 
S.titulo AS serie,
ep.titulo AS titulo_episodio,
ep.duracion
FROM Episodios AS ep
INNER JOIN Series as S
ON ep.serie_id = S.serie_id
-- En el where no se pueden usar alias, si no el nombre original de la columna
WHERE S.titulo = 'Stranger Things';


-- Left join, los valores de ambos, pero tambien los de la tabla izquierda, incluso si no hay datos en la otra tabla


-- Yo nos sabia que se podian poder asi los alias joder macho
SELECT Series.titulo as 'Titulo de la serie',
	   Episodios.titulo as  'Titulo del Episodio'
FROM Series
LEFT JOIN Episodios
on Series.serie_id= Episodios.serie_id
ORDER BY Series.titulo;

SELECT 
	S.titulo as 'Título de la Serie',
	E.titulo as 'Título del Episodio',
	E.rating_imdb as 'Rating IMDB'
FROM 
	Series as S
LEFT JOIN 
	Episodios as E
ON S.serie_id = E.serie_id

SELECT 
	S.titulo as 'Título de la Serie',
	E.titulo as 'Título del Episodio',
	E.rating_imdb as 'Rating IMDB'
FROM 
	Series as S
LEFT JOIN 
	Episodios as E
ON S.serie_id = E.serie_id
WHERE S.titulo = 'Stranger Things'
ORDER BY E.rating_imdb desc;

-- RIGTH JOIN, los valores de ambos, pero tambien los de la tabla derecha, incluso si no hay datos en la otra tabla

SELECT
	Series.titulo AS 'Titulo de la Serie',
	Episodios.titulo AS 'Titulo del Episodio'
From Episodios
RIGHT JOIN Series
ON  Episodios.serie_id  = Series.serie_id
ORDER BY Series.titulo;


SELECT 
	Series.titulo AS 'Título de la Serie',
	Episodios.titulo AS 'Título del Episodio',
	Episodios.duracion AS 'Duración'
From Episodios
RIGHT JOIN Series
ON Episodios.serie_id  = Series.serie_id
WHERE Episodios.duracion  > 30
ORDER BY Series.titulo;

-- UNION y UNION ALL

/*
 * el operador union se utiliza para combinar el conjutno de resultado 
 * de dos o mas declaraciones select
 * 
 * cada declaracion select dentro de union debe tener el mismo numero de columnas
 * 
 * La diferencia radica es, que union all permite duplicados y union solo valores
 * predeterminados
 * */

-- Permite duplicados, basicamente une peticiones

SELECT * FROM Series
where genero = 'Ciencia Ficcion'

UNION ALL

SELECT * FROM Series
where genero = 'Drama'
SELECT * FROM Series
where genero = 'Ciencia Ficcion'


-- Este no permite duplicados, pero pueden tener diferentes condiciones
-- Deben ser del mismo tipo de dato y el miso orden sin importar el dato
SELECT titulo FROM Episodios
where duracion > 20

union

SELECT titulo FROM Episodios
where rating_imdb > 9

