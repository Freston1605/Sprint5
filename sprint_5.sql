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