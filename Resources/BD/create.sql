DROP DATABASE IF EXISTS acuatic;
CREATE DATABASE acuatic;
USE acuatic;

CREATE TABLE tipotutor(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30)
);

CREATE TABLE tutor(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idTipoTutor INT,
  ciTutor VARCHAR(30) UNIQUE,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  numeroCelular INT,
  direccion VARCHAR(90),
  fotografia VARCHAR(100),
  FOREIGN KEY (idTipoTutor) REFERENCES tipotutor(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE estudiante(
  id INT PRIMARY KEY AUTO_INCREMENT,
  ciEstudiante VARCHAR(30) UNIQUE,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  fechaNacimiento DATE,
  direccion VARCHAR(90),
  fotografia VARCHAR(100),
  imagenCiAnverso VARCHAR(100),
  imagenCiReverso VARCHAR(100),
  genero ENUM('M', 'F'),
  activo bool,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL
);

CREATE TABLE tutorestudiante(
  idEstudiante INT,
  idTutor INT,
  FOREIGN KEY (idEstudiante) REFERENCES estudiante(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idTutor) REFERENCES tutor(id) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE rol(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(90)
);

CREATE TABLE usuario(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idRol INT,
  ciUsuario VARCHAR(30) UNIQUE,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  direccion VARCHAR(90),
  fotografia VARCHAR(100),
  imagenCiAnverso VARCHAR(100),
  imagenCiReverso VARCHAR(100),
  genero ENUM('M', 'F'),
  usuario VARCHAR(30),
  contrasenia VARCHAR(100),
  activo BOOL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL,
  FOREIGN KEY (idRol) REFERENCES rol(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE instructor(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idRol INT,
  ciInstructor VARCHAR(30) UNIQUE,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  direccion VARCHAR(90),
  fotografia VARCHAR(100),
  imagenCiAnverso VARCHAR(100),
  imagenCiReverso VARCHAR(100),
  genero ENUM('M', 'F'),
  usuario VARCHAR(30),
  contrasenia VARCHAR(30),
  numeroCelular INT,
  activo BOOL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL,
  FOREIGN KEY (idRol) REFERENCES rol(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE referenciainstructor(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idInstructor INT,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  numeroCelular INT,
  FOREIGN KEY (idInstructor) REFERENCES instructor(id) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE dia(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40)
);

CREATE TABLE mes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  mes VARCHAR(40)
);

CREATE TABLE nivel(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40)
);

CREATE TABLE gestion(
  id INT PRIMARY KEY AUTO_INCREMENT,
  gestion YEAR,
  monto FLOAT,
  activo BOOL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL
);

CREATE TABLE horario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME
);

CREATE TABLE horarioasignadoinstructor(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idInstructor INT,
  idHoraInicio INT,
  idHoraFinal INT,
  idMes INT,
  idNivel INT,
  idGestion INT,
  cantidadAlumnos INT,
  FOREIGN KEY (idInstructor) REFERENCES instructor(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHoraInicio) REFERENCES horario(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHoraFinal) REFERENCES horario(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idMes) REFERENCES mes(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idNivel) REFERENCES nivel(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idGestion) REFERENCES gestion(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE diasclasesinstructorhorario(
    idHorarioAsignadoInstructor INT,
    idDia INT,
    FOREIGN KEY (idHorarioAsignadoInstructor) REFERENCES horarioasignadoinstructor(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idDia) REFERENCES dia(id) ON UPDATE CASCADE ON DELETE CASCADE
);

# CREATE TABLE horario(
#   idHorario INT PRIMARY KEY AUTO_INCREMENT,
#   idHorarioAsignadoInstructor INT,
#   horaInicio TIME,
#   horaFinal TIME,
#   FOREIGN KEY (idHorarioAsignadoInstructor) REFERENCES horarioasignadoinstructor(idHorarioAsignadoInstructor) ON UPDATE CASCADE ON DELETE CASCADE
# );



# CREATE TABLE horadia(
#   idDia INT,
#   idHorario INT,
#   FOREIGN KEY (idDia) REFERENCES dia(idDia) ON UPDATE CASCADE ON DELETE CASCADE,
#   FOREIGN KEY (idHorario) REFERENCES horario(idHorario) ON UPDATE CASCADE ON DELETE CASCADE
# );



CREATE TABLE inscripcionmensualidad(
  id INT PRIMARY KEY AUTO_INCREMENT,
  idEstudiante INT,
  idUsuario INT,
  idHorarioAsignadoInstructor INT,
  fechaInscripcionMensualidad DATE,
  FOREIGN KEY (idEstudiante) REFERENCES estudiante(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHorarioAsignadoInstructor) REFERENCES horarioasignadoinstructor(id) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE asistencia(
      id INT PRIMARY KEY AUTO_INCREMENT,
      idInscripcionMensualidad INT,
      estadoAsistencia BOOL,
      fechaHoraAsistencia DATETIME,
  FOREIGN KEY (idInscripcionMensualidad) REFERENCES inscripcionmensualidad(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tarjetarfid(
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero INT,
  activo BOOL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL
);

CREATE TABLE inscripciontarjetarfid(
  idInscripcionMensualidad INT,
  idTarjetaRfid INT,
  FOREIGN KEY (idTarjetaRfid) REFERENCES tarjetarfid(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idInscripcionMensualidad) REFERENCES inscripcionmensualidad(id) ON UPDATE CASCADE ON DELETE CASCADE
);
