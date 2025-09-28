-- Operaciones con strings (texto)

-- Funcion para convertir caracteres en mayusculas
SELECT UPPER(nombre) as nombre_en_mayusculas FROM NetflixDB.Actores;
-- Funcion para convertir caracteres en minusculas

SELECT LOWER(nombre) as nombre_en_minusculas FROM NetflixDB.Actores;
-- Funcion para concatenar texto, ya sea columnas o texto, separadas por comas

SELECT CONCAT(titulo, ' (', año_lanzamiento, ') ') as Titulo_ano FROM NetflixDB.Serie;
-- Funcion para extrarer una parte especifica de una cadena de texto

SELECT titulo, SUBSTRING(titulo,1,5 )  as Extracto FROM NetflixDB.Series;
-- para conoer la cantiad de caracteres que tiene una cadena

SELECT titulo,length(titulo) Extracto FROM NetflixDB.Series;
-- Funcion para empezar desde la parte izquierda de una tupla, es decir de toda la cadena completa
SELECT
    titulo,
    LEFT(titulo, 3) as Inicio_titulo,
    RIGHT(titulo, 3) as Fin_titulo
FROM NetflixDB.Series;
