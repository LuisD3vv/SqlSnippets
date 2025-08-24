-- seleccionar columnas de una tabla

-- Asi obtenemos todo de la tabla
SELECT * FROM Episodios;

-- Y asi las que necesitemos solamente.
SELECT episodio_id,titulo from Episodios;

-- Y con distict, para valores unicos dentro de una tabla | sin duplicados ,es una clausula

SELECT DISTINCT genero FROM Series;

-- Clausula Order by, tambien ordena alfabeticamente, por defecto se aplcia ASC
SELECT titulo, duracion from Episodios
order by titulo asc;
-- y asi desencente(menor a mayor)
SELECT titulo, duracion from Episodios
order by duracion asc;
-- y asi desencente(mayor a menor)
SELECT titulo, duracion from Episodios
order by duracion desc;

-- Clausula limit, limita la salida de el query al numero que queremos.

SELECT titulo,duracion FROM Episodios ORDER BY duracion DESC LIMIT 5;

-- Clausula Where, nos permite filtrar resultados

SELECT * FROM Series
WHERE genero = 'drama';

SELECT * FROM Series
WHERE año_lanzamiento > 2010;


-- Operadores de comparacion, permiten comparar valores
--  Los mismos de cualquier lenguaje
/*
= Igualdad
<> Desigualdad
<
>
>= menor o igual que
<= mayor o igual que
*/

SELECT * FROM Series where año_lanzamiento < 2015;

-- Operadores Logicos AND OR NOT(invierte la logica), and tiene mayor prioridad que not y or

SELECT titulo,duracion, rating_imdb from Episodios
where duracion >= 45 and rating_imdb >= 9;

-- OR
SELECT * from Series where (genero = 'comedia' or genero = 'animacion');
-- NOT o desigualdad, no es igual a el paramtro
SELECT * from Series where genero <> 'comedia';

-- Clausulas IN y NOT IN, crear una lista de ecepciones

select * from Series
where genero not in ('genero','Drama', 'Drama historico');

-- Clausula LIKE, con comodines %fin inicio% %solo coincidencia%

SELECT * from Series
where titulo LIKE '%The%';