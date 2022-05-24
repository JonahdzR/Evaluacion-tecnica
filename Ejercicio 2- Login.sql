

--1. Creación de Base de datos 
create database usuarios_prueba

use usuarios_prueba

-- 2. Crear la Tabla usuario_form con los siguientes campos

CREATE TABLE usuario_form (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
	email VARCHAR (100) NOT NULL,
	password VARCHAR (50) NOT NULL
	);

-- Insert de registro
	INSERT INTO usuario_form (name, last_name, email, password)
	VALUES ('Jonathan', 'Hernández', 'jonahdzr@outlook.com','Aa1234567!');


	select * from usuario_form;

-- Select para validar si ya existe un usuario con el mismo correo
	SELECT COUNT(*) FROM usuario_form WHERE email='jonahdzr@outlook.com'