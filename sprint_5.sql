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