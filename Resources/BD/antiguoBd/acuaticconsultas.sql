-- Req1: Asistencia:
		-- tablas: (estudiante,mes,asistencia,dia)
SELECT CONCAT(e.primerNombre,e.apellidoPaterno)AS Student ,a.estadoAsistencia, m.nombre , a.fechaHora,d.nombre
FROM estudiante e INNER JOIN inscripcionMensualidad im
ON e.idEstudiante = im.idEstudiante
INNER JOIN asistencia a ON a.idInscripcionMensualidad = im.idInscripcionMensualidad
INNER JOIN horarioAsignadoInstructor hai ON im. idHorarioAsignadoInstructor = hai.idHorarioAsignadoInstructor
INNER JOIN mes m ON m.idMes = hai.idMes
INNER JOIN diasClasesInstructorHorario dcih ON hai.idHorarioAsignadoInstructor = dcih.idHorarioAsignadoInstructor
INNER JOIN dia d ON dcih.idDia = d.idDia 
GROUP BY a.idAsistencia;

-- Req2 : Asistencia: