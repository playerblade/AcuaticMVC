SELECT e.primerNombre, e.apellidoPaterno, i.primerNombre as instructor, n.nombre as nivel
FROM instructor i JOIN horarioasignadoinstructor hai on i.idInstructor = hai.idInstructor
    AND i.idInstructor = 1
JOIN nivel n on hai.idNivel = n.idNivel
JOIN inscripcionmensualidad im on hai.idHorarioAsignadoInstructor = im.idHorarioAsignadoInstructor
JOIN estudiante e on im.idEstudiante = e.idEstudiante;
