-- gestion
insert into gestion(gestion,monto,activo) values('2017',160,0); 
insert into gestion(gestion,monto,activo) values('2018',170,0); 
insert into gestion(gestion,monto,activo) values('2019',180,1); 

-- dia
insert into dia (nombre) values ('Lunes');
insert into dia (nombre) values ('Martes');
insert into dia (nombre) values ('Miercoles');
insert into dia (nombre) values ('Jueves');
insert into dia (nombre) values ('Viernes');
insert into dia (nombre) values ('Sabado');
insert into dia (nombre) values ('Domingo');

-- mes
insert into mes(nombre) values('Enero');
insert into mes(nombre) values('Febrero');
insert into mes(nombre) values('Marzo');
insert into mes(nombre) values('Abril');
insert into mes(nombre) values('Mayo');
insert into mes(nombre) values('Junio');
insert into mes(nombre) values('Julio');
insert into mes(nombre) values('Agosto');
insert into mes(nombre) values('Septiembre');
insert into mes(nombre) values('Octubre');
insert into mes(nombre) values('Noviembre');
insert into mes(nombre) values('Diciembre');

-- nivel 
insert into nivel(nombre) values('Basico');
insert into nivel(nombre) values('Inicial');
insert into nivel(nombre) values('Intermedio');
insert into nivel(nombre) values('Avanzado');

-- Horario
insert into horario(hora) values('07:00');
insert into horario(hora) values('08:00');
insert into horario(hora) values('09:00');
insert into horario(hora) values('10:00');
insert into horario(hora) values('11:00');
insert into horario(hora) values('12:00');
insert into horario(hora) values('14:00');
insert into horario(hora) values('15:00');
insert into horario(hora) values('16:00');
insert into horario(hora) values('17:00');
insert into horario(hora) values('18:00');
insert into horario(hora) values('19:00');
insert into horario(hora) values('20:00');

-- rol
insert into rol(nombre) values('Encargado de Inscripcion');
insert into rol(nombre) values('Asistente de Control de Asistencia');
insert into rol(nombre) values('Administrador');
insert into rol(nombre) values('Instructor');

-- usuario
insert into usuario(ciUsuario,idRol,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,usuario,contrasenia,activo) 
values('911',1,'Beatriz','Loayza','Quillacollo 888',70722220,'F','1979-05-25','beatriz','293a09bc5efd175ff2edbdb9273a748bac4a0740',1),
	  ('912',1,'Jose','Perez','Colcapirhua 777',70722220,'M','1975-06-20','jose','jose',1);


-- instructor
insert into instructor(ciInstructor,idRol,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,usuario,contrasenia,activo) 
values('11',4,'Monica','Salvatierra','Sarco 123',77800001,'F','1980-02-15','monica','monica',1);

insert into instructor(ciInstructor,idRol,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,usuario,contrasenia,activo) 
values('12',4,'Jose','Aranibar','Arco 789',77800002,'M','1982-03-20','jose','jose',1);

-- estudiante
insert into estudiante(ciEstudiante,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,activo) 
values('91','Angel','Cardozo','Ayacucho 777',70711110,'M','2000-01-01',1);

insert into estudiante(ciEstudiante,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,activo) 
values('92','Sofia','Soliz','Heroinas 123',70711111,'F','1999-02-12',1);

insert into estudiante(ciEstudiante,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,activo) 
values('93','Armando','Juares','America 95',70711112,'M','2001-03-09',1);

insert into estudiante(ciEstudiante,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,activo) 
values('94','Carolina','Reyes','Oquendo 125',70711113,'F','2002-04-22',1);

insert into estudiante(ciEstudiante,primerNombre,apellidoPaterno,direccion,numeroCelular,genero,fechaNacimiento,activo) 
values('95','Carlos','Lopez','Venezuela 859',70711114,'M','1990-07-26',1);

-- HorarioAsignadoInstructor 
-- Monica Salvatierra
	-- clase avanzado
insert into horarioAsignadoInstructor(ciInstructor,idHoraInicio,idHoraFin,idNivel,idMes,idGestion,cantidadAlumnos) 
values ('11',1,2,4,1,3,20);
	-- clase intermedio
insert into horarioAsignadoInstructor(ciInstructor,idHoraInicio,idHoraFin,idNivel,idMes,idGestion,cantidadAlumnos) 
values ('11',2,3,3,1,3,20);

-- diasClasesInstructorHorario
-- Monica Salvatierra,Avanzado, Lunes-Miercoles-Viernes
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(1,1);
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(1,3);
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(1,5);

-- Monica Salvatierra,Intermedio, Lunes-Miercoles-Viernes
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(2,1);
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(2,3);
insert into diasClasesInstructorHorario(idHorarioAsignadoInstructor,idDia) 
values(2,5);

-- inscripcionMensualidad
-- Instructor: Monica Salvatierra- Est: Angel Cardozo-ci:91 - Avanzado
-- 07:00 -- 08:00
insert into inscripcionMensualidad(idEstudiante,ciUsuario,idHorarioAsignadoInstructor,fechaHora)  
values(1,911,1,'2019-01-01 08:10:15');
-- Sofia Soliz
insert into inscripcionMensualidad(idEstudiante,ciUsuario,idHorarioAsignadoInstructor,fechaHora)  
values(2,911,1,'2019-01-01 08:15:09');
-- Armando Juares
insert into inscripcionMensualidad(idEstudiante,ciUsuario,idHorarioAsignadoInstructor,fechaHora)  
values(3,911,1,'2019-01-01 08:20:45');

-- Asistencia 
-- Est: Angel Cardozo-ci:91 - Avanzado id: 1
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-02 07:00:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-04 06:55:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-07 07:01:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-09 07:02:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-11 07:00:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-14 06:50:45','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-16 07:15:02','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-18 07:15:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-21 07:12:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-23 07:00:02','Asistio');
		-- 2019-01-25
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-25 07:00:00','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-28 06:58:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(1,'2019-01-30 06:57:23','Asistio');






-- Est: Sofia Soliz-ci:92 - Avanzado id: 2
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-02 07:00:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-04 06:55:01','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-07 07:01:01','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-09 07:02:01','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-11 07:00:01','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-14 06:50:45','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-16 07:15:02','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-18 07:15:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-21 07:12:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-23 07:00:02','Falta');
		-- 2019-01-25
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-25 07:00:00','Falta');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-28 06:58:02','Asistio');
insert into asistencia(idInscripcionMensualidad,fechaHora,estadoAsistencia) 
values(2,'2019-01-30 06:57:23','Falta');






 










