drop database if exists acuatic;
create database acuatic;
USE acuatic;

create table tipoApoderado(
idTipoApoderado int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(20) UNIQUE
)ENGINE=InnoDB;

create table gestion(
idGestion int AUTO_INCREMENT PRIMARY KEY,
gestion varchar(10) UNIQUE NOT NULL,
monto INT NOT NULL,
activo bool NOT NULL
)ENGINE=InnoDB;

create table dia(
idDia int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(12) NOT NULL
)ENGINE=InnoDB;

create table mes(
idMes int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(12) NOT NULL
)ENGINE=InnoDB;

create table nivel(
idNivel int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(15) NOT NULL
)ENGINE=InnoDB;

create table horario(
idHorario int AUTO_INCREMENT PRIMARY KEY,
hora time NOT NULL
)ENGINE=InnoDB;

create table targetaRFID(
idTargetaRFID int AUTO_INCREMENT PRIMARY KEY,
numeroRFID varchar(20) UNIQUE,
activo bool
)ENGINE=InnoDB;

create table rol(
idRol int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(40) UNIQUE
)ENGINE=InnoDB;

-- Permisos
create table permisos(
idPermisos int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(40) UNIQUE
)ENGINE=InnoDB; 

-- tabla relacional rolPermisos
create table rolPermisos(
idRol int,
idPermisos int,
FOREIGN KEY(idRol) REFERENCES rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idPermisos) REFERENCES permisos(idPermisos) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB; 


-- tutor
create table tutor(
idTutor int AUTO_INCREMENT PRIMARY KEY,
idTipoApoderado int,
ciTutor VARCHAR(15) UNIQUE NOT NULL,
primerNombre VARCHAR(15) NOT NULL, 
segundoNombre VARCHAR(15), 
apellidoPaterno VARCHAR(15) NOT NULL, 
apellidoMaterno VARCHAR(15),
numeroCelular int not null,
direccion VARCHAR(150) NOT NULL,  
fotografia VARCHAR(60) NOT NULL, 
FOREIGN KEY(idTipoApoderado) REFERENCES tipoApoderado (idTipoApoderado) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table estudiante(
idEstudiante INT AUTO_INCREMENT PRIMARY KEY,
ciEstudiante VARCHAR(15),
primerNombre VARCHAR(15) NOT NULL, 
segundoNombre VARCHAR(15), 
apellidoPaterno VARCHAR(15) NOT NULL, 
apellidoMaterno VARCHAR(15),
direccion VARCHAR(150) NOT NULL,  
numeroCelular int not null,
genero ENUM('F','M') not null,
fechaNacimiento date,
fotografia VARCHAR(60), 
imagenCiAnverso VARCHAR(60), 
imagenCiReverso VARCHAR(60),
activo bool,
delete_at TIMESTAMP NULL DEFAULT NULL,
create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
update_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL
)ENGINE=InnoDB;

create table tutorEstudiante(
idTutor int not null,
idEstudiante int,
FOREIGN KEY(idTutor) REFERENCES tutor(idTutor) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idEstudiante) REFERENCES estudiante(idEstudiante) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table instructor(
ciInstructor VARCHAR(15) PRIMARY KEY,
idRol int,
primerNombre VARCHAR(15) NOT NULL, 
segundoNombre VARCHAR(15), 
apellidoPaterno VARCHAR(15) NOT NULL, 
apellidoMaterno VARCHAR(15),
direccion VARCHAR(150) NOT NULL,  
numeroCelular int not null,
genero ENUM('F','M'),
fechaNacimiento date,
fotografia VARCHAR(60), 
imagenCiAnverso VARCHAR(60), 
imagenCiReverso VARCHAR(60),
usuario VARCHAR(20) NOT NULL,
contrasenia VARCHAR(20) NOT NULL,
activo bool,
FOREIGN KEY(idRol) REFERENCES rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table usuario(
ciUsuario VARCHAR(50) PRIMARY KEY,
idRol int,
primerNombre VARCHAR(50) NOT NULL, 
segundoNombre VARCHAR(50), 
apellidoPaterno VARCHAR(50) NOT NULL, 
apellidoMaterno VARCHAR(50),
direccion VARCHAR(50) NOT NULL,  
numeroCelular int not null,
genero ENUM('F','M'),
fechaNacimiento date,
fotografia VARCHAR(50), 
imagenCiAnverso VARCHAR(50), 
imagenCiReverso VARCHAR(50),
usuario VARCHAR(50) NOT NULL,
contrasenia VARCHAR(50) NOT NULL,
activo bool,
FOREIGN KEY(idRol) REFERENCES rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

-- referencia del instructor
create table instructorReferencia(
idInstructorReferencia int PRIMARY KEY,
ciInstructor VARCHAR(15),
primerNombre VARCHAR(15) NOT NULL, 
segundoNombre VARCHAR(15), 
apellidoPaterno VARCHAR(15) NOT NULL, 
apellidoMaterno VARCHAR(15),
numeroCelular int not null,
FOREIGN KEY(ciInstructor) REFERENCES instructor(ciInstructor) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

-- Primero se realiza los horarios del instructor
create table horarioAsignadoInstructor(
idHorarioAsignadoInstructor int AUTO_INCREMENT PRIMARY KEY,
ciInstructor VARCHAR(15),
idHoraInicio int,
idHoraFin INT,
idNivel INT,
idMes INT,
idGestion INT,
cantidadAlumnos INT NOT NULL,
FOREIGN KEY(ciInstructor) REFERENCES instructor(ciInstructor) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idHoraInicio) REFERENCES horario(idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idHoraFin) REFERENCES horario(idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idNivel) REFERENCES nivel(idNivel) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idMes) REFERENCES mes(idMes) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idGestion) REFERENCES gestion(idGestion) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

-- diasclasesinstructorhorario
create table diasClasesInstructorHorario(
idHorarioAsignadoInstructor int not null,
idDia int not null,
FOREIGN KEY(idHorarioAsignadoInstructor) REFERENCES horarioAsignadoInstructor(idHorarioAsignadoInstructor) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idDia) REFERENCES dia(idDia) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

-- horario del estudiante cuando toma cada mes
create table inscripcionMensualidad(
idInscripcionMensualidad int AUTO_INCREMENT PRIMARY KEY,
idEstudiante int,
ciUsuario VARCHAR(15),
idHorarioAsignadoInstructor int,
fechaHora DATETIME not null, 
FOREIGN KEY(idEstudiante) REFERENCES estudiante(idEstudiante) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ciUsuario) REFERENCES usuario(ciUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idHorarioAsignadoInstructor) REFERENCES horarioAsignadoInstructor(idHorarioAsignadoInstructor) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table factura(
idFactura int AUTO_INCREMENT PRIMARY KEY,
idInscripcionMensualidad int,
FOREIGN KEY(idInscripcionMensualidad) REFERENCES inscripcionMensualidad(idInscripcionMensualidad) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table asistencia(
idAsistencia int AUTO_INCREMENT PRIMARY KEY,
idInscripcionMensualidad int,
fechaHora datetime not null,
estadoAsistencia varchar(15) not null,
FOREIGN KEY(idInscripcionMensualidad) REFERENCES inscripcionMensualidad(idInscripcionMensualidad) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;

create table inscripcionTargetaRFID(
idInscripcionTargetaRFID int AUTO_INCREMENT PRIMARY KEY,
idInscripcionMensualidad int,
idTargetaRFID int,
FOREIGN KEY(idInscripcionMensualidad) REFERENCES inscripcionMensualidad(idInscripcionMensualidad) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(idTargetaRFID) REFERENCES targetaRFID(idTargetaRFID) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB;





