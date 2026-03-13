WITH depositos AS (
	SELECT * FROM movimientos WHERE tipo = 'D'
) -- Es una subconsulta que o existe por si misma, deop
SELECT
	d.id_cuenta,
	(SELECT nombre
	FROM cuentas c
	WHERE c.id_cuenta = d.id_cuenta -- correlacion / relacion logica de dependencia
	) AS nombre,
	SUM(d.cantidad) as Total_depositos
FROM depositos d -- Tabla movimentos
GROUP BY id_cuenta;


-- resultado = f(fila_actual)