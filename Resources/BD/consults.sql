SELECT e.primerNombre, e.apellidoPaterno, i.primerNombre as instructor, n.nombre as nivel
FROM instructor i JOIN horarioasignadoinstructor hai on i.id = hai.id
    AND i.id = 1
JOIN nivel n on hai.idNivel = n.id
JOIN inscripcionmensualidad im on hai.id = im.id
JOIN estudiante e on im.idEstudiante = e.id;
