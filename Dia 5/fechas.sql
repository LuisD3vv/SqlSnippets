-- Funciones de fecha y hora

/*
YEAR (), devuelve la parte entera del año,
para una fecha especifica

MONTH() y DAY() funcionan de forma parecida pero con el 
mes y dia respectivamente

DATEADD() Agrega un intervalo de hora/fecha a una fecha y luego
devuelve la fecha

*/

-- Obtener un intervalo de fechas
select fecha_estreno,
date_add(fecha_estreno, interval 30 day) 
from NetflixDB.Episodios ;

-- Datediff es direfencia de fechas y curdate es paa traer la fecha actual
select  *,
datediff(curdate(),fecha_estreno) as diasEstreno
from NetflixDB.Episodios
