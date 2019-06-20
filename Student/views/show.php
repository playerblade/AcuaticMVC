<h2>
    Student Detail
    <a href="<?= Route::link("/student/{$student['idEstudiante']}/edit")?>">[Edit]</a>
</h2>
<strong>Id:</strong>
<?= $student['idEstudiante'] ?>
<br>
<strong>Name:</strong>
<?= $student['primerNombre']?>
