/* Sprint Módulo 5 Grupo 2 */


/*Creando la base de datos, las tablas e ingresando las entradas*/
START TRANSACTION;

-- Creando la base de datos
CREATE DATABASE IF NOT EXISTS sprint_5;

-- Creando un usuario con todos los privilegios
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'contraseña';

-- Otorgando los privilegios
GRANT ALL PRIVILEGES ON sprint_5.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;

-- Usando la base de datos
USE sprint_5;

-- Creando la tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo VARCHAR(100),
    veces_utilizado INT DEFAULT 1,
    PRIMARY KEY (id)
);

-- Insertando 5 entradas a la tabla 'usuarios'
INSERT INTO usuarios (nombre, apellido, edad, correo, veces_utilizado)
VALUES
    ('Juan', 'Pérez', 25, 'juan@correo.com', 3),
    ('María', 'Gómez', 30, 'maria@correo.com', 2),
    ('Pedro', 'López', 28, 'pedro@correo.com', 1),
    ('Ana', 'Martínez', 35, 'ana@correo.com', 5),
    ('Luis', 'Rodríguez', 32, 'luis@correo.com', 4);

-- Creando la tabla de operadores
CREATE TABLE operadores(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo VARCHAR(100),
    veces_utilizado INT DEFAULT 1,
    PRIMARY KEY (id)
);

-- Insertando 5 entradas a la tabla 'operadores'
INSERT INTO operadores (nombre, apellido, edad, correo, veces_utilizado)
VALUES
    ('Laura', 'García', 27, 'laura@correo.com', 2),
    ('Carlos', 'Ramírez', 29, 'carlos@correo.com', 3),
    ('Sofía', 'Hernández', 31, 'sofia@correo.com', 1),
    ('Miguel', 'Torres', 33, 'miguel@correo.com', 2),
    ('Isabel', 'Vargas', 26, 'isabel@correo.com', 2);

-- Creando la tabla de operaciones
CREATE TABLE operaciones (
  id INT AUTO_INCREMENT,
  operador INT,
  cliente INT,
  fecha DATE,
  evaluacion INT CHECK (evaluacion >= 1 AND evaluacion <= 7),
  PRIMARY KEY (id),
  FOREIGN KEY (operador) REFERENCES operadores (id),
  FOREIGN KEY (cliente) REFERENCES usuarios (id)
);

-- Insertando 10 entradas a la tabla 'operaciones'
INSERT INTO operaciones (operador, cliente, fecha, evaluacion)
VALUES
	(1, 3, '2023-01-01', 4),
	(1, 2, '2023-02-02', 3),
	(2, 5, '2023-03-03', 7),
	(2, 1, '2023-04-04', 2),
	(2, 4, '2023-05-05', 5),
	(3, 2, '2023-06-06', 6),
	(4, 5, '2023-07-07', 1),
	(4, 1, '2023-08-08', 5),
	(5, 4, '2023-09-09', 3),
	(5, 3, '2023-10-10', 7);

COMMIT;

/*
Seleccionando la información requerida
*/

-- Tres mejores evaluaciones
SELECT * FROM operaciones ORDER BY evaluacion DESC LIMIT 3;

-- Tres peores evaluaciones
SELECT * FROM operaciones ORDER BY evaluacion ASC LIMIT 3;

-- El operador con más soportes
SELECT * FROM operadores WHERE veces_utilizado = (SELECT MAX(veces_utilizado) FROM operadores);

-- El cliente que menos veces ha utilizado la aplicación
SELECT * FROM usuarios WHERE veces_utilizado = (SELECT MIN(veces_utilizado) FROM usuarios);

/* Añadiendo 10 años a los primeros tres usuarios */
UPDATE usuarios SET edad = edad + 10 ORDER BY id LIMIT 3;
SELECT * FROM usuarios;

/* Renombrando la columna 'correo' a 'email' para la tabla de usuarios y operadores */
START TRANSACTION;

-- Renombrar la columna 'correo' en la tabla 'usuarios'
ALTER TABLE usuarios CHANGE COLUMN correo email VARCHAR(100);

-- Renombrando la columna 'correo' en la tabla 'operadores'
ALTER TABLE operadores CHANGE COLUMN correo email VARCHAR(100);
COMMIT;

-- Seleccionando sólo a operarios mayores de 20 años
SELECT * FROM Operadores WHERE Edad > 20;
