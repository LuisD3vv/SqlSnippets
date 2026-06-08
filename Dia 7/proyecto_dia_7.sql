-- Crear una base de datos para una biblioteca con las siguientes tablas

CREATE TABLE libros (
	id_libro int not null auto_increment,
	primary key(id_libro),
	titulo varchar(40),
	id_autor int,
	-- si se borra un autor, que es su clave foranea se borrara el libro
	foreign key  (id_autor) references autores(id_autor)
	on delete cascade
	on update cascade,
	fecha_publicacion datetime
);

-- un autor puede tener muchos libros
CREATE TABLE autores (
	id_autor int not null auto_increment,
	primary key(id_autor),
	nombre varchar(40),
	apellido varchar(40),
	nacionalidad varchar(40)
);
-- un libro solo puede estar prestado a una persona
 -- null es asumido
CREATE TABLE prestamos (
	id_prestamo int not null auto_increment primary key,
	id_libro inta unique,
	id_lector int,

	fecha_prestamo datetime,
	fecha_devolucion datetime,
	foreign key (id_libro) references libros(id_libro)
	on delete cascade
	on update cascade,
	foreign key (id_lector) references lectores(id_lector)
	on update cascade
	on delete cascade
);
-- un lector puede alquilar muchos libros
CREATE TABLE lectores (
	id_lector int not null AUTO_INCREMENT,
	primary key(id_lector),
	nombre varchar(40),
	apellido varchar(40)
);

CREATE TABLE historial_prestamos()

-- =========================
-- AUTORES
-- =========================

INSERT INTO autores(nombre, apellido, nacionalidad) VALUES
('Gabriel', 'Garcia Marquez', 'Colombiana'),
('Julio', 'Cortazar', 'Argentina'),
('Mario', 'Vargas Llosa', 'Peruana'),
('Isabel', 'Allende', 'Chilena'),
('Jorge', 'Luis Borges', 'Argentina'),
('Carlos', 'Fuentes', 'Mexicana'),
('Pablo', 'Neruda', 'Chilena'),
('Miguel', 'de Cervantes', 'Española'),
('Octavio', 'Paz', 'Mexicana'),
('Laura', 'Esquivel', 'Mexicana');

-- =========================
-- LECTORES
-- =========================

INSERT INTO lectores(nombre, apellido) VALUES
('Juan', 'Perez'),
('Maria', 'Lopez'),
('Carlos', 'Ramirez'),
('Ana', 'Martinez'),
('Luis', 'Gonzalez'),
('Fernanda', 'Hernandez'),
('Pedro', 'Sanchez'),
('Lucia', 'Torres'),
('Miguel', 'Diaz'),
('Sofia', 'Castro');

-- =========================
-- LIBROS
-- =========================

INSERT INTO libros(titulo, id_autor, fecha_publicacion) VALUES
('Cien Anos de Soledad', 1, '1967-05-30'),
('Rayuela', 2, '1963-06-28'),
('La Ciudad y los Perros', 3, '1963-10-10'),
('La Casa de los Espiritus', 4, '1982-01-01'),
('Ficciones', 5, '1944-01-01'),
('Aura', 6, '1962-01-01'),
('Veinte Poemas de Amor', 7, '1924-01-01'),
('Don Quijote de la Mancha', 8, '1605-01-16'),
('El Laberinto de la Soledad', 9, '1950-01-01'),
('Como Agua para Chocolate', 10, '1989-01-01');

-- =========================
-- PRESTAMOS
-- =========================

INSERT INTO prestamos(id_libro, id_lector,fecha_prestamo,fecha_devolucion) VALUES
(1, 1, '2026-05-05','2026-05-10'),
(2, 2, '2026-06-05','2026-06-20'),
(3, 3, '2026-02-05','2026-05-10'),
(4, 4, '2026-07-05','2026-08-10'),
(5, 5, '2026-08-05','2026-09-10'),
(6, 6, '2026-01-05','2026-12-10'),
(7, 7, '2026-02-05','2026-11-10'),
(8, 8, '2026-03-05','2026-04-30'),
(9, 9, '2026-06-05','2026-05-10'),
(10, 10, '2026-10-05','2026-05-10');
