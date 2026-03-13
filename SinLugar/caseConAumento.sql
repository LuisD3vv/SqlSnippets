-- Respetar el orden de ejecucion del sql antes de enojarse porque no funciona.

SELECT c.id_cuenta,c.nombre,
  -- utilizando funcion de agregacion en un case, con then 1 end, null es ignorado por count.
    COUNT(CASE WHEN m.tipo = 'R' then 1 end) AS retiros, COUNT(CASE WHEN m.tipo = 'D' then 1 
    end) AS depositos, count(tipo) as total_movimientos
