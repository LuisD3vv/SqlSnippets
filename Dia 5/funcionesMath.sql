-- Funciones matematicas

-- Reondear al entero mas cercano en base al 5, menor a 5 para abajo, mayor para arriba
SELECT
    titulo,
    duracion/60.0 as Horas_Completas,
    ROUND(duracion/60.0,0) as Horas_Completas_Round
    from Episodios;

-- Reondear hacia arriba, al entero mas cercano hacia arriba    
SELECT
    titulo,
    duracion/60.0 as Horas_Completas, 
    ceiling(duracion/60.0) as Horas_para_Arriba
    from Episodios;

-- Reondear hacia arriba, al entero mas cercano hacia abajo
SELECT
    titulo,
    duracion/60.0 as Horas_Completas,
    FLOOR(duracion/60.0) as Horas_para_Abajo
    from Episodios;
