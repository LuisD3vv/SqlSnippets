-- Base de Datos facturaciones_ventas
-- Instructor: Dr Gerardo Galvez Gamez
-- Lenguaje de Consulta de Datos
-- Lic. en Ing. en Ciencia de Datos FIC-UAS 2026


-- Consultas con ANY
-- 1

/*
Esta subconsulta devuelve las cuentas que tienen al menos un movimiento
comparando el rfc cliente con alguna coincidencia dentro de la tabla consultas,

rfc_cliente ANY {rfc_cliente.mov1,rfc_cliente.mov2,rfc_cliente.mov3}
*/

SELECT 
	rfc_cliente,
	nombre,
	apellido_paterno,
	apellido_materno
FROM clientes
WHERE rfc_cliente = ANY (
	SELECT rfc_cliente FROM facturas
	WHERE facturas.rfc_cliente = clientes.rfc_cliente
);


-- 2
/*
Esta subconsulta compara el valor escalar de precio venta
con un posible subconjunto de valores en detalle faturas
*/
SELECT
	codigo_articulo,
	precio_venta
FROM detalles_facturas
WHERE precio_venta > ANY (
	SELECT precio FROM articulos
	WHERE articulos.codigo = detalles_facturas.codigo_articulo 
);
SELECT * FROM articulos WHERE codigo = '0000000000002';
-- 450

SELECT * FROM detalles_facturas WHERE codigo_articulo = '0000000000002';
-- 3200

-- Dos subconsultas extras ANY

-- 1.1 seleccionar entre fechas
SELECT * FROM municipios

(SELECT * FROM facturas WHERE FECHA BETWEEN '2024-01-1' and '2024-01-21')




-- Subconsultas con ALL

-- 1
/*
esta consulta compara el precio donde es menor que todas las apariciónes
que tenga precio_venta
en detalles de facturas ese mismo producto.
dandonos el resultado solicitado pero con enfoque diferente, ya que se debe de comparar un valor con varios no el precio de venta con uno solo
*/

SELECT
	codigo,
	nombre,
	precio
FROM articulos a
WHERE precio < ALL (
	SELECT precio_venta FROM detalles_facturas df
	WHERE df.codigo_articulo =  a.codigo
);

-- 2
/*
Tabla clientes y detalle de factura

Esta consulta busca clientes que tengan mas movimientos que
alguno otro apellidado gamez, para eso necesitamos los movimineots
de todos vs los de games

mas compras = mas facturas (en este contexto), dando que realmente
no hay ningunom ya que todos tienen o menos o igual
es decir 2 compras.
*/

SELECT 
    c.rfc_cliente,
    c.nombre,
    c.apellido_paterno,
    c.apellido_materno
FROM clientes c
JOIN facturas f
ON c.rfc_cliente = f.rfc_cliente -- traer la tabla facturas
GROUP BY c.rfc_cliente,c.nombre,c.apellido_paterno,c.apellido_materno
HAVING COUNT(*) > ALL ( -- contamos los registros de los grupos creados 
	SELECT COUNT(*) -- Cuenta los registros.
	FROM clientes c2
	JOIN facturas f2
		ON f2.rfc_cliente = c2.rfc_cliente
	WHERE c2.apellido_paterno = 'Gomez'  or c2.apellido_materno = 'Gomez'
	GROUP BY c2.rfc_cliente
);

 --  Comprobacion de lo que digo
SELECT c.rfc_cliente,c.nombre,c.apellido_materno,COUNT(*) as compras
FROM facturas f
JOIN clientes c
ON f.rfc_cliente = c.rfc_cliente
GROUP BY c.rfc_cliente,c.nombre,c.apellido_materno;



