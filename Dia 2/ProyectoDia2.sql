CREATE TABLE Equipos (
	EquipoID INT AUTO_INCREMENT PRIMARY KEY,
    HeroeID INT REFERENCES Heroes(HeroeID),
    Equipo varchar(45)
);

INSERT INTO Heroes (Nombre, Edad, Estatura,Habilidades) VALUES 
('Superman', 86, 1.91,'Fuerza'),
('Spider-Man', 25, 1.78,'EL mejor'),
('Black Widow', 39, 1.70,'Culo'),
('Batman', 45, 1.88,'Dinero'),
('Capitán América', 106, 1.88,'Suero'), -- Edad biológica principal.
('Storm', 40, 1.80,'xmen'),
('Flash', 29, 1.83,'SuperVelocidad');

SELECT * FROM Equipos;

INSERT INTO Equipos(HeroeID,Equipo) values 
(7, 'Vengadores');