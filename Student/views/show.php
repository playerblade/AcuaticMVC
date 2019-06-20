<h2>
    Student Detail
    <a href="<?= Route::link("/student/{$student['id']}/edit")?>">[Edit]</a>
</h2>
<strong>Id:</strong>
<?= $student['id'] ?>
<br>
<strong>Name:</strong>
<?= $student['primerNombre']?>
