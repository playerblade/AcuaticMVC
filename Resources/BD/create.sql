DROP DATABASE IF EXISTS acuatic;
CREATE DATABASE acuatic;
USE acuatic;

CREATE TABLE tipotutor(
  idTipoTutor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30)
);

CREATE TABLE tutor(
  idTutor INT PRIMARY KEY AUTO_INCREMENT,
  idTipoTutor INT,
  ciTutor VARCHAR(30) UNIQUE,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  numeroCelular INT,
  direccion VARCHAR(90),
  fotografia VARCHAR(100),
  FOREIGN KEY (idTipoTutor) REFERENCES tipotutor(idTipoTutor) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE estudiante(
  idEstudiante INT PRIMARY KEY AUTO_INCREMENT,
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
  delete_at TIMESTAMP NULL DEFAULT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP NULL,
  update_at TIMESTAMP NULL DEFAULT CURsRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL
);

CREATE TABLE tutorestudiante(
  idEstudiante INT,
  idTutor INT,
  FOREIGN KEY (idEstudiante) REFERENCES estudiante(idEstudiante) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idTutor) REFERENCES tutor(idTutor) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE rol(
  idRol INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(90)
);

CREATE TABLE usuario(
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
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
  FOREIGN KEY (idRol) REFERENCES rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE instructor(
  idInstructor INT PRIMARY KEY AUTO_INCREMENT,
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
  FOREIGN KEY (idRol) REFERENCES rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE referenciainstructor(
  idReferenciaInstructor INT PRIMARY KEY AUTO_INCREMENT,
  idInstructor INT,
  primerNombre VARCHAR(30),
  segundoNombre VARCHAR(30),
  apellidoPaterno VARCHAR(30),
  apellidoMaterno VARCHAR(30),
  numeroCelular INT,
  FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE dia(
  idDia INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40)
);

CREATE TABLE mes(
  idMes INT PRIMARY KEY AUTO_INCREMENT,
  mes VARCHAR(40)
);

CREATE TABLE nivel(
  idNivel INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40)
);

CREATE TABLE gestion(
  idGestion INT PRIMARY KEY AUTO_INCREMENT,
  gestion YEAR,
  monto FLOAT,
  activo BOOL
);

CREATE TABLE horario(
    idHorario INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME
);

CREATE TABLE horarioasignadoinstructor(
  idHorarioAsignadoInstructor INT PRIMARY KEY AUTO_INCREMENT,
  idInstructor INT,
  idHoraInicio INT,
  idHoraFinal INT,
  idMes INT,
  idNivel INT,
  idGestion INT,
  cantidadAlumnos INT,
  FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHoraInicio) REFERENCES horario(idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHoraFinal) REFERENCES horario(idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idMes) REFERENCES mes(idMes) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idNivel) REFERENCES nivel(idNivel) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idGestion) REFERENCES gestion(idGestion) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE diasclasesinstructorhorario(
    idHorarioAsignadoInstructor INT,
    idDia INT,
    FOREIGN KEY (idHorarioAsignadoInstructor) REFERENCES horarioasignadoinstructor(idHorarioAsignadoInstructor) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idDia) REFERENCES dia(idDia) ON UPDATE CASCADE ON DELETE CASCADE
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
  idInscripcionMensualidad INT PRIMARY KEY AUTO_INCREMENT,
  idEstudiante INT,
  idUsuario INT,
  idHorarioAsignadoInstructor INT,
  fechaInscripcionMensualidad DATE,
  FOREIGN KEY (idEstudiante) REFERENCES estudiante(idEstudiante) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idHorarioAsignadoInstructor) REFERENCES horarioasignadoinstructor(idHorarioAsignadoInstructor) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE asistencia(
      idAsistencia INT PRIMARY KEY AUTO_INCREMENT,
      idInscripcionMensualidad INT,
      estadoAsistencia BOOL,
      fechaHoraAsistencia DATETIME,
  FOREIGN KEY (idInscripcionMensualidad) REFERENCES inscripcionmensualidad(idInscripcionMensualidad) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tarjetarfid(
  idTarjetaRfid INT PRIMARY KEY AUTO_INCREMENT,
  numero INT,
  activo BOOL
);

CREATE TABLE inscripciontarjetarfid(
  idInscripcionMensualidad INT,
  idTarjetaRfid INT,
  FOREIGN KEY (idTarjetaRfid) REFERENCES tarjetarfid(idTarjetaRfid) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idInscripcionMensualidad) REFERENCES inscripcionmensualidad(idInscripcionMensualidad) ON UPDATE CASCADE ON DELETE CASCADE
);

