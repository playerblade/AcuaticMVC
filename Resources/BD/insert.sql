INSERT INTO rol(nombre) VALUES ('Encargado de Inscripcion'),
                               ('Asistente de Control de Asistencia'),
                               ('Administrador'),
                               ('ModelInstructor');

INSERT INTO nivel(nombre) VALUES ('Inicial'),
                                 ('Intermedio'),
                                 ('Avanzado');

INSERT INTO mes(mes) VALUES ('Enero'),
                            ('Febrero'),
                            ('Marzo'),
                            ('Abril'),
                            ('Mayo'),
                            ('Junio'),
                            ('Julio'),
                            ('Agosto'),
                            ('Septiembre'),
                            ('Octubre'),
                            ('Noviembre'),
                            ('Diciembre');

INSERT INTO dia(nombre) VALUES ('Lunes'),
                               ('Martes'),
                               ('Miercoles'),
                               ('Jueves'),
                               ('Viernes'),
                               ('Sabado'),
                               ('Domingo');

INSERT INTO tipotutor(nombre) VALUES ('Padre'),
                                     ('Madre'),
                                     ('Tio'),
                                     ('Tia'),
                                     ('Abuelo'),
                                     ('Abuela');

# LA CONTRASENIA ES EL NOMBRE DE USUARIO
INSERT INTO usuario(idRol, ciUsuario, primerNombre, apellidoPaterno, genero, usuario, contrasenia, activo)
VALUES (1, 'FJS32', 'Melitza', 'Perez', 'F', 'mperez', '4c5c7f6d40b54a9937607f90fa9b0a891314d161', 1),
       (2, 'TSHW72', 'Fernando', 'Carrazco', 'M', 'fcarrazco', '5554f1b4dd4bcca096a81237f196d6631d58fa21', 1),
       (3, 'TRW653', 'Pedro', 'Ruiz', 'M', 'pruiz', '2ad0a56fbb3ebafc7be1c379ae2411fd0938cb85', 1),
       (4, 'KSKDI8', 'Joaquin', 'Loza', 'M', 'jloza', 'bb54af1094c0ef7f8e6136cf40b2de66a0e9ccc9', 1);


# Anidiendo horarioasginadoinstructor con todas sus tablas relacionadas

INSERT INTO instructor(idRol, ciInstructor, primerNombre, apellidoPaterno, genero, numeroCelular, activo)
VALUES (4, '127SAS', 'Sebastian', 'Salvatierra','M', 68030163, 1);

INSERT INTO referenciainstructor(idInstructor, primerNombre, apellidoPaterno, numeroCelular)
VALUES (1, 'Fernando', 'Salvatierra', 67812390);

INSERT INTO gestion(gestion, monto, activo) VALUES ('2019', 180, 1);

INSERT INTO horario(hora) VALUES ('7:00'),
                                 ('8:00');
# Maximo de estudiantes 20 estudiantes segun los requerimientos
INSERT INTO horarioasignadoinstructor(idInstructor, idHoraInicio, idHoraFinal, idMes, idNivel, idGestion, cantidadAlumnos)
VALUES (1, 1, 2, 2, 1, 1, 20);

INSERT INTO diasclasesinstructorhorario(idHorarioAsignadoInstructor, idDia)
VALUES (1, 1),
       (1, 3);

# Anidiendo inscripcionmensualidad con todas sus tablas relacionadas

INSERT INTO tutor(idTipoTutor, ciTutor, primerNombre, apellidoPaterno, numeroCelular)
VALUES (1, 'FNS5424', 'Jose', 'Davila', 78369211);

INSERT INTO estudiante(ciEstudiante, primerNombre, apellidoPaterno, genero, fechaNacimiento, activo)
VALUES ('JSGD838', 'Socrates', 'Davila', 'M', '1980-03-1', 1);

-- nuevos Estudiantess
INSERT INTO estudiante(ciEstudiante, primerNombre, apellidoPaterno,apellidoMaterno, genero, fechaNacimiento, activo)
VALUES ('1444-RTE', 'Rosendo', 'Perales','Torrez', 'M', '1980-03-1', 1);

INSERT INTO estudiante(ciEstudiante, primerNombre, apellidoPaterno,apellidoMaterno, genero, fechaNacimiento, activo)
VALUES ('43464-SGF', 'Julio', 'Gomez','Almanza', 'M', '1999-01-1', 1);
INSERT INTO estudiante(ciEstudiante, primerNombre, apellidoPaterno,apellidoMaterno, genero, fechaNacimiento, activo)
VALUES ('6876-ADS', 'Wilson', 'Fernandez','Perez', 'M', '2000-05-1', 1);



INSERT INTO tutorestudiante(idEstudiante, idTutor) VALUES (1, 1);

INSERT INTO inscripcionmensualidad(idEstudiante, idUsuario, idHorarioAsignadoInstructor, fechaInscripcionMensualidad)
VALUES (1, 1, 1, '2019-01-15');
