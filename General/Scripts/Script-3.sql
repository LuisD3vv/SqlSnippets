INSERT INTO autores (nombre, nacionalidad) VALUES
  ('Gabriel García Márquez', 'Colombiano'),
  ('J.K. Rowling', 'Británica'),
  ('Haruki Murakami', 'Japonés');

INSERT INTO libros (titulo, autor_id, año_publicacion, precio) VALUES
  ('Cien años de soledad', 1, 1967, 25.50),
  ('Harry Potter y la piedra filosofal', 2, 1997, 30.00),
  ('Kafka en la orilla', 3, 2002, 22.75);

SELECT libros.titulo, autores.nombre AS autor, libros.año_publicacion, libros.precio
FROM libros
JOIN autores ON libros.autor_id = autores.id;