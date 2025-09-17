CREATE TABLE Categorias (
	ID_Categoria Serial primary key,
	Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
	ID_Producto serial primary key,
	Nombre_Producto Varchar(100) NOT NULL,
	Precio DECIMAL(10,2),
	ID_Categoria int references Categorias(ID_Categoria)
);

-- INSERTAR DATOS EN LA TABLA CATEGORIA

INSERT INTO Categorias(Nombre)
	VALUES
	('Camaras'),
	('Perifericos'),
	('Monitores'),
	('Adaptadores'),
	('Laptops'),
	('Dispositivos inteligentes'),
	('VideoJuegos'),
	('Software');

select * from Categorias;

-- INSERTAR DATOS EN LA TABLA PRODUCTO
--NUMERACION MAL, COLOCAR EN LAS CATEGORIAS CORRESPONDIENTES

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria)
VALUES('Camara Reflex Cannon', 5490.99, 1),
	 ('Mouse Inalambrico Logitech', 290.99, 2),
	 ('Monitor Dell 24" Full HD', 2999.0, 3),
	 ('Monitor HP 24" Full HD', 2000, 3),
	 ('Adaptador HP Envy', 9990,4),
	 ('Altavoz Alexa Echo Dot', 839.90, 6),
	 ('PlayStation 5', 9999.99, 7),
	 ('Laptop Dell', 15290, 5);
	 

select * from Productos;

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria)
VALUES ('Laptop HP',12999,5);


DELETE FROM Productos
where ID_Productos=7;


DELETE FROM Productos
where Nombre_Producto='Laptop HP';

--Eliminar productos de categoria Monitores mediante su id, con su nombre.

DELETE FROM Productos
WHERE ID_Categoria = (
	SELECT ID_Categoria
	FROM Categorias
	WHERE nombre='Monitores'
);

--Actualizar Registro

ALTER TABLE Productos
ADD COLUMN Stock INT;

SELECT *FROM Productos;

UPDATE Productos
SET stock = 18
where ID_Producto= 90;


select * from Productos;
select * from Categorias;

--Agregar nuevas categorias


INSERT INTO Categorias(Nombre)
	VALUES ('Almacenamiento'),
	('Impresoras'),
	('Ofertas');


update Productos
set stock = 45
where nombre_producto = 'Laptop Dell';

INSERT INTO Productos(Nombre_Producto,Precio,ID_Categoria,stock)
VALUES('Laptop HP', 21200.50,5,10),
	 ('Teclado Mecanico', 375, 2, 15),
	 ('Monitor Samsumg 24 FHD "', 2999.00, 3,6),
	 ('Disco Duro SSD 1TB', 1150, 9, 9),
	 ('Memoria RAM 16GB', 1180,2,20),
	 ('Impresora Epson', 5180.90, 6,5),
	 ('Router WIFI', 1130,4,5);


--Actualizar precios %10 de la categoria Laptops
UPDATE Productos
SET precio = precio* 1.1
where ID_Categoria = 5;


--Hacer un descuento del 20% a los productos cuyo stock es 
--Menor a 10 unidades

UPDATE Productos
SET precio = precio * 0.8
where stock > 10;


-- descuentos del 10 a productos con precios mayores 5k

UPDATE Productos
SET precio = precio * 0.9
where precio > 5000;

--Incrementar el stock de productos de la categoria 2
UPDATE Productos
SET stock = stock + 10
where ID_Categoria = 2;

--Transladar los precios con menor precio a la categoria oferta

select * from Productos;
select * from Categorias;

UPDATE Productos
SET ID_Categoria = 11
where precio < 1000;


--Poner stock a 50 todos los productos
UPDATE Productos
set stock = 50;

--Eliminar categorias repetidas


------------------Consultas------------------
--obtener todos los productos de la categoria 3

SELECT * FROM productos
where ID_Categoria =11;

Select Nombre_Producto,precio  from productos
where ID_Categoria = 11;

--Mostrar los productos superiores a 5000

select * from productos 
where precio > 5000;

--eliminar algo que repeti

"""
Por ejemplo, DELETE FROM
nombre_tabla WHERE id IN
(SELECT id DE (SELECT id,
NÚMERO_DE_FILA() OVER( PARTITION BY columna_1, columna_2 ORDER BY id )
COMO núm_fila DE nombre_tabla ) t DONDE t. núm_fila > 1 ))
"""
--Mostrar los productos mas caro  y el mas barato

-- ASC (asendente) 
Select Nombre_producto, precio FROM productos
order by precio ASC
limit 1;
--DESC(decendente)
Select Nombre_producto, precio FROM productos
order by precio DESC
Limit 3; --limitar lo que muestra

--Buscar Productos contienen una palabra en especifico.
Select *from productos
where Nombre_producto like '&Adap%';
Buscar productos que empiecen con al letra L

--Buscar Productos que inicien con una Letra L.
Select * from productos
where Nombre_producto like 'L%';


--Buscar Productos que inicien con una letra especifica.
Select * from productos
where Nombre_producto like '&ll';

--usando join
SELECT productos.ID_Producto, productos.Nombre_producto, productos.precio, categorias.Nombre_categoria
FROM productos
JOIN categorias ON productos.ID_Categoria = categorias.ID_Categoria;