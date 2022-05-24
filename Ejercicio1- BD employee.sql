
use master

--1. Crea una base de datos llamada "employee_employee".
create database employee_employee


--2. Crea una tabla llamada "employee" con los campos "id", "first_name", "last_name". 
use employee_employee

CREATE TABLE employee (
    id INT PRIMARY KEY IDENTITY (1, 1),
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
);

--3. Crea una tabla "employee_department" con los campos "id", "name", "description". 
CREATE TABLE employee_department (
    id_dep INT PRIMARY KEY IDENTITY (1, 1),
    name_dep VARCHAR (50) NOT NULL,
    description_dep VARCHAR (150) NOT NULL,
);

--4. Haz los cambios necesarios en la base de datos para poder asignarle a los empleados su respectivo departamento.

--Se agrega el campo id_dep a la tabla employe
ALTER TABLE employee
ADD id_dep INT

--Se agrega foreign key entre la tabla employee y employee_deparment

ALTER TABLE employee
   ADD CONSTRAINT fk_id_departamento
   FOREIGN KEY (id_dep) 
   REFERENCES employee_department(id_dep);


--5. Inserta 4 empleados y 6 departamentos de datos, asígnales a los empleados un departamento. 

delete from employee;
DBCC CHECKIDENT ('employee', RESEED, 0)

INSERT INTO employee_department (name_dep, description_dep)
VALUES	('Contabilidad y Finanzas', 'Administración y manejo del area contable de la empresa'),
		('Recursos Humanos', 'Encargado del proceso de reclutamiento y seleccion del personal'),
		('Ventas', 'Estrategias comerciales y de venta, soporte de ventas y operaciones comerciales'),
		('Marketing', 'Su objetivo es llegar al público o audiencia con mayor facilidad a través de un mensaje comercial eficiente'),
		('Sistemas', 'Encargado de proveer información, así como de proporcionar las herramientas necesarias para manipularla'),
		('Producción', 'Encargado de la elaboracion del producto o servicios al mayor nivel de calidad posible y tiempos establecidos');

INSERT INTO employee (first_name, last_name, id_dep)
VALUES	('Marcos', 'Vargas', 6),
		('Avril', 'Pérez', 4),
		('Joseph', 'Martinez', 5),
		('Fernanda', 'Gonzalez', 2);

--Muestra los empleados y su departamento asignado
 select first_name, last_name, name_dep, description_dep from employee E
  join employee_department D
  on E.id_dep= D.id_dep;


select * from employee;
select * from employee_department;