CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    edad INT,
    email TEXT UNIQUE
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    creditos INT
);

CREATE TABLE inscripciones (
    id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(id),
    curso_id INT REFERENCES cursos(id),
    fecha_inscripcion DATE DEFAULT CURRENT_DATE
);
