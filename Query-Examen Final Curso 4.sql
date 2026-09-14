create database prueba_actualizar
go

use prueba_actualizar

create table Usuarios (
    idusuario int identity(1,1) primary key,
    Nombre varchar(50) NOT NULL,
    Apellido varchar(50) NOT NULL,
    Correo varchar(100) NOT NULL 
);

insert into Usuarios (Nombre, Apellido, Correo)
values
('Pedro', 'Vargas', 'pedro.vargas@gmail.com'),
('Laura', 'Castro', 'laura.castro@gmail.com'),
('Diego', 'Ramírez', 'diego.ramirez@gmail.com'),
('Sofía', 'Méndez', 'sofia.mendez@gmail.com'),
('Andrés', 'Jiménez', 'andres.jimenez@gmail.com');

select * from Usuarios 
go



INSERT INTO Usuarios (Nombre, Apellido, Correo)
VALUES
('Harry', 'Potter', 'harry.potter@hogwarts.com'),
('Hermione', 'Granger', 'hermione.granger@hogwarts.com'),
('Ron', 'Weasley', 'ron.weasley@hogwarts.com'),
('Draco', 'Malfoy', 'draco.malfoy@hogwarts.com'),
('Luna', 'Lovegood', 'luna.lovegood@hogwarts.com');

insert into Usuarios (Nombre, Apellido, Correo)
values
('ALONOS', 'ROJAS', 'XXXXXXXXXXXXX');