-- we created the database called: db_matricula-- creamos la base de datos: db_matricula
create database db_matricula
go

-- we changed the master database to use the database we created called: db_matricula-- cambiamos para usar la base de datos creada
use db_matricula
go


--DROP table IF EXISTS alumno;
--go

-- creation of the table student/ tabla alumno--
create table alumno(
id_alumno  int primary key identity (1,1), -- primary key of student table --llave primaria de tabla alumno--  // idnetity (1,1) means sequuential numerical values, where firts 1 means initial value (seed) and the second 1 means increase (step)--
identif_alumno varchar (20) not null,
nombre_alumno varchar (50) not null, 
apellidos_alumno varchar (50) not null,
fecha_nac date not null,
fecha_ingreso date not null,
direcc_alumno varchar(150) not null,
telefono_alumno char (10) not null,
correo varchar (100) not null,
estado_alumno char (10) not null,
)
go

-- creation of the table registration/  tabla matricula--
create table matricula(
codigo_matricula int primary key identity (1,1), -- primary key of registration table // llave primaria de tabla matricula--  idnetity (1,1) means sequuential numerical values, where firts 1 means initial value (seed) and the second 1 means increase (step)--
codigo_periodo varchar (8) not null,
codigo_carrera varchar (10) not null,
fecha_matricula datetime2 (0) default getdate (), --  datetime2 saves exact date and time - getdate: current time automatic// datetime2: guarda fecha y hora exacta - getdate:Registra fecha y hora actual automáticamente
id_alumno int not null, 
año smallint not null, -- consumes two bytes, half that int//consume 2 bytes, la mitad de int
)
go

-- creation of the table academic_period/ tabla periodo_academico--
create table periodo_academico(
codigo_periodo varchar (8) primary key, -- primary key of academic_period table // llave primaria de tabla periodo_academico-- idnetity (1,1) means sequuential numerical values, where firts 1 means initial value (seed) and the second 1 means increase (step)--
año smallint not null, -- consumes two bytes, half that int//consume 2 bytes, la mitad de int,
numero_periodo varchar (4) not null,
fecha_inicio date not null,
fecha_fin date not null,
)
go

-- creation of the table registration details/ tabla detalle_matricula--
create table detalle_matricula(
id_detalle int primary key identity (1,1), -- primary key of registration details table // llave primaria de tabla detalle_matricula--  idnetity (1,1) means sequuential numerical values, where firts 1 means initial value (seed) and the second 1 means increase (step)--
codigo_curso varchar (8) not null, -- permite codigos alfaumericos mat-105
nota_final decimal (4,2) null, -- campo null por si aun no tienen nota
codigo_matricula int not null,
)
go

-- creation of the table course/ tabla curso--
create table curso(
codigo_curso varchar (8) primary key, -- primary key of course table // llave primaria de tabla curso-- 
nombre_curso varchar (100) not null, -- permite codigos alfaumericos mat-105
creditos tinyint not null, -- tinyint ocupa 1 byte almacena de 0 al 255
id_profesor int not null, 
codigo_periodo varchar (8) not null,
)
go

-- creation of the table teacher/ tabla profesor--
create table profesor(
id_profesor  int primary key identity (1,1), -- primary key of student table --llave primaria de tabla alumno--  // idnetity (1,1) means sequuential numerical values, where firts 1 means initial value (seed) and the second 1 means increase (step)--
identif_prof varchar (20) not null,
nombre_prof varchar (50) not null, 
apellidos_prof varchar (50) not null,
direcc_prof varchar(150) not null,
telefono_prof char (15) not null,
correo varchar (100) not null,
especialidad varchar (50) not null,
)
go


-- creation of the table career/ tabla carrera--
create table carrera(
codigo_carrera varchar (10) primary key, -- primary key of career table // llave primaria de tabla carrera-- 
nombre_carrera varchar (100) not null, -- permite codigos alfaumericos mat-105
titulo_carrera varchar (100) not null, 
duracion_semestre tinyint not null, -- tinyint ocupa 1 byte almacena de 0 al 255 ej: 8,10,12 semestres
)
go

-- creation of the table career_course/ tabla carrera_curso-- tabla intermedia/de asociación
create table carrera_curso(
codigo_curso varchar (8) not null foreign key references curso (codigo_curso), -- foreign key of course table // llave foranea de tabla curso-- 
codigo_carrera varchar (10) not null foreign key references carrera (codigo_carrera), -- foreign key of career table // llave foranea de tabla carrera--
semestre_curso tinyint not null, -- tinyint ocupa 1 byte almacena de 0 al 255
)
go

--INSERT EN TABLAS--

-- insert data into the table student/ tabla alumno--
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('7-1850-7968', 'Diego', 'Torres Morales', '2000-06-19', '2026-04-10', 'Calle 28, Desamparados', '63698880', 'diego.torres1@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('2-7873-5257', 'Carlos', 'Lopez Sanchez', '2006-01-14', '2023-12-08', 'Calle 14, Liberia', '63493475', 'carlos.lopez2@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('8-6004-8790', 'Ana', 'Sanchez Ramirez', '2002-12-12', '2023-01-12', 'Calle 15, Escazu', '62032718', 'ana.sanchez3@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('4-8547-2836', 'Pedro', 'Gomez Vargas', '2006-11-28', '2026-11-15', 'Calle 19, Liberia', '64761727', 'pedro.gomez4@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('6-9887-7101', 'Maria', 'Fernandez Torres', '2002-04-10', '2021-05-24', 'Calle 27, Heredia', '70091564', 'maria.fernandez5@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('2-5823-3328', 'Carlos', 'Vargas Mendoza', '2005-10-21', '2026-03-19', 'Calle 25, Liberia', '81528148', 'carlos.vargas6@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('1-4265-4742', 'Jose', 'Rodriguez Garcia', '1996-08-05', '2025-11-04', 'Calle 9, Heredia', '73535845', 'jose.rodriguez7@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('4-9999-1872', 'Sofia', 'Flores Torres', '1999-08-25', '2024-08-12', 'Calle 8, Puntarenas', '89307748', 'sofia.flores8@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('8-9056-8229', 'Pedro', 'Sanchez Torres', '1998-03-24', '2025-09-21', 'Calle 8, Liberia', '81385693', 'pedro.sanchez9@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('2-5389-4659', 'Camila', 'Cruz Ramirez', '2000-09-22', '2023-08-01', 'Calle 12, Puntarenas', '75141874', 'camila.cruz10@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('1-1432-9060', 'Juan', 'Alvarez Lopez', '2005-03-02', '2025-02-05', 'Calle 17, Limon', '68376618', 'juan.alvarez11@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('1-3641-2653', 'Juan', 'Alvarez Ramirez', '2003-06-21', '2025-01-06', 'Calle 24, Liberia', '75696679', 'juan.alvarez12@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('6-3331-2869', 'Paula', 'Garcia Garcia', '2001-08-27', '2026-10-25', 'Calle 3, Cartago', '75909438', 'paula.garcia13@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('5-8991-1541', 'Lucia', 'Garcia Martinez', '2003-06-28', '2024-11-05', 'Calle 30, Alajuela', '85079409', 'lucia.garcia14@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('8-8753-6712', 'Valeria', 'Mendoza Flores', '2006-11-11', '2024-05-28', 'Calle 21, Limon', '68545885', 'valeria.mendoza15@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('1-1429-7875', 'Paula', 'Diaz Vargas', '1996-12-10', '2023-08-08', 'Calle 18, Cartago', '73734295', 'paula.diaz16@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('2-3806-4982', 'Luis', 'Torres Rios', '2006-02-12', '2023-04-05', 'Calle 20, Heredia', '81715147', 'luis.torres17@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('6-2843-6535', 'Pedro', 'Torres Gomez', '2003-10-12', '2026-07-28', 'Calle 10, Puntarenas', '63675342', 'pedro.torres18@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('3-4596-7266', 'Alejandro', 'Flores Garcia', '2001-02-06', '2026-05-10', 'Calle 30, Desamparados', '64446237', 'alejandro.flores19@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('8-3110-7452', 'Valentina', 'Rodriguez Sanchez', '2004-01-19', '2022-09-08', 'Calle 18, Desamparados', '73126082', 'valentina.rodriguez20@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('5-9321-1746', 'Luis', 'Diaz Rodriguez', '1998-11-20', '2025-01-15', 'Calle 20, Heredia', '73618075', 'luis.diaz21@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('4-9046-7271', 'Sofia', 'Flores Cruz', '1997-01-05', '2022-02-14', 'Calle 8, Escazu', '80771453', 'sofia.flores22@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('9-4923-6401', 'Lucia', 'Rios Rios', '2000-10-15', '2023-09-01', 'Calle 26, Desamparados', '81222711', 'lucia.rios23@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('2-4420-8309', 'Diego', 'Mendoza Fernandez', '2006-01-06', '2025-07-06', 'Calle 18, Escazu', '80947718', 'diego.mendoza24@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('1-5868-8688', 'Andres', 'Lopez Cruz', '2007-09-01', '2024-01-13', 'Calle 15, Limon', '62332479', 'andres.lopez25@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('7-9350-6204', 'Valentina', 'Morales Flores', '1999-07-14', '2024-04-23', 'Calle 27, Desamparados', '73647618', 'valentina.morales26@universidad.edu', 'Inactivo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('9-7447-9867', 'Diego', 'Perez Mendoza', '1997-09-13', '2026-02-28', 'Calle 1, Liberia', '68166399', 'diego.perez27@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('6-9184-9628', 'Ana', 'Rodriguez Flores', '2000-01-24', '2026-05-17', 'Calle 13, Limon', '81586831', 'ana.rodriguez28@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('3-6656-1394', 'Jorge', 'Martinez Mendoza', '2000-07-05', '2025-04-22', 'Calle 12, Puntarenas', '79283579', 'jorge.martinez29@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('6-1382-4591', 'Ana', 'Fernandez Fernandez', '2002-12-14', '2021-06-09', 'Calle 7, Liberia', '88701091', 'ana.fernandez30@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('3-8028-7243', 'Sofia', 'Martinez Ramirez', '2007-09-18', '2021-07-08', 'Calle 6, Puntarenas', '60705241', 'sofia.martinez31@universidad.edu', 'Activo');
INSERT INTO alumno (identif_alumno, nombre_alumno, apellidos_alumno, fecha_nac, fecha_ingreso, direcc_alumno, telefono_alumno, correo, estado_alumno) VALUES ('4-2236-5338', 'Maria', 'Martinez Cruz', '1999-07-07', '2023-05-12', 'Calle 5, San Jose', '80255683', 'maria.martinez32@universidad.edu', 'Activo');
go


-- insert data into the table registration/ tabla matricula--
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-SIST', '2024-01-15 08:30:22', 1, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'LIC-ADM', '2024-01-15 09:15:45', 2, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'MED-01', '2024-01-15 10:02:11', 3, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-SIST', '2024-01-16 11:45:30', 4, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'LIC-ADM', '2024-01-16 14:22:18', 5, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'MED-01', '2024-01-17 08:12:55', 6, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-CIVIL', '2024-01-17 09:55:04', 7, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'PSIC-01', '2024-01-17 13:40:12', 8, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-SIST', '2024-01-18 10:20:37', 9, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'LIC-ADM', '2024-01-18 15:10:49', 10, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'MED-01', '2024-07-20 09:00:15', 11, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'ING-CIVIL', '2024-07-20 11:22:43', 12, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'PSIC-01', '2024-07-21 14:05:19', 13, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'ING-SIST', '2024-07-21 16:30:58', 14, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'LIC-ADM', '2024-07-22 08:45:12', 15, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'MED-01', '2024-07-22 10:15:34', 16, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'ING-CIVIL', '2024-07-23 12:00:01', 17, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'PSIC-01', '2024-07-23 15:50:27', 18, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'ING-SIST', '2024-07-24 09:35:14', 19, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-02', 'LIC-ADM', '2024-07-24 11:10:00', 20, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'MED-01', '2025-01-12 08:50:44', 21, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'ING-CIVIL', '2025-01-12 10:30:25', 22, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'PSIC-01', '2025-01-13 13:15:12', 23, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'ING-SIST', '2025-01-13 15:45:00', 24, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'LIC-ADM', '2025-01-14 09:05:33', 25, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'MED-01', '2025-01-14 11:20:19', 26, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'ING-CIVIL', '2025-01-15 14:10:55', 27, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'PSIC-01', '2025-01-15 16:25:41', 28, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'ING-SIST', '2025-01-16 08:40:12', 29, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-01', 'LIC-ADM', '2025-01-16 10:55:04', 30, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'MED-01', '2025-07-18 09:12:30', 31, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'ING-CIVIL', '2025-07-18 11:40:22', 32, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'PSIC-01', '2025-07-19 13:00:55', 33, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'ING-SIST', '2025-07-19 14:55:18', 34, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'LIC-ADM', '2025-07-20 08:30:41', 35, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'MED-01', '2025-07-20 10:45:13', 36, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'ING-CIVIL', '2025-07-21 12:10:02', 37, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'PSIC-01', '2025-07-21 15:35:26', 38, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'ING-SIST', '2025-07-22 09:20:47', 39, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2025-02', 'LIC-ADM', '2025-07-22 11:05:59', 40, 2025);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'MED-01', '2026-01-14 08:22:11', 41, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'ING-CIVIL', '2026-01-14 10:45:36', 42, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'PSIC-01', '2026-01-14 14:12:50', 43, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'ING-SIST', '2026-01-15 09:00:15', 44, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'LIC-ADM', '2026-01-15 11:30:44', 45, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'MED-01', '2026-01-15 15:20:03', 46, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'ING-CIVIL', '2026-01-16 08:55:27', 47, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'PSIC-01', '2026-01-16 10:40:19', 48, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'ING-SIST', '2026-01-16 13:15:52', 49, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-01', 'LIC-ADM', '2026-01-16 16:02:11', 50, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'MED-01', '2026-07-15 08:40:19', 51, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'ING-CIVIL', '2026-07-15 10:15:33', 52, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'PSIC-01', '2026-07-15 13:55:04', 53, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'ING-SIST', '2026-07-16 09:12:47', 54, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'LIC-ADM', '2026-07-16 11:45:22', 55, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'MED-01', '2026-07-16 14:30:11', 56, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'ING-CIVIL', '2026-07-17 08:50:00', 57, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'PSIC-01', '2026-07-17 10:22:15', 58, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'ING-SIST', '2026-07-17 13:05:49', 59, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2026-02', 'LIC-ADM', '2026-07-17 15:40:36', 60, 2026);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'MED-01', '2024-01-19 09:10:14', 61, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-CIVIL', '2024-01-19 11:25:43', 62, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'PSIC-01', '2024-01-19 14:50:21', 63, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'ING-SIST', '2024-01-20 08:35:12', 64, 2024);
INSERT INTO matricula (codigo_periodo, codigo_carrera, fecha_matricula, id_alumno, año) VALUES ('2024-01', 'LIC-ADM', '2024-01-20 10:12:59', 65, 2024);
go


-- insert data into table academic_period/ tabla periodo_academico--
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1992-01', 1992, '01', '1992-01-15', '1992-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1992-02', 1992, '02', '1992-07-15', '1992-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1993-01', 1993, '01', '1993-01-15', '1993-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1993-02', 1993, '02', '1993-07-15', '1993-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1994-01', 1994, '01', '1994-01-15', '1994-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1994-02', 1994, '02', '1994-07-15', '1994-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1995-01', 1995, '01', '1995-01-15', '1995-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1995-02', 1995, '02', '1995-07-15', '1995-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1996-01', 1996, '01', '1996-01-15', '1996-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1996-02', 1996, '02', '1996-07-15', '1996-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1997-01', 1997, '01', '1997-01-15', '1997-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1997-02', 1997, '02', '1997-07-15', '1997-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1998-01', 1998, '01', '1998-01-15', '1998-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1998-02', 1998, '02', '1998-07-15', '1998-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1999-01', 1999, '01', '1999-01-15', '1999-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('1999-02', 1999, '02', '1999-07-15', '1999-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2000-01', 2000, '01', '2000-01-15', '2000-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2000-02', 2000, '02', '2000-07-15', '2000-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2001-01', 2001, '01', '2001-01-15', '2001-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2001-02', 2001, '02', '2001-07-15', '2001-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2002-01', 2002, '01', '2002-01-15', '2002-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2002-02', 2002, '02', '2002-07-15', '2002-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2003-01', 2003, '01', '2003-01-15', '2003-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2003-02', 2003, '02', '2003-07-15', '2003-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2004-01', 2004, '01', '2004-01-15', '2004-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2004-02', 2004, '02', '2004-07-15', '2004-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2005-01', 2005, '01', '2005-01-15', '2005-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2005-02', 2005, '02', '2005-07-15', '2005-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2006-01', 2006, '01', '2006-01-15', '2006-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2006-02', 2006, '02', '2006-07-15', '2006-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2007-01', 2007, '01', '2007-01-15', '2007-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2007-02', 2007, '02', '2007-07-15', '2007-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2008-01', 2008, '01', '2008-01-15', '2008-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2008-02', 2008, '02', '2008-07-15', '2008-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2009-01', 2009, '01', '2009-01-15', '2009-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2009-02', 2009, '02', '2009-07-15', '2009-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2010-01', 2010, '01', '2010-01-15', '2010-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2010-02', 2010, '02', '2010-07-15', '2010-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2011-01', 2011, '01', '2011-01-15', '2011-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2011-02', 2011, '02', '2011-07-15', '2011-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2012-01', 2012, '01', '2012-01-15', '2012-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2012-02', 2012, '02', '2012-07-15', '2012-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2013-01', 2013, '01', '2013-01-15', '2013-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2013-02', 2013, '02', '2013-07-15', '2013-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2014-01', 2014, '01', '2014-01-15', '2014-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2014-02', 2014, '02', '2014-07-15', '2014-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2015-01', 2015, '01', '2015-01-15', '2015-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2015-02', 2015, '02', '2015-07-15', '2015-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2016-01', 2016, '01', '2016-01-15', '2016-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2016-02', 2016, '02', '2016-07-15', '2016-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2017-01', 2017, '01', '2017-01-15', '2017-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2017-02', 2017, '02', '2017-07-15', '2017-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2018-01', 2018, '01', '2018-01-15', '2018-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2018-02', 2018, '02', '2018-07-15', '2018-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2019-01', 2019, '01', '2019-01-15', '2019-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2019-02', 2019, '02', '2019-07-15', '2019-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2020-01', 2020, '01', '2020-01-15', '2020-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2020-02', 2020, '02', '2020-07-15', '2020-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2021-01', 2021, '01', '2021-01-15', '2021-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2021-02', 2021, '02', '2021-07-15', '2021-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2022-01', 2022, '01', '2022-01-15', '2022-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2022-02', 2022, '02', '2022-07-15', '2022-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2023-01', 2023, '01', '2023-01-15', '2023-06-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2023-02', 2023, '02', '2023-07-15', '2023-12-15');
INSERT INTO periodo_academico (codigo_periodo, año, numero_periodo, fecha_inicio, fecha_fin) VALUES ('2024-01', 2024, '01', '2024-01-15', '2024-06-15');
go

-- insert data into table registration_details table/ tabla detalle_matricula.--
INSERT INTO detalle_matricula (codigo_curso, nota_final, codigo_matricula) VALUES
('MAT-101', 8.50, 1001),
('INF-102', 9.20, 1001),
('ENG-105', NULL, 1001),
('MAT-101', 7.00, 1002),
('FIS-201', 6.80, 1002),
('MAT-101', 5.50, 1003),
('INF-102', NULL, 1003),
('ENG-105', 8.00, 1003),
('QUI-301', 9.00, 1004),
('FIS-201', 7.50, 1004),
('MAT-101', NULL, 1005),
('ENG-105', 6.20, 1005),
('INF-102', 8.80, 1006),
('QUI-301', 7.10, 1006),
('MAT-101', 9.60, 1007),
('FIS-201', NULL, 1007),
('ENG-105', 8.30, 1007),
('INF-102', 6.00, 1008),
('QUI-301', NULL, 1008),
('MAT-101', 7.40, 1009),
('FIS-201', 8.10, 1009),
('ENG-105', 9.50, 1010),
('INF-102', 5.00, 1010),
('MAT-201', NULL, 1011),
('FIS-202', 7.80, 1011),
('ENG-106', 8.90, 1011),
('MAT-201', 6.40, 1012),
('INF-202', NULL, 1012),
('QUI-302', 7.20, 1012),
('FIS-202', 8.00, 1013),
('ENG-106', NULL, 1013),
('MAT-201', 9.10, 1014),
('INF-202', 8.50, 1014),
('QUI-302', NULL, 1015),
('FIS-202', 6.90, 1015),
('ENG-106', 7.30, 1015),
('MAT-201', 5.80, 1016),
('INF-202', 9.00, 1016),
('QUI-302', NULL, 1017),
('FIS-202', 7.60, 1017),
('ENG-106', 8.20, 1017),
('MAT-201', NULL, 1018),
('INF-202', 6.50, 1018),
('QUI-302', 8.70, 1019),
('FIS-202', NULL, 1019),
('ENG-106', 9.30, 1019),
('MAT-201', 7.00, 1020),
('INF-202', 7.90, 1020),
('MAT-301', NULL, 1021),
('INF-302', 8.40, 1021),
('ENG-205', 9.10, 1021),
('MAT-301', 6.20, 1022),
('FIS-301', NULL, 1022),
('QUI-401', 7.50, 1022),
('INF-302', 8.00, 1023),
('ENG-205', NULL, 1023),
('MAT-301', 9.70, 1024),
('FIS-301', 8.60, 1024),
('QUI-401', NULL, 1025),
('INF-302', 6.80, 1025),
('ENG-205', 7.10, 1025),
('MAT-301', 5.90, 1026),
('FIS-301', 9.20, 1026),
('QUI-401', NULL, 1027),
('INF-302', 7.40, 1027),
('ENG-205', 8.50, 1027),
('MAT-301', NULL, 1028),
('FIS-301', 6.70, 1028),
('QUI-401', 8.30, 1029),
('INF-302', NULL, 1029),
('ENG-205', 9.00, 1029),
('MAT-301', 7.30, 1030),
('FIS-301', 7.80, 1030),
('MAT-101', 8.00, 1031),
('INF-102', NULL, 1031),
('ENG-105', 6.50, 1031),
('MAT-101', 7.20, 1032),
('FIS-201', 9.10, 1032),
('MAT-101', NULL, 1033),
('INF-102', 5.80, 1033),
('ENG-105', 8.40, 1033),
('QUI-301', 7.90, 1034),
('FIS-201', NULL, 1034),
('MAT-101', 6.60, 1035),
('ENG-105', 9.00, 1035),
('INF-102', 8.30, 1036),
('QUI-301', NULL, 1036),
('MAT-101', 7.00, 1037),
('FIS-201', 6.40, 1037),
('ENG-105', NULL, 1037),
('INF-102', 9.50, 1038),
('QUI-301', 8.10, 1038),
('MAT-101', NULL, 1039),
('FIS-201', 7.30, 1039),
('ENG-105', 8.70, 1040),
('INF-102', 6.20, 1040);
go


-- insert data into table course/ tabla curso--
INSERT INTO curso (codigo_curso, nombre_curso, creditos, id_profesor, codigo_periodo) VALUES
('MAT-101', 'Álgebra Lineal', 4, 101, '2026-01'),
('MAT-102', 'Cálculo Diferencial', 5, 102, '2026-01'),
('MAT-103', 'Cálculo Integral', 5, 102, '2026-02'),
('MAT-201', 'Ecuaciones Diferenciales', 4, 103, '2026-01'),
('MAT-202', 'Probabilidad y Estadística', 4, 104, '2026-01'),
('MAT-301', 'Análisis Numérico', 3, 103, '2026-02'),
('INF-101', 'Introducción a la Programación', 4, 105, '2026-01'),
('INF-102', 'Estructuras de Datos', 4, 105, '2026-02'),
('INF-201', 'Programación Orientada a Objetos', 4, 106, '2026-01'),
('INF-202', 'Bases de Datos I', 4, 107, '2026-01'),
('INF-203', 'Bases de Datos II', 4, 107, '2026-02'),
('INF-301', 'Sistemas Operativos', 4, 108, '2026-01'),
('INF-302', 'Ingeniería de Software I', 4, 109, '2026-01'),
('INF-303', 'Ingeniería de Software II', 4, 109, '2026-02'),
('INF-401', 'Redes de Computadoras', 4, 110, '2026-01'),
('INF-402', 'Seguridad Informática', 3, 110, '2026-02'),
('INF-501', 'Inteligencia Artificial', 4, 111, '2026-02'),
('INF-502', 'Desarrollo Web Avanzado', 3, 106, '2026-02'),
('FIS-101', 'Física Mecánica', 4, 112, '2026-01'),
('FIS-102', 'Física de Campos', 4, 113, '2026-02'),
('FIS-201', 'Termodinámica', 3, 112, '2026-01'),
('FIS-202', 'Óptica y Ondas', 3, 113, '2026-02'),
('QUI-101', 'Química General', 4, 114, '2026-01'),
('QUI-102', 'Química Orgánica', 4, 114, '2026-02'),
('QUI-201', 'Bioquímica', 4, 115, '2026-01'),
('ENG-101', 'Inglés Técnico I', 2, 116, '2026-01'),
('ENG-102', 'Inglés Técnico II', 2, 116, '2026-02'),
('ENG-201', 'Inglés Avanzado Negocios', 2, 117, '2026-01'),
('ADM-101', 'Administración de Empresas', 3, 118, '2026-01'),
('ADM-201', 'Gestión del Talento Humano', 3, 118, '2026-02'),
('ADM-301', 'Planeación Estratégica', 4, 119, '2026-01'),
('CON-101', 'Contabilidad General', 3, 120, '2026-01'),
('CON-102', 'Contabilidad de Costos', 3, 120, '2026-02'),
('CON-201', 'Auditoría Financiera', 4, 121, '2026-01'),
('ECO-101', 'Introducción a la Economía', 3, 122, '2026-01'),
('ECO-201', 'Microeconomía', 4, 122, '2026-02'),
('ECO-202', 'Macroeconomía', 4, 123, '2026-01'),
('ECO-301', 'Econometría', 4, 123, '2026-02'),
('FIN-101', 'Matemática Financiera', 3, 121, '2026-01'),
('FIN-201', 'Finanzas Corporativas', 4, 124, '2026-02'),
('FIN-301', 'Mercado de Capitales', 3, 124, '2026-02'),
('MKT-101', 'Fundamentos de Marketing', 3, 125, '2026-01'),
('MKT-201', 'Comportamiento del Consumidor', 3, 125, '2026-02'),
('MKT-301', 'Marketing Digital', 3, 126, '2026-01'),
('MKT-401', 'Investigación de Mercados', 4, 126, '2026-02'),
('IND-101', 'Introducción a la Ing. Industrial', 2, 127, '2026-01'),
('IND-201', 'Procesos de Manufactura', 4, 127, '2026-02'),
('IND-301', 'Investigación de Operaciones I', 4, 128, '2026-01'),
('IND-302', 'Investigación de Operaciones II', 4, 128, '2026-02'),
('IND-401', 'Control de Calidad', 3, 129, '2026-01'),
('IND-402', 'Logística y Cadena de Suministro', 4, 129, '2026-02'),
('IND-501', 'Diseño de Plantas Industriales', 4, 130, '2026-01'),
('IND-502', 'Seguridad e Higiene Industrial', 2, 130, '2026-02'),
('CIV-101', 'Introducción a la Ing. Civil', 2, 131, '2026-01'),
('CIV-201', 'Topografía General', 4, 131, '2026-02'),
('CIV-202', 'Mecánica de Suelos', 4, 132, '2026-01'),
('CIV-301', 'Resistencia de Materiales', 4, 132, '2026-02'),
('CIV-302', 'Análisis Estructural', 4, 133, '2026-01'),
('CIV-401', 'Diseño de Concreto Armado', 4, 133, '2026-02'),
('CIV-402', 'Hidráulica de Canales', 3, 134, '2026-01'),
('CIV-501', 'Ingeniería de Transportes', 3, 134, '2026-02'),
('CIV-502', 'Gestión de Obras Civiles', 3, 135, '2026-02'),
('DER-101', 'Derecho Constitucional', 3, 136, '2026-01'),
('DER-102', 'Derecho Civil Personas', 4, 136, '2026-01'),
('DER-201', 'Derecho Penal General', 4, 137, '2026-02'),
('DER-202', 'Derecho Laboral', 3, 137, '2026-02'),
('DER-301', 'Derecho Comercial', 3, 138, '2026-01'),
('DER-401', 'Derecho Internacional Público', 3, 138, '2026-02'),
('PSI-101', 'Introducción a la Psicología', 3, 139, '2026-01'),
('PSI-201', 'Psicología del Desarrollo', 3, 139, '2026-02'),
('PSI-202', 'Psicología Cognitiva', 4, 140, '2026-01'),
('PSI-301', 'Psicopatología General', 4, 140, '2026-02'),
('PSI-401', 'Psicología Organizacional', 3, 141, '2026-01'),
('PSI-402', 'Psicología Clínica', 4, 141, '2026-02'),
('MED-101', 'Anatomía Humana I', 5, 142, '2026-01'),
('MED-102', 'Anatomía Humana II', 5, 142, '2026-02'),
('MED-201', 'Fisiología Médica I', 5, 143, '2026-01'),
('MED-202', 'Fisiología Médica II', 5, 143, '2026-02'),
('MED-301', 'Histología y Embriología', 4, 144, '2026-01'),
('MED-302', 'Farmacología General', 4, 144, '2026-02'),
('MED-401', 'Patología General', 4, 145, '2026-01'),
('MED-402', 'Microbiología Médica', 4, 145, '2026-02'),
('COM-101', 'Teorías de la Comunicación', 3, 146, '2026-01'),
('COM-201', 'Periodismo Informativo', 3, 146, '2026-02'),
('COM-301', 'Comunicación Audiovisual', 4, 147, '2026-01'),
('COM-401', 'Relaciones Públicas', 3, 147, '2026-02'),
('DIS-101', 'Fundamentos del Diseño Gráfico', 3, 148, '2026-01'),
('DIS-201', 'Diseño Vectorial y Tipografía', 3, 148, '2026-02'),
('DIS-301', 'Diseño de Identidad Corporativa', 4, 149, '2026-01'),
('DIS-401', 'Diseño de Experiencia de Usuario', 4, 149, '2026-02'),
('ARQ-101', 'Introducción a la Arquitectura', 3, 150, '2026-01'),
('ARQ-201', 'Diseño Arquitectónico I', 5, 150, '2026-02'),
('ARQ-202', 'Historia de la Arquitectura', 3, 151, '2026-01'),
('ARQ-301', 'Sistemas Constructivos I', 4, 151, '2026-02'),
('ARQ-401', 'Urbanismo y Territorio', 3, 152, '2026-01'),
('HUM-101', 'Metodología de la Investigación', 2, 153, '2026-01'),
('HUM-102', 'Ética y Responsabilidad Social', 2, 153, '2026-02'),
('HUM-201', 'Sociología General', 3, 154, '2026-01'),
('HUM-301', 'Filosofía Contemporánea', 3, 154, '2026-02'),
('HUM-401', 'Antropología Cultural', 3, 155, '2026-02');
go

-- insert data into table teacher/ tabla profesor--
INSERT INTO profesor (identif_prof, nombre_prof, apellidos_prof, direcc_prof, telefono_prof, correo, especialidad) VALUES
('ID-1001', 'Carlos', 'Mendoza Ruiz', 'Av. Central 123, San José', '+506 8321-4561', 'carlos.mendoza@univ.edu', 'Matemáticas'),
('ID-1002', 'Ana', 'Gómez Peralta', 'Calle 5, Bloque C, Heredia', '+506 8845-7812', 'ana.gomez@univ.edu', 'Matemáticas'),
('ID-1003', 'Luis', 'Rodríguez Castro', 'Urbanización Los Laureles, Alajuela', '+506 8712-3456', 'luis.rodriguez@univ.edu', 'Matemáticas'),
('ID-1004', 'María', 'Fernández Marín', 'Residencial El Prado, Cartago', '+506 8956-2314', 'maria.fernandez@univ.edu', 'Estadística'),
('ID-1005', 'Jorge', 'Sánchez Vega', 'Av. 8 entre Calles 2 y 4, San José', '+506 8412-7895', 'jorge.sanchez@univ.edu', 'Ciencias de la Computación'),
('ID-1006', 'Elena', 'Ramírez Ortiz', 'Barrio Escalante, Casa 45, San José', '+506 8632-1478', 'elena.ramirez@univ.edu', 'Desarrollo Web'),
('ID-1007', 'Pedro', 'Gutiérrez Mora', 'Condominio Altavista, Heredia', '+506 8521-9630', 'pedro.gutierrez@univ.edu', 'Bases de Datos'),
('ID-1008', 'Sonia', 'Alvarado Rojas', 'Calle Principal, San Pedro', '+506 8399-4455', 'sonia.alvarado@univ.edu', 'Sistemas Operativos'),
('ID-1009', 'Ricardo', 'Torres Chaves', 'Av. Segunda, Edificio B, Cartago', '+506 8877-1122', 'ricardo.torres@univ.edu', 'Ingeniería de Software'),
('ID-1010', 'Laura', 'Vargas Jiménez', 'Barrio La Granja, Alajuela', '+506 8911-5566', 'laura.vargas@univ.edu', 'Telecomunicaciones y Redes'),
('ID-1011', 'Gabriel', 'Castro Solano', 'Residencial Los Parques, Heredia', '+506 8455-9900', 'gabriel.castro@univ.edu', 'Inteligencia Artificial'),
('ID-1012', 'Roberto', 'Morales Brenes', 'Calle Las Magnolias, San José', '+506 8744-2233', 'roberto.morales@univ.edu', 'Física'),
('ID-1013', 'Silvia', 'Herrera Quesada', 'Av. Central, Local 12, Alajuela', '+506 8533-8899', 'silvia.herrera@univ.edu', 'Física Aplicada'),
('ID-1014', 'Manuel', 'Salazar Muñoz', 'Urbanización El Sol, Cartago', '+506 8622-7711', 'manuel.salazar@univ.edu', 'Química General'),
('ID-1015', 'Patricia', 'Delgado Campos', 'Barrio Amón, Ave 11, San José', '+506 8311-0022', 'patricia.delgado@univ.edu', 'Bioquímica'),
('ID-1016', 'Andrés', 'Navarro Alfaro', 'Condominio Los Abuelos, Heredia', '+506 8833-4411', 'andres.navarro@univ.edu', 'Idiomas'),
('ID-1017', 'Beatriz', 'Méndez Cordero', 'Calle 3, Avenida 5, Alajuela', '+506 8922-6677', 'beatriz.mendez@univ.edu', 'Idiomas Avanzados'),
('ID-1018', 'Francisco', 'Solís Fonseca', 'Residencial San Antonio, Coronado', '+506 8466-1155', 'francisco.solis@univ.edu', 'Administración'),
('ID-1019', 'Gabriela', 'Campos Villalobos', 'Barrio Mercedes, Heredia', '+506 8755-3344', 'gabriela.campos@univ.edu', 'Estrategia Empresarial'),
('ID-1020', 'Alejandro', 'Araya Valverde', 'Av. 4, Calle 10, Cartago', '+506 8544-7788', 'alejandro.araya@univ.edu', 'Contabilidad'),
('ID-1021', 'Natalia', 'Chinchilla Mora', 'Urbanización Vista del Valle, San José', '+506 8611-9900', 'natalia.chinchilla@univ.edu', 'Auditoría'),
('ID-1022', 'Fernando', 'Soto Espinoza', 'Condominio La Floresta, Alajuela', '+506 8355-2233', 'fernando.soto@univ.edu', 'Economía'),
('ID-1023', 'Diana', 'Zúñiga Umaña', 'Barrio Lourdes, Montes de Oca', '+506 8866-5544', 'diana.zuniga@univ.edu', 'Macroeconomía'),
('ID-1024', 'Héctor', 'Monge Aguilar', 'Av. Central, Frente al Parque, Heredia', '+506 8977-8899', 'hector.monge@univ.edu', 'Finanzas Corporativas'),
('ID-1025', 'Claudia', 'Serrano Delgado', 'Residencial Los Álamos, Cartago', '+506 8488-3322', 'claudia.serrano@univ.edu', 'Marketing'),
('ID-1026', 'Eduardo', 'Quesada Mata', 'Calle Los Ángeles, Tibás', '+506 8799-4411', 'eduardo.quesada@univ.edu', 'Marketing Digital'),
('ID-1027', 'Oscar', 'Vargas Porras', 'Barrio El Carmen, Alajuela', '+506 8511-6633', 'oscar.vargas@univ.edu', 'Ingeniería Industrial'),
('ID-1028', 'Verónica', 'Blanco Sáenz', 'Condominio El Cafetal, Heredia', '+506 8655-0022', 'veronica.blanco@univ.edu', 'Investigación de Operaciones'),
('ID-1029', 'Hugo', 'Miranda Zamora', 'Av. 14, Calle 2, San José', '+506 8344-9988', 'hugo.miranda@univ.edu', 'Logística de Suministros'),
('ID-1030', 'Isabel', 'Segura Carvajal', 'Residencial El Bosque, Cartago', '+506 8822-1144', 'isabel.segura@univ.edu', 'Seguridad Industrial'),
('ID-1031', 'Daniel', 'Guzmán Arias', 'Barrio La California, San José', '+506 8933-7755', 'daniel.guzman@univ.edu', 'Ingeniería Civil'),
('ID-1032', 'Lorena', 'Mora Madrigal', 'Calle Vieja, Tres Ríos, Cartago', '+506 8422-6611', 'lorena.mora@univ.edu', 'Geotecnia y Suelos'),
('ID-1033', 'Adrián', 'Rojas Benavides', 'Urbanización El Molino, Cartago', '+506 8733-0099', 'adrian.rojas@univ.edu', 'Estructuras'),
('ID-1034', 'Martha', 'Cruz Céspedes', 'Condominio Hacienda, Alajuela', '+506 8566-4411', 'martha.cruz@univ.edu', 'Hidráulica'),
('ID-1035', 'Walter', 'Montoya Flores', 'Av. Central, Edificio Colón, San José', '+506 8677-2255', 'walter.montoya@univ.edu', 'Gestión de Obras'),
('ID-1036', 'Karla', 'Pacheco Orozco', 'Barrio Dent, San Pedro', '+506 8388-5522', 'karla.pacheco@univ.edu', 'Derecho Constitucional'),
('ID-1037', 'Javier', 'Salas Chacón', 'Residencial La Guaria, Moravia', '+506 8899-6633', 'javier.salas@univ.edu', 'Derecho Penal'),
('ID-1038', 'Monica', 'Calvo Barquero', 'Calle Principal, San Rafael, Heredia', '+506 8944-1100', 'monica.calvo@univ.edu', 'Derecho Comercial'),
('ID-1039', 'Esteban', 'Piedra Lobo', 'Barrio El Tejar, Cartago', '+506 8433-8877', 'esteban.piedra@univ.edu', 'Psicología General'),
('ID-1040', 'Raquel', 'León Esquivel', 'Condominio La Verbena, Alajuela', '+506 8722-9955', 'raquel.leon@univ.edu', 'Psicología Cognitiva'),
('ID-1041', 'Gustavo', 'Fallas Granados', 'Av. 9, Calle 15, San José', '+506 8577-4422', 'gustavo.fallas@univ.edu', 'Psicología Organizacional'),
('ID-1042', 'Cynthia', 'Marín Arroyo', 'Barrio Corazón de Jesús, Heredia', '+506 8688-1177', 'cynthia.marin@univ.edu', 'Anatomía Humana'),
('ID-1043', 'Sergio', 'González Retana', 'Residencial El Plantío, Alajuela', '+506 8322-9911', 'sergio.gonzalez@univ.edu', 'Fisiología Médica'),
('ID-1044', 'Paola', 'Guido Leitón', 'Av. 2, Frente al Teatro, San José', '+506 8811-7744', 'paola.guido@univ.edu', 'Farmacología'),
('ID-1045', 'Diego', 'Villegas Oviedo', 'Barrio Fátima, Cartago', '+506 8966-3300', 'diego.villegas@univ.edu', 'Microbiología'),
('ID-1046', 'Tatiana', 'Valerio Sandí', 'Condominio San Agustín, Heredia', '+506 8499-0055', 'tatiana.valerio@univ.edu', 'Ciencias de la Comunicación'),
('ID-1047', 'Mario', 'Ureña Garro', 'Urbanización La Trinidad, Alajuela', '+506 8766-4488', 'mario.ureña@univ.edu', 'Comunicación Audiovisual'),
('ID-1048', 'Jimena', 'Arias Sequeira', 'Av. 6, Calle 4, San José', '+506 8599-2211', 'jimena.arias@univ.edu', 'Diseño Gráfico'),
('ID-1049', 'Rodrigo', 'Sáenz Cerdas', 'Residencial Real de Pavas, San José', '+506 8644-8833', 'rodrigo.saenz@univ.edu', 'Diseño de Interfaz UX'),
('ID-1050', 'Fabiola', 'Pérez Sibaja', 'Barrio San José, Alajuela', '+506 8377-5511', 'fabiola.perez@univ.edu', 'Diseño Arquitectónico'),
('ID-1051', 'Arturo', 'Chaves Vindas', 'Condominio Francosta, Heredia', '+506 8855-2266', 'arturo.chaves@univ.edu', 'Sistemas Constructivos'),
('ID-1052', 'Viviana', 'Madrigal Solano', 'Calle El Molino, Cartago', '+506 8988-4477', 'viviana.madrigal@univ.edu', 'Urbanismo'),
('ID-1053', 'Felipe', 'Bermúdez Núñez', 'Barrio Amón, Avenida 9, San José', '+506 8411-6688', 'felipe.bermudez@univ.edu', 'Metodología Investigación'),
('ID-1054', 'Guillermo', 'Cordero Agüero', 'Residencial Casa Real, Alajuela', '+506 8711-5544', 'guillermo.cordero@univ.edu', 'Sociología'),
('ID-1055', 'Irene', 'Montes Loaiza', 'Condominio Hacienda, San José', '+506 8522-8811', 'irene.montes@univ.edu', 'Antropología Cultural'),
('ID-1056', 'Alfonso', 'Acuña Alvarado', 'Calle Principal, San Antonio, Puriscal', '+506 8633-9922', 'alfonso.acuna@univ.edu', 'Matemáticas'),
('ID-1057', 'Beatriz', 'Artavia Bejarano', 'Residencial Las Flores, San Pablo, Heredia', '+506 8366-0033', 'beatriz.artavia@univ.edu', 'Cálculo Avanzado'),
('ID-1058', 'Claudio', 'Badilla Bolaños', 'Barrio San Bosco, Ciudad Colón', '+506 8833-7722', 'claudio.badilla@univ.edu', 'Física Cuántica'),
('ID-1059', 'Deborah', 'Barboza Briceño', 'Urbanización El Encanto, Desamparados', '+506 8922-8844', 'deborah.barboza@univ.edu', 'Química Orgánica'),
('ID-1060', 'Enrique', 'Calderón Carranza', 'Condominio Las Brisas, San Francisco, Heredia', '+506 8455-2211', 'enrique.calderon@univ.edu', 'Ciencias de la Computación'),
('ID-1061', 'Florencia', 'Carvajal Castillo', 'Av. 5, Calle Principal, Tibás', '+506 8788-3355', 'florencia.carvajal@univ.edu', 'Redes de Datos'),
('ID-1062', 'Gerardo', 'Céspedes Delgado', 'Barrio El Carmen, Paso Ancho', '+506 8533-0044', 'gerardo.cespedes@univ.edu', 'Bases de Datos'),
('ID-1063', 'Helena', 'Conejo Elizondo', 'Residencial Valle del Sol, Santa Ana', '+506 8644-1155', 'helena.conejo@univ.edu', 'Ingeniería de Software'),
('ID-1064', 'Ignacio', 'Díaz Gamboa', 'Calle Los Cipreses, Curridabat', '+506 8311-6677', 'ignacio.diaz@univ.edu', 'Administración'),
('ID-1065', 'Jacqueline', 'Espinoza Garita', 'Barrio La Julia, Guápiles', '+506 8822-9900', 'jacqueline.espinoza@univ.edu', 'Contabilidad de Costos'),
('ID-1066', 'Kenneth', 'Fonseca Gómez', 'Urbanización Los Colegios, Moravia', '+506 8955-4433', 'kenneth.fonseca@univ.edu', 'Economía de Mercados'),
('ID-1067', 'Lilliana', 'Gamboa Gutiérrez', 'Av. 3, Calle Central, Grecia, Alajuela', '+506 8477-8811', 'lilliana.gamboa@univ.edu', 'Finanzas Públicas'),
('ID-1068', 'Mauricio', 'Garro Hernández', 'Residencial San Marino, Santo Domingo', '+506 8733-5566', 'mauricio.garro@univ.edu', 'Mercadeo Estratégico'),
('ID-1069', 'Nuria', 'Granados Herrera', 'Barrio Fátima, Pérez Zeledón', '+506 8544-2299', 'nuria.granados@univ.edu', 'Gestión del Talento');
go


-- insert data into table career/ tabla carrera--
INSERT INTO carrera (codigo_carrera, nombre_carrera, titulo_carrera, duracion_semestre) VALUES
('ING-SIST', 'Ingeniería de Sistemas', 'Ingeniero de Sistemas', 10),
('ING-SOFT', 'Ingeniería de Software', 'Ingeniero de Software', 10),
('ING-CIVIL', 'Ingeniería Civil', 'Ingeniero Civil', 10),
('ING-IND', 'Ingeniería Industrial', 'Ingeniero Industrial', 10),
('ING-MEC', 'Ingeniería Mecánica', 'Ingeniero Mecánico', 10),
('ING-ELEC', 'Ingeniería Eléctrica', 'Ingeniero Electricista', 10),
('ING-QUIM', 'Ingeniería Química', 'Ingeniero Químico', 10),
('ING-AMB', 'Ingeniería Ambiental', 'Ingeniero Ambiental', 10),
('ING-TELE', 'Ingeniería en Telecomunicaciones', 'Ingeniero en Telecomunicaciones', 10),
('ING-BIOM', 'Ingeniería Biomédica', 'Ingeniero Biomédico', 10),
('ING-AGRO', 'Ingeniería Agronómica', 'Ingeniero Agrónomo', 10),
('ING-ALIM', 'Ingeniería de Alimentos', 'Ingeniero de Alimentos', 10),
('ING-MTRON', 'Ingeniería Mecatrónica', 'Ingeniero en Mecatrónica', 10),
('ING-DATA', 'Ingeniería de Datos e IA', 'Ingeniero de Datos', 10),
('ING-LOG', 'Ingeniería en Logística', 'Ingeniero en Logística y Transporte', 10),
('ING-TOP', 'Ingeniería Topográfica', 'Ingeniero Topógrafo', 10),
('ING-MINAS', 'Ingeniería de Minas', 'Ingeniero de Minas', 10),
('ING-FORES', 'Ingeniería Forestal', 'Ingeniero Forestal', 10),
('ING-BIOT', 'Ingeniería en Biotecnología', 'Ingeniero Biotecnólogo', 10),
('ING-CAT', 'Ingeniería Catastral', 'Ingeniero Catastral', 10),
('LIC-MAT', 'Licenciatura en Matemáticas', 'Licenciado en Matemáticas', 8),
('LIC-FIS', 'Licenciatura en Física', 'Licenciado en Física', 8),
('LIC-QUI', 'Licenciatura en Química', 'Licenciado en Química', 8),
('LIC-BIO', 'Licenciatura en Biología', 'Licenciado en Biología', 8),
('LIC-EST', 'Licenciatura en Estadística', 'Licenciado en Estadística', 8),
('LIC-ENG', 'Licenciatura en Inglés', 'Licenciado en Idioma Inglés', 8),
('LIC-HIST', 'Licenciatura en Historia', 'Licenciado en Historia', 8),
('LIC-FILO', 'Licenciatura en Filosofía', 'Licenciado en Filosofía', 8),
('LIC-LIT', 'Licenciatura en Literatura', 'Licenciado en Filología y Literatura', 8),
('LIC-SOC', 'Licenciatura en Sociología', 'Licenciado en Sociología', 8),
('LIC-ANT', 'Licenciatura en Antropología', 'Licenciado en Antropología', 8),
('LIC-GEO', 'Licenciatura en Geografía', 'Licenciado en Geografía', 8),
('LIC-EDUC', 'Licenciatura en Ciencias de la Educación', 'Licenciado en Educación', 8),
('LIC-PRE', 'Licenciatura en Educación Preescolar', 'Licenciado en Educación Preescolar', 8),
('LIC-PRIM', 'Licenciatura en Educación Primaria', 'Licenciado en Educación Primaria', 8),
('LIC-ART', 'Licenciatura en Artes Plásticas', 'Licenciado en Artes Plásticas', 8),
('LIC-MUS', 'Licenciatura en Música', 'Licenciado en Música', 9),
('LIC-TEAT', 'Licenciatura en Artes Dramáticas', 'Licenciado en Teatro y Actuación', 8),
('LIC-DANZA', 'Licenciatura en Danza Contemporánea', 'Licenciado en Danza', 8),
('LIC-DPTE', 'Licenciatura en Educación Física y Deporte', 'Licenciado en Deporte', 8),
('MED-GEN', 'Medicina General', 'Médico Cirujano', 12),
('MED-VET', 'Medicina Veterinaria', 'Médico Veterinario Zootecnista', 10),
('MED-ODON', 'Odontología', 'Cirujano Dentista', 10),
('MED-ENF', 'Enfermería', 'Licenciado en Enfermería', 8),
('MED-NUT', 'Nutrición y Dietética', 'Licenciado en Nutrición', 8),
('MED-FAR', 'Farmacia y Bioanálisis', 'Licenciado en Farmacia', 10),
('MED-TER', 'Terapia Física y Kinesiología', 'Licenciado en Terapia Física', 8),
('MED-PSI', 'Psicología Clínica', 'Licenciado en Psicología', 10),
('MED-OPT', 'Optometría', 'Licenciado en Optometría', 8),
('MED-TERO', 'Terapia Ocupacional', 'Licenciado en Terapia Ocupacional', 8),
('ADM-EMP', 'Administración de Empresas', 'Administrador de Empresas', 8),
('ADM-PUB', 'Administración Pública', 'Administrador Público', 8),
('ADM-FIN', 'Administración Financiera', 'Administrador Financiero', 8),
('ADM-HOT', 'Administración Hotelera y Turística', 'Administrador Turístico', 8),
('ADM-NEG', 'Negocios Internacionales', 'Licenciado en Negocios Internacionales', 8),
('ADM-LOG', 'Administración de la Cadena de Suministro', 'Administrador de Logística', 8),
('ADM-TAL', 'Gestión del Talento Humano', 'Licenciado en Recursos Humanos', 8),
('CON-PUB', 'Contaduría Pública', 'Contador Público Autorizado', 9),
('ECO-GEN', 'Economía', 'Economista', 8),
('FIN-BAN', 'Finanzas y Banca', 'Licenciado en Finanzas', 8),
('MKT-GEN', 'Marketing', 'Licenciado en Mercadotecnia', 8),
('MKT-DIG', 'Marketing Digital y Comercio', 'Especialista en Marketing Digital', 8),
('COM-PER', 'Comunicación Social y Periodismo', 'Periodista', 8),
('COM-RRPP', 'Relaciones Públicas', 'Licenciado en Relaciones Públicas', 8),
('COM-AUD', 'Comunicación Audiovisual', 'Productor Audiovisual', 8),
('DIS-GRAF', 'Diseño Gráfico', 'Diseñador Gráfico', 8),
('DIS-IND', 'Diseño Industrial', 'Diseñador Industrial', 8),
('DIS-MOD', 'Diseño de Modas y Textil', 'Diseñador de Modas', 8),
('DIS-INT', 'Diseño de Interiores', 'Diseñador de Interiores', 8),
('DIS-UXUI', 'Diseño de Experiencia de Usuario UX/UI', 'Diseñador de Medios Interactivos', 8),
('ARQ-GEN', 'Arquitectura', 'Arquitecto', 10),
('ARQ-PAI', 'Arquitectura del Paisaje', 'Arquitecto Paisajista', 10),
('DER-GEN', 'Derecho', 'Abogado y Notario Público', 10),
('DER-INT', 'Relaciones Internacionales y Diplomacia', 'Licenciado en Estudios Internacionales', 8),
('CIE-POL', 'Ciencia Política', 'Politólogo', 8),
('CIE-CRIM', 'Criminología', 'Licenciado en Criminología', 8),
('CIE-GEO', 'Geología', 'Geólogo', 10),
('CIE-AST', 'Astronomía', 'Astrónomo', 10),
('CIE-MET', 'Meteorología', 'Meteorólogo', 8),
('CIE-OCEA', 'Oceanografía', 'Oceanógrafo', 8),
('TEC-DES', 'TSU en Desarrollo de Software', 'Técnico Superior Universitario', 4),
('TEC-RED', 'TSU en Redes y Telecomunicaciones', 'Técnico Superior Universitario', 4),
('TEC-MANT', 'TSU en Mantenimiento Industrial', 'Técnico Superior Universitario', 4),
('TEC-LOG', 'TSU en Logística y Almacén', 'Técnico Superior Universitario', 4),
('TEC-CONT', 'TSU en Contabilidad y Tributación', 'Técnico Superior Universitario', 4),
('TEC-MKT', 'TSU en Ventas y Mercadotecnia', 'Técnico Superior Universitario', 4),
('TEC-DIAG', 'TSU en Radiología e Imágenes Médicas', 'Técnico Superior Universitario', 5),
('TEC-PROT', 'TSU en Prótesis Dental', 'Técnico Superior Universitario', 4),
('TEC-TUR', 'TSU en Guía y Gestión Turística', 'Técnico Superior Universitario', 4),
('TEC-GAST', 'TSU en Gastronomía y Alta Cocina', 'Técnico Superior Universitario', 5),
('AGRO-ANI', 'Zootecnia', 'Zootecnista', 10),
('CIE-COMP', 'Ciencias de la Computación', 'Científico de la Computación', 8),
('TRAB-SOC', 'Trabajo Social', 'Licenciado en Trabajo Social', 8),
('BIB-DOC', 'Bibliotecología y Documentación', 'Licenciado en Bibliotecología', 8),
('ARCH-CI', 'Archivística y Ciencia de la Inf.', 'Licenciado en Archivística', 8),
('CIE-ACT', 'Ciencias Actuariales', 'Actuario', 10),
('LIC-FOT', 'Licenciatura en Fotografía Profesional', 'Licenciado en Fotografía', 8),
('ING-MINS', 'Ingeniería en Ciberseguridad', 'Ingeniero en Ciberseguridad', 10),
('ING-RENO', 'Ingeniería en Energías Renovables', 'Ingeniero en Energías Renovables', 10),
('ARQ-URB', 'Urbanismo y Planificación Territorial', 'Urbanista', 10);
go 


-- insert data into table career_course/ tabla carrera_curso--
INSERT INTO carrera_curso (codigo_curso, codigo_carrera, semestre_curso) VALUES
('MAT-101', 'ING-SIST', 1),
('MAT-102', 'ING-SIST', 1),
('INF-101', 'ING-SIST', 1),
('ENG-101', 'ING-SIST', 1),
('MAT-103', 'ING-SIST', 2),
('INF-102', 'ING-SIST', 2),
('ENG-102', 'ING-SIST', 2),
('MAT-201', 'ING-SIST', 3),
('INF-201', 'ING-SIST', 3),
('INF-202', 'ING-SIST', 3),
('MAT-202', 'ING-SIST', 4),
('INF-203', 'ING-SIST', 4),
('INF-301', 'ING-SIST', 5),
('INF-302', 'ING-SIST', 5),
('INF-303', 'ING-SIST', 6),
('INF-401', 'ING-SIST', 7),
('INF-402', 'ING-SIST', 8),
('INF-501', 'ING-SIST', 9),
('INF-502', 'ING-SIST', 9),
('MAT-101', 'ING-SOFT', 1),
('INF-101', 'ING-SOFT', 1),
('ENG-101', 'ING-SOFT', 1),
('INF-102', 'ING-SOFT', 2),
('ENG-102', 'ING-SOFT', 2),
('MAT-202', 'ING-SOFT', 3),
('INF-201', 'ING-SOFT', 3),
('INF-202', 'ING-SOFT', 3),
('INF-203', 'ING-SOFT', 4),
('INF-301', 'ING-SOFT', 5),
('INF-302', 'ING-SOFT', 5),
('INF-303', 'ING-SOFT', 6),
('INF-402', 'ING-SOFT', 7),
('INF-501', 'ING-SOFT', 8),
('INF-502', 'ING-SOFT', 8),
('MAT-101', 'ING-CIVIL', 1),
('MAT-102', 'ING-CIVIL', 1),
('CIV-101', 'ING-CIVIL', 1),
('MAT-103', 'ING-CIVIL', 2),
('FIS-101', 'ING-CIVIL', 2),
('MAT-201', 'ING-CIVIL', 3),
('FIS-102', 'ING-CIVIL', 3),
('CIV-201', 'ING-CIVIL', 3),
('CIV-202', 'ING-CIVIL', 4),
('CIV-301', 'ING-CIVIL', 5),
('CIV-302', 'ING-CIVIL', 6),
('CIV-401', 'ING-CIVIL', 7),
('CIV-402', 'ING-CIVIL', 8),
('CIV-501', 'ING-CIVIL', 9),
('CIV-502', 'ING-CIVIL', 10),
('MAT-101', 'ING-IND', 1),
('IND-101', 'ING-IND', 1),
('MAT-102', 'ING-IND', 2),
('MAT-103', 'ING-IND', 3),
('FIS-101', 'ING-IND', 3),
('MAT-202', 'ING-IND', 4),
('FIS-201', 'ING-IND', 4),
('IND-201', 'ING-IND', 4),
('IND-301', 'ING-IND', 5),
('IND-302', 'ING-IND', 6),
('IND-401', 'ING-IND', 7),
('IND-402', 'ING-IND', 8),
('IND-501', 'ING-IND', 9),
('IND-502', 'ING-IND', 10),
('ADM-101', 'ADM-EMP', 1),
('CON-101', 'ADM-EMP', 1),
('ECO-101', 'ADM-EMP', 2),
('FIN-101', 'ADM-EMP', 2),
('MKT-101', 'ADM-EMP', 2),
('ADM-201', 'ADM-EMP', 3),
('CON-102', 'ADM-EMP', 3),
('ECO-201', 'ADM-EMP', 3),
('MKT-201', 'ADM-EMP', 4),
('FIN-201', 'ADM-EMP', 5),
('ADM-301', 'ADM-EMP', 6),
('MKT-301', 'ADM-EMP', 6),
('CON-201', 'ADM-EMP', 7),
('FIN-301', 'ADM-EMP', 7),
('MKT-401', 'ADM-EMP', 8),
('DER-101', 'DER-GEN', 1),
('DER-102', 'DER-GEN', 1),
('HUM-101', 'DER-GEN', 2),
('DER-201', 'DER-GEN', 3),
('DER-202', 'DER-GEN', 4),
('DER-301', 'DER-GEN', 5),
('DER-401', 'DER-GEN', 7),
('HUM-102', 'DER-GEN', 8),
('PSI-101', 'MED-PSI', 1),
('HUM-101', 'MED-PSI', 2),
('PSI-201', 'MED-PSI', 3),
('PSI-202', 'MED-PSI', 4),
('PSI-301', 'MED-PSI', 5),
('PSI-401', 'MED-PSI', 7),
('PSI-402', 'MED-PSI', 8),
('MED-101', 'MED-GEN', 1),
('MED-102', 'MED-GEN', 2),
('MED-201', 'MED-GEN', 3),
('MED-202', 'MED-GEN', 4),
('MED-301', 'MED-GEN', 5),
('MED-302', 'MED-GEN', 6),
('MED-401', 'MED-GEN', 7),
('MED-402', 'MED-GEN', 8);
go 


-- CONSULTAS--

--Consultas SELECT FROM - FROM WHERE--

select * from curso  -- muestra todos los datos de la tabla alumno/ displays all data from the student table--
go

select * from profesor where especialidad  = 'Bases de Datos'; -- selecciona de la tabla profesor la especialidad que tenga el nombre de Bases de datos y la muestra/ select from the teacher table the specialty that has the name of databases and display it--
go

select *
from matricula  where codigo_carrera = 'LIC-ADM' ---- selecciona de la tabla matricula, con operador logico AND, añade otra caracteristica y se deben cumplir ambas // select from the table registration with the logical AND operator add another characteristic and both must be fulfilled.
and año = 2024;
go

select *
from detalle_matricula  where nota_final is null; -- muestra los campos que tienen valos NULL // show the fields that have a null value.
go

-- CONSULTAS FROM- WHERE CON  NOT NULL

select nota_final, codigo_curso -- selecciona de la tabla detalle_matricula la nota_final y el codigo_curso que no tengan valores nulos // select from the table detail_registration final_grade and course_code that do not have null values
from detalle_matricula
where nota_final IS NOT NULL;
go

-- CONSULTA ORDER BY--  ordena carreras de forma descentente por su duración y el nombre de carrera de manera ascentente // sorts career in descending order by duration and career name in ascending order by career name.

select codigo_carrera, nombre_carrera, titulo_carrera, duracion_semestre
from carrera
order by
    duracion_semestre desc, 
    nombre_carrera asc;
go

-- CONSULTA DISTINCT  -- 

select distinct codigo_curso   --- muestra lista de cursos unicos que cuenten con nota// show a list of unique courses that have a grade
from detalle_matricula;
go

-- CONSULTA CON TOP--  

select top 5     --- con un limite de las primeras 5 filas de la base de datos de las notas mas altas y las orden   |qsa de >< //first 5 rows with the highest notes ordered from highest to lowest
    codigo_matricula, 
    codigo_curso, 
    nota_final
from detalle_matricula
order by nota_final desc;
go

-- CONSULTAS % LIKE --

select nombre_curso from curso  where nombre_curso like 'Química General'; -- Muestra el nombre de curso que sea parecido a // Sow a course name that is similar to

go

-- CONSULTA BETWEEN--

select id_alumno, nombre_alumno,apellidos_alumno, fecha_ingreso
from alumno
where fecha_ingreso BETWEEN '2024-01-01' AND '2025-12-31';  -- filtra por rango de fechas-- filter by date range.//incluye el rango de fechas de forma obligatoria// include the date range as required
go

-- CONSULTA IN--
select codigo_carrera, nombre_carrera
from carrera
where codigo_carrera in ('LIC-ADM','PSIC-01' ,'ING-CIVIL'); -- in: evalua si el valor de la columna coincide con cualquiera de la lista //
go

-- CONSULTA NOT--
select codigo_curso, nombre_curso, id_profesor  -- muestra todos los cursos excepto los que tengan ID profesor 150,133,120 (los excluye)// show all courses except those with a teaher ID 150,133,120 ( excludes them)
from curso
where id_profesor not in (150,133,120);
go


-- CONSULTA AND--

select codigo_matricula, codigo_curso, nota_final      -- muestra el resultado donde se cumplan ambas condiciones // show the result where both conditions are met
from detalle_matricula
where codigo_curso = 'ENG-106' AND nota_final >= 8;
go

-- CONSULTA OR--

select id_alumno, nombre_alumno, apellidos_alumno   -- muestra el resultado donde se cumpla alguna de las condiciones // show the result where any of conditions are met
from alumno
where estado_alumno = 'Activo' or fecha_ingreso = '2025';
go

-- CONSULTAS GROUP BY  -- HAVING--  AVG

select codigo_curso, cast (avg(nota_final) as decimal(4,2))  -- seleccionamos las dos columnas de la tabla detalle_matricula y las agrupa por el codigo_curso donde los que sean mayor a 6//con cast redondear el promedio del resultado a dos decimales como la tabla original 
as promedio_nota from detalle_matricula
group by codigo_curso having avg (nota_final) > 8
go

-- CONSULTAS HAVING --  COUNT

select  id_profesor, 
    count (codigo_curso) as total_cursos from curso
group by id_profesor having Count (codigo_curso) >= 1; -- agrupa y cuenta cuantas materias tiene asigandas 1 profesor (>1)
go

-- CONSULTAS COUNT --

select count (id_alumno) as total_alumnos  -- cuenta filas con valores, muestra total de alumnos registrados //  counts rows with values, total sample of registered students
from alumno;
go


-- CONSULTAS SUM --

select sum (creditos) as total_creditos    --- muestra total de creditos de materias acumulados // total sample of accumulated subject credits
from curso;
go

 -- CONSULTA MIN-- MAX--

select min (nota_final) as minimo_nota_final from detalle_matricula;--  muestra el mínimo de nota. el valor proyectado es el minimo de esa tabla.
go               

--MAX--

select max (nota_final) as maxima_nota_final from detalle_matricula; --  muestra el maximo de nota. el valor proyectado es el maximo de esa tabla.
go           


-- CONSULTA INNER JOIN-- compara las tablas carrera_curso y carrera y ve la coincidencia, agarrar los campos de cada tabla donde se relacionan ( codigo_carrera). debe llevar una letra de referencia--

select 
cc.codigo_carrera as [Código Carrera],
c.nombre_carrera as [Carrera],
cc.codigo_curso as [Código Curso],
cc.semestre_curso as [Semestre]
from carrera_curso cc inner join carrera c
on cc.codigo_carrera = c.codigo_carrera
go

-- CONSULTA LEFT JOIN-- devuelve todos los registros de la tabla izquierda ( carrera) y los registros coincidentes con la tabla de la derecha (alumnos

select 
    c.nombre_carrera, 
    a.nombre_alumno, 
    a.apellidos_alumno
from carrera c
left join alumno a on c.codigo_carrera = c.codigo_carrera;
go

-- CONSULTA RIGHT JOIN-- devuelve todos los registros de la tabla derecha ( matricula) y los registros coincidentes con la tabla de la izquierda (alumno)

select 
    a.nombre_alumno, 
    a.apellidos_alumno, 
    m.codigo_matricula, 
    m.fecha_matricula
from alumno a
right join matricula m on a.id_alumno = m.id_alumno;
go


-- SUBCONSULTA // ARRIBA HAY OTRAS SUBCONSULTAS--

select id_alumno, nombre_alumno, apellidos_alumno   -- muestra alumnos que ya tienen matricula por medio del ID //shows students who are already enrolled using their ID
from alumno where id_alumno in (
    select id_alumno from matricula);
go



--VISTAS--


-- CREAR VISTA--

create view vista_directorio_profesores as  -- crear la vista
select 
    nombre_prof, 
    apellidos_prof
from profesor;
go

select * from vista_directorio_profesores;  -- ejecutar la vista // muestra los nombres pero mantiene el id de cada profesor oculto
go 



-- CREAR VISTA--

create view vista_mejores_notas as
select top 5     --- en esta vista para usar order by, debe ser con top // se utiliza para sacar las mejores notas en cada fin de semestre
    codigo_matricula, 
    codigo_curso, 
    nota_final
from detalle_matricula
order by nota_final desc;
go


select * from vista_mejores_notas;  -- ejecutar la vista
go 


-- CREAR VISTA--

create view vista_promedio_por_curso as   --- calcula la nota promedio de cada curso y lo muestra // calculates and displays the average grade for each course.
select codigo_curso, 
    avg(nota_final) as promedio_general,
    count (*) as total_evaluaciones
from detalle_matricula
group by codigo_curso;
go

select * from vista_promedio_por_curso;  -- ejecutar la vista
go 

--drop view vista_mejores_notas; -- para eliminar la vista