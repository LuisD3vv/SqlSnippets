-- Algunas funciones de tiempo

-- tomando en cuenta si son date o timestamp

select extract(year from fecha_estreno) from Episodios;

select CURRENT_DATE(); -- fecha actual / now()

select CURRENT_TIME(); -- hora actual

select SYSDATE(); -- hora de la compu

select TO_CHAR(NOW(),'DD/MM/YYYY');

select TO_DATE('10/12/2221','DD/MM/YYYY');

select now()
